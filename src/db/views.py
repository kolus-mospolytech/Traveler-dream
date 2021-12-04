from django.contrib import messages
from django.contrib.auth import authenticate, login, get_user_model
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import Group
from django.shortcuts import render, redirect

from .forms import CreateEmployee, EditEmployee, AddClient, AddInternationalPassport, EditClient, \
    EditInternationalPassport
from .managers import CustomUserManager
from .models import Client, InternationalPassport, Employee


@login_required(login_url='login')
def index(request):
    logger_in_user = request.user
    context = {
        'logger_in_user': logger_in_user,
    }
    return render(request, 'index.html', context)


def login_page(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')

        user = authenticate(request, username=username, password=password)

        if user is not None:
            login(request, user)
            return redirect('home')
        else:
            messages.info(request, 'Неправильно введен логин или пароль')

    context = {
    }
    return render(request, 'login.html', context)


@login_required(login_url='login')
def view_employee(request):
    logger_in_user = request.user
    users_list = get_user_model().objects.all()
    context = {
        'logger_in_user': logger_in_user,
        'users_list': users_list,
    }
    return render(request, 'Employee/viewEmployee.html', context)


@login_required(login_url='login')
def add_employee(request):
    logger_in_user = request.user
    form = CreateEmployee()
    position = request.POST.get('position')
    if request.method == 'POST':
        form = CreateEmployee(request.POST, request.FILES)
        if form.is_valid():
            new_user = form.save(commit=False)
            new_user.set_password(form.instance.password)
            new_user.save()
            new_user.groups.add(Group.objects.get(id=position))
            messages.info(request, 'Запись успешна добавлена')
            if 'save_and_exit' in request.POST:
                return redirect('viewEmployee')
            elif 'save_and_edit' in request.POST:
                return redirect('editEmployee', pk=new_user.id)
        else:
            messages.info(request, form.errors)

    context = {
        'logger_in_user': logger_in_user,
        'form': form,
        'position': position,
    }
    return render(request, 'Employee/addEmployee.html', context)


@login_required(login_url='login')
def edit_employee(request, pk):
    logger_in_user = request.user
    user = get_user_model().objects.get(id=pk)
    if user.groups.all().count() != 0:
        position = str(list(user.groups.all())[0]).lower()
    else:
        position = 'Agent'
    form = EditEmployee(instance=user)
    if request.method == 'POST':
        form = EditEmployee(request.POST, request.FILES, instance=user)
        if form.is_valid():
            new_position = request.POST.get('position')
            new_user = form.save(commit=False)
            new_user.save()
            new_user.groups.clear()
            new_user.groups.add(Group.objects.get(id=new_position))
            messages.info(request, 'Запись успешна сохранена')
            if 'save_and_exit' in request.POST:
                return redirect('viewEmployee')
            elif 'save' in request.POST:
                return redirect('editEmployee', pk)
        else:
            messages.error(request, form.errors)

    context = {
        'logger_in_user': logger_in_user,
        'user': user,
        'form': form,
        'position': position,
    }
    return render(request, 'Employee/editEmployee.html', context)


@login_required(login_url='login')
def delete_employee(request, pk):
    logger_in_user = request.user
    user = get_user_model().objects.get(id=pk)
    if request.method == 'POST':
        if user.is_superuser != 1:
            user.delete()
            messages.info(request, 'Пользователь ' + user.name + ' успешно удален')
            return redirect('viewEmployee')
        else:
            messages.error(request, 'Невозможно удалить пользователя')
            redirect('deletedEmployee', pk)
    context = {
        'logger_in_user': logger_in_user,
        'user': user,
    }
    return render(request, 'Employee/deleteEmployee.html', context)


@login_required(login_url='login')
def view_client(request):
    logger_in_user = request.user
    client_list = Client.objects.all()
    passport_list = InternationalPassport.objects.all()

    context = {
        'logger_in_user': logger_in_user,
        'client_list': client_list,
        'passport_list': passport_list,
    }
    return render(request, 'Client/viewClient.html', context)


@login_required(login_url='login')
def add_client(request):
    logger_in_user = request.user
    form_client = AddClient()
    form_passport = AddInternationalPassport()

    if request.method == 'POST':
        form_client = AddClient(request.POST)
        form_passport = AddInternationalPassport(request.POST)

        if form_client.is_valid():
            client = form_client.save(commit=False)
            client.save()
            if form_passport.is_valid():
                passport = form_passport.save(commit=False)
                passport.client = Client.objects.get(id=client.id)
                passport.save()
                messages.info(request, "Клиент успешно создан")
                if 'save_and_exit' in request.POST:
                    return redirect('viewClient')
                elif 'save_and_edit' in request.POST:
                    return redirect('editClient', pk=client.id)
            else:
                client.delete()
                messages.error(request, form_passport.errors)
        else:
            messages.error(request, form_client.errors)
    context = {
        'logger_in_user': logger_in_user,
        'form_client': form_client,
        'form_passport': form_passport,

    }
    return render(request, 'Client/addClient.html', context)


@login_required(login_url='login')
def edit_client(request, pk):
    logger_in_user = request.user
    client = Client.objects.get(id=pk)
    passport = InternationalPassport.objects.get(client_id=pk)
    form_client = EditClient(instance=client)
    form_passport = EditInternationalPassport(instance=passport)

    if request.method == 'POST':
        form_client = EditClient(request.POST, instance=client)
        form_passport = EditInternationalPassport(request.POST, instance=passport)

        if form_client.is_valid() & form_passport.is_valid():
            new_client = form_client.save(commit=False)
            new_client.save()
            new_passport = form_passport.save(commit=False)
            new_passport.save()
            messages.info(request, 'Запись успешна сохранена')
            if 'save_and_exit' in request.POST:
                return redirect('viewClient')
            elif 'save' in request.POST:
                return redirect('editClient', pk)
        else:
            messages.error(request, form_client.errors)
            messages.error(request, form_passport.errors)

    context = {
        'logger_in_user': logger_in_user,
        'client': client,
        'passport': passport,
        'form_client': form_client,
        'form_passport': form_passport,
    }
    return render(request, 'Client/editClient.html', context)


@login_required(login_url='login')
def delete_client(request, pk):
    logger_in_user = request.user
    client = Client.objects.get(id=pk)
    passport = InternationalPassport.objects.get(client_id=pk)

    if request.method == 'POST':
        passport.delete()
        client.delete()
        messages.info(request, 'Клиент успешно удален')
        return redirect('viewClient')
    context = {
        'logger_in_user': logger_in_user,
        'client': client,
    }
    return render(request, 'Client/deleteClient.html', context)


@login_required(login_url='login')
def add_passport(request, pk):
    logger_in_user = request.user
    form = AddInternationalPassport()
    if request.method == 'POST':
        form = AddInternationalPassport(request.POST)
        if form.is_valid():
            if not InternationalPassport.objects.filter(client_id=pk):
                passport = form.save(commit=False)
                passport.client = Client.objects.get(id=pk)
                passport.save()
                messages.info(request, "Паспорт успешно создан")
            else:
                messages.error(request, "Паспорт уже существует")
        else:
            messages.error(request, form.errors)
    context = {
        'logger_in_user': logger_in_user,
        'form': form,
    }
    return render(request, 'Client/addInternationalPassport.html', context)
