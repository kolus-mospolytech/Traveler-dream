import logging

from django.contrib import messages
from django.contrib.auth.forms import UserCreationForm
from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login, logout, get_user_model
from django.contrib.auth.decorators import login_required

from .models import RoomType, Client, InternationalPassport
from .forms import CreateUserForm, CreateEmployee, EditEmployee, AddClient, AddInternationalPassport


@login_required(login_url='login')
def index(request):
    room = RoomType.objects.all()
    context = {
        'name': room,
    }
    return render(request, 'index.html', context)


# def register_page(request):
#     if request.user.is_authenticated:
#         return redirect('home')
#     form = UserCreationForm()
#
#     if request.method == 'POST':
#         form = CreateUserForm(request.POST)
#         if form.is_valid():
#             form.save()
#
#     context = {
#         'form': form,
#     }
#
#     return render(request, 'register.html', context)


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
    # group_list = request.user.groups.values()
    # name = request.user.objects.values()
    users_list = get_user_model().objects.values()
    context = {
        # 'group_list': group_list,
        # 'name': name,
        'users_list': users_list,
    }
    return render(request, 'Administrator/viewEmployee.html', context)


@login_required(login_url='login')
def add_employee(request):
    form = CreateEmployee()
    if request.method == 'POST':
        form = CreateEmployee(request.POST, request.FILES)
        if form.is_valid():
            new_user = form.save(commit=False)
            # new_user.photo = request.FILES['photo']
            new_user.save()
            messages.info(request, 'Запись успешна добавлена')
        else:
            messages.info(request, form.errors)

    context = {
        'form': form,
    }
    return render(request, 'Administrator/addEmployee.html', context)


@login_required(login_url='login')
def edit_employee(request, pk):
    user = get_user_model().objects.get(id=pk)
    form = EditEmployee(instance=user)

    if request.method == 'POST':
        form = EditEmployee(request.POST, request.FILES, instance=user)
        if form.is_valid():
            new_user = form.save(commit=False)
            new_user.save()
            messages.info(request, 'Запись успешна сохранена')
        else:
            messages.error(request, form.errors)

    context = {
        'user': user,
        'form': form
    }
    return render(request, 'Administrator/editEmployee.html', context)


@login_required(login_url='login')
def delete_employee(request, pk):
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
        'user': user,
    }
    return render(request, 'Administrator/deleteEmployee.html', context)


@login_required(login_url='login')
def add_client(request):
    form = AddClient()
    if request.method == 'POST':
        form = AddClient(request.POST)
        if form.is_valid():
            client = form.save(commit=False)
            client.save()
            messages.info(request, "Клиент успешно создан")
            return redirect('addPassport', client.id)
        else:
            messages.error(request, form.errors)
    context = {
        'form': form
    }
    return render(request, 'Administrator/addClient.html', context)


@login_required(login_url='login')
def add_passport(request, pk):
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
        'form': form,
    }
    return render(request, 'Administrator/addInternationalPassport.html', context)
