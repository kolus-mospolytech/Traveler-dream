from django.contrib import messages
from django.contrib.auth import authenticate, login, get_user_model
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import Group
from django.shortcuts import render, redirect

from .forms import CreateEmployee, EditEmployee, AddClient, AddInternationalPassport, EditClient, \
    EditInternationalPassport, AddCountry, EditCountry, AddCity, EditCity, AddHotel, EditHotel, AddAgreement
from .models import Client, InternationalPassport, Country, City, Hotel, Agreement
from django.db.models import Q


@login_required(login_url='login')
def index(request):
    context = {
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
    if request.method == 'GET':
        search_query = request.GET.get('search_box', '')
        users_list = get_user_model().objects.filter(
            Q(full_name__icontains=search_query) |
            Q(username__icontains=search_query) |
            Q(organization__name__icontains=search_query) |
            Q(groups__name__icontains=search_query)
        )
    else:
        users_list = get_user_model().objects.all()

    context = {
        'users_list': users_list,
    }
    return render(request, 'Employee/viewEmployee.html', context)


@login_required(login_url='login')
def add_employee(request):
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
        'form': form,
        'position': position,
    }
    return render(request, 'Employee/addEmployee.html', context)


@login_required(login_url='login')
def edit_employee(request, pk):
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
        'employee': user,
        'form': form,
        'position': position,
    }
    return render(request, 'Employee/editEmployee.html', context)


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
        'employee': user,
    }
    return render(request, 'Employee/deleteEmployee.html', context)


@login_required(login_url='login')
def view_client(request):
    if request.method == 'GET':
        search_query = request.GET.get('search_box', '')
        client_list = Client.objects.filter(
            Q(full_name__icontains=search_query) |
            Q(status__name__icontains=search_query) |
            Q(sex__icontains=search_query)
        )
    else:
        client_list = Client.objects.all()

    passport_list = InternationalPassport.objects.all()

    context = {
        'client_list': client_list,
        'passport_list': passport_list,
    }
    return render(request, 'Client/viewClient.html', context)


@login_required(login_url='login')
def add_client(request):
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
        'form_client': form_client,
        'form_passport': form_passport,

    }
    return render(request, 'Client/addClient.html', context)


@login_required(login_url='login')
def edit_client(request, pk):
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
        'client': client,
        'passport': passport,
        'form_client': form_client,
        'form_passport': form_passport,
    }
    return render(request, 'Client/editClient.html', context)


@login_required(login_url='login')
def delete_client(request, pk):
    client = Client.objects.get(id=pk)
    passport = InternationalPassport.objects.get(client_id=pk)

    if request.method == 'POST':
        passport.delete()
        client.delete()
        messages.info(request, 'Клиент успешно удален')
        return redirect('viewClient')
    context = {
        'client': client,
    }
    return render(request, 'Client/deleteClient.html', context)


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
    return render(request, 'Client/addInternationalPassport.html', context)


@login_required(login_url='login')
def view_country(request):
    if request.method == 'GET':
        search_query = request.GET.get('search_box', '')
        countries_list = Country.objects.filter(
            Q(name__icontains=search_query)
        )
    else:
        countries_list = Country.objects.all()

    context = {
        'countries_list': countries_list,
    }
    return render(request, 'Geo/Country/viewCountry.html', context)


@login_required(login_url='login')
def add_country(request):
    form = AddCountry()
    if request.method == 'POST':
        form = AddCountry(request.POST, request.FILES)
        if form.is_valid():
            new_country = form.save(commit=False)
            new_country.save()
            messages.info(request, 'Запись успешна добавлена')
            if 'save_and_exit' in request.POST:
                return redirect('viewCountry')
            elif 'save_and_edit' in request.POST:
                return redirect('editCountry', pk=new_country.id)
        else:
            messages.info(request, form.errors)

    context = {
        'form': form,
    }
    return render(request, 'Geo/Country/addCountry.html', context)


@login_required(login_url='login')
def edit_country(request, pk):
    country = Country.objects.get(id=pk)
    form = EditCountry(instance=country)
    if request.method == 'POST':
        form = EditCountry(request.POST, request.FILES, instance=country)
        if form.is_valid():
            new_country = form.save(commit=False)
            new_country.save()
            messages.info(request, 'Запись успешна сохранена')
            if 'save_and_exit' in request.POST:
                return redirect('viewCountry')
            elif 'save' in request.POST:
                return redirect('editCountry', pk)
        else:
            messages.error(request, form.errors)

    context = {
        'form': form,
    }
    return render(request, 'Geo/Country/editCountry.html', context)


@login_required(login_url='login')
def delete_country(request, pk):
    country = Country.objects.get(id=pk)
    if request.method == 'POST':
        country.delete()
        messages.info(request, 'Страна ' + country.name + ' успешно удалена')
        return redirect('viewCountry')
    context = {
        'country': country,
    }
    return render(request, 'Geo/Country/deleteCountry.html', context)


@login_required(login_url='login')
def view_city(request):
    if request.method == 'GET':
        search_query = request.GET.get('search_box', '')
        cities_list = City.objects.all().filter(
            Q(name__icontains=search_query) |
            Q(country__name__icontains=search_query)
        )
    else:
        cities_list = City.objects.all()

    context = {
        'cities_list': cities_list,
    }
    return render(request, 'Geo/City/viewCity.html', context)


@login_required(login_url='login')
def add_city(request):
    form = AddCity()
    if request.method == 'POST':
        form = AddCity(request.POST, request.FILES)
        if form.is_valid():
            new_city = form.save(commit=False)
            new_city.save()
            messages.info(request, 'Запись успешна добавлена')
            if 'save_and_exit' in request.POST:
                return redirect('viewCity')
            elif 'save_and_edit' in request.POST:
                return redirect('editCity', pk=new_city.id)
        else:
            messages.info(request, form.errors)

    context = {
        'form': form,
    }
    return render(request, 'Geo/City/addCity.html', context)


@login_required(login_url='login')
def edit_city(request, pk):
    city = City.objects.get(id=pk)
    form = EditCity(instance=city)
    if request.method == 'POST':
        form = EditCity(request.POST, request.FILES, instance=city)
        if form.is_valid():
            new_city = form.save(commit=False)
            new_city.save()
            messages.info(request, 'Запись успешна сохранена')
            if 'save_and_exit' in request.POST:
                return redirect('viewCity')
            elif 'save' in request.POST:
                return redirect('editCity', pk)
        else:
            messages.error(request, form.errors)

    context = {
        'form': form,
    }
    return render(request, 'Geo/City/editCity.html', context)


@login_required(login_url='login')
def delete_city(request, pk):
    city = City.objects.get(id=pk)
    if request.method == 'POST':
        city.delete()
        messages.info(request, 'Город ' + city.name + ' успешно удален')
        return redirect('viewCity')
    context = {
        'city': city,
    }
    return render(request, 'Geo/City/deleteCity.html', context)


@login_required(login_url='login')
def view_hotel(request):
    if request.method == 'GET':
        search_query = request.GET.get('search_box', '')
        hotels_list = Hotel.objects.all().filter(
            Q(name__icontains=search_query) |
            Q(city__name__icontains=search_query) |
            Q(type__name__icontains=search_query)
        )
    else:
        hotels_list = Hotel.objects.all()

    context = {
        'hotels_list': hotels_list,
    }
    return render(request, 'Geo/Hotel/viewHotel.html', context)


@login_required(login_url='login')
def add_hotel(request):
    form = AddHotel()
    if request.method == 'POST':
        form = AddHotel(request.POST, request.FILES)
        if form.is_valid():
            new_hotel = form.save(commit=False)
            new_hotel.save()
            messages.info(request, 'Запись успешна добавлена')
            if 'save_and_exit' in request.POST:
                return redirect('viewHotel')
            elif 'save_and_edit' in request.POST:
                return redirect('editHotel', pk=new_hotel.id)
        else:
            messages.info(request, form.errors)

    context = {
        'form': form,
    }
    return render(request, 'Geo/Hotel/addHotel.html', context)


@login_required(login_url='login')
def edit_hotel(request, pk):
    hotel = Hotel.objects.get(id=pk)
    form = EditHotel(instance=hotel)
    if request.method == 'POST':
        form = EditHotel(request.POST, request.FILES, instance=hotel)
        if form.is_valid():
            new_hotel = form.save(commit=False)
            new_hotel.save()
            messages.info(request, 'Запись успешна сохранена')
            if 'save_and_exit' in request.POST:
                return redirect('viewHotel')
            elif 'save' in request.POST:
                return redirect('editHotel', pk)
        else:
            messages.error(request, form.errors)

    context = {
        'form': form,
    }
    return render(request, 'Geo/Hotel/editHotel.html', context)


@login_required(login_url='login')
def delete_hotel(request, pk):
    hotel = Hotel.objects.get(id=pk)
    if request.method == 'POST':
        hotel.delete()
        messages.info(request, 'Отель ' + hotel.name + ' успешно удален')
        return redirect('viewHotel')
    context = {
        'hotel': hotel,
    }
    return render(request, 'Geo/Hotel/deleteHotel.html', context)

@login_required(login_url='login')
def view_agreement(request):
    if request.method == 'GET':
        search_query = request.GET.get('search_box', '')
        agreements_list = Agreement.objects.all().filter(
            Q(id__icontains=search_query) |
            Q(creation_date__icontains=search_query) |
            Q(organization__name__icontains=search_query)
        )
    else:
        agreements_list = Agreement.objects.all()

    context = {
        'agreements_list': agreements_list,
    }
    return render(request, 'Business/Agreement/viewAgreement.html', context)


@login_required(login_url='login')
def add_agreement(request):
    form = AddAgreement()
    if request.method == 'POST':
        form = AddAgreement(request.POST, request.FILES)
        if form.is_valid():
            new_agreement = form.save(commit=False)
            new_agreement.save()
            messages.info(request, 'Запись успешна добавлена')
            if 'save_and_exit' in request.POST:
                return redirect('viewAgreement')
            elif 'save_and_edit' in request.POST:
                return redirect('editAgreement', pk=new_agreement.id)
        else:
            messages.info(request, form.errors)

    context = {
        'form': form,
    }
    return render(request, 'Business/Agreement/addAgreement.html', context)


@login_required(login_url='login')
def edit_agreement(request, pk):
    hotel = Hotel.objects.get(id=pk)
    form = EditHotel(instance=hotel)
    if request.method == 'POST':
        form = EditHotel(request.POST, request.FILES, instance=hotel)
        if form.is_valid():
            new_hotel = form.save(commit=False)
            new_hotel.save()
            messages.info(request, 'Запись успешна сохранена')
            if 'save_and_exit' in request.POST:
                return redirect('viewHotel')
            elif 'save' in request.POST:
                return redirect('editHotel', pk)
        else:
            messages.error(request, form.errors)

    context = {
        'form': form,
    }
    return render(request, 'Geo/Hotel/editHotel.html', context)


@login_required(login_url='login')
def delete_agreement(request, pk):
    hotel = Hotel.objects.get(id=pk)
    if request.method == 'POST':
        hotel.delete()
        messages.info(request, 'Отель ' + hotel.name + ' успешно удален')
        return redirect('viewHotel')
    context = {
        'hotel': hotel,
    }
    return render(request, 'Geo/Hotel/deleteHotel.html', context)
