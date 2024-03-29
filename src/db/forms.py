from django import forms
from django.contrib.auth.forms import UserCreationForm, UserChangeForm
from django.contrib.auth.models import User
from django.forms import ModelForm

from .models import Client, Employee, InternationalPassport, Country, City, Hotel, Agreement


class CustomUserCreationForm(UserCreationForm):
    class Meta:
        model = Employee
        fields = ('organization', 'name', 'full_name', 'sex', 'birth_date', 'photo')


class CustomUserChangeForm(UserChangeForm):
    class Meta:
        model = Employee
        fields = ('organization', 'name', 'full_name', 'sex', 'birth_date', 'photo')


class CreateUserForm(UserCreationForm):
    class Meta:
        model = User
        fields = ['username', 'email', 'password1', 'password2']


class AddEmployeeGroup(ModelForm):
    class Meta:
        model = User
        widgets = {
            'name': forms.Select(attrs={'required': 'required'})
        }
        fields = '__all__'


class CreateEmployee(ModelForm):
    class Meta:
        model = Employee
        widgets = {
            'birth_date': forms.DateInput(format='%Y-%m-%d',
                                          attrs={'class': 'form-control', 'placeholder': 'Select a date',
                                                 'type': 'date', 'required': 'required'}),
            'username': forms.TextInput(attrs={'required': 'required'}),
            'password': forms.PasswordInput(attrs={'required': 'required'}),
            'name': forms.TextInput(attrs={'required': 'required'}),
            'full_name': forms.TextInput(attrs={'required': 'required'}),
            'sex': forms.Select(attrs={'required': 'required'}),
            'organization': forms.Select(attrs={'required': 'required'}),
            'is_staff': forms.HiddenInput(),
            'is_active': forms.HiddenInput(),
            'date_joined': forms.HiddenInput(attrs={'class': 'form-control', 'placeholder': 'Select a date'}),
            'is_superuser': forms.HiddenInput(),
            'photo': forms.FileInput(attrs={}),
        }
        fields = ['username', 'password', 'name', 'full_name', 'is_staff', 'is_active', 'groups',
                  'birth_date', 'sex', 'organization', 'photo', 'date_joined', 'is_superuser']
        exclude = ['groups']


class EditEmployee(ModelForm):
    class Meta:
        model = Employee
        widgets = {
            'birth_date': forms.DateInput(format='%Y-%m-%d',
                                          attrs={'class': 'form-control', 'placeholder': 'Select a date',
                                                 'type': 'date', 'required': 'required'}),
            'name': forms.TextInput(attrs={'required': 'required'}),
            'full_name': forms.TextInput(attrs={'required': 'required'}),
            'sex': forms.Select(attrs={'required': 'required'}),
            'photo': forms.FileInput(attrs={}),
            'organization': forms.Select(attrs={'required': 'required'}),
            'groups': forms.Select(attrs={'required': 'required'}),
        }
        fields = ['name', 'full_name', 'groups', 'birth_date', 'sex', 'organization', 'photo']


class AddClient(ModelForm):
    class Meta:
        model = Client
        widgets = {
            'name': forms.TextInput(attrs={'required': 'required'}),
            'full_name': forms.TextInput(attrs={'required': 'required'}),
            'sex': forms.Select(attrs={'required': 'required'}),
            'status': forms.Select(attrs={'required': 'required'}),
        }
        fields = '__all__'


class EditClient(ModelForm):
    class Meta:
        model = Client
        widgets = {
            'name': forms.TextInput(attrs={'required': 'required'}),
            'full_name': forms.TextInput(attrs={'required': 'required'}),
            'sex': forms.Select(attrs={'required': 'required'}),
            'status': forms.Select(attrs={'required': 'required'}),
        }
        fields = '__all__'


class AddInternationalPassport(ModelForm):
    class Meta:
        model = InternationalPassport
        widgets = {
            'series': forms.NumberInput(attrs={'required': 'required'}),
            'number': forms.NumberInput(attrs={'required': 'required'}),
            'birth_date': forms.DateInput(format='%Y-%m-%d',
                                          attrs={'class': 'form-control', 'placeholder': 'Select a date',
                                                 'type': 'date', 'required': 'required'}),
            'birth_place': forms.TextInput(attrs={'required': 'required'}),
            'issue_date': forms.DateInput(format='%Y-%m-%d',
                                          attrs={'class': 'form-control', 'placeholder': 'Select a date',
                                                 'type': 'date', 'required': 'required'}),
            'expiry_date': forms.DateInput(format='%Y-%m-%d',
                                           attrs={'class': 'form-control', 'placeholder': 'Select a date',
                                                  'type': 'date', 'required': 'required'}),
            'authority': forms.TextInput(attrs={'required': 'required'}),
            'client': forms.HiddenInput(attrs={})
        }
        fields = ['series', 'number', 'birth_date', 'birth_place', 'issue_date', 'expiry_date', 'authority', 'client']
        exclude = ['client']


class EditInternationalPassport(ModelForm):
    class Meta:
        model = InternationalPassport
        widgets = {
            'series': forms.NumberInput(attrs={'required': 'required'}),
            'number': forms.NumberInput(attrs={'required': 'required'}),
            'birth_date': forms.DateInput(format='%Y-%m-%d',
                                          attrs={'class': 'form-control', 'placeholder': 'Select a date',
                                                 'type': 'date', 'required': 'required'}),
            'birth_place': forms.TextInput(attrs={'required': 'required'}),
            'issue_date': forms.DateInput(format='%Y-%m-%d',
                                          attrs={'class': 'form-control', 'placeholder': 'Select a date',
                                                 'type': 'date', 'required': 'required'}),
            'expiry_date': forms.DateInput(format='%Y-%m-%d',
                                           attrs={'class': 'form-control', 'placeholder': 'Select a date',
                                                  'type': 'date', 'required': 'required'}),
            'authority': forms.TextInput(attrs={'required': 'required'}),
            'client': forms.HiddenInput(attrs={})
        }
        fields = ['series', 'number', 'birth_date', 'birth_place', 'issue_date', 'expiry_date', 'authority', 'client']
        exclude = ['client']


class AddCountry(ModelForm):
    class Meta:
        model = Country
        widgets = {
            'name': forms.TextInput(attrs={'required': 'required'}),
        }
        fields = '__all__'


class EditCountry(ModelForm):
    class Meta:
        model = Country
        widgets = {
            'name': forms.TextInput(attrs={'required': 'required'}),
        }
        fields = '__all__'


class AddCity(ModelForm):
    class Meta:
        model = City
        widgets = {
            'name': forms.TextInput(attrs={'required': 'required'}),
            'country': forms.Select(attrs={'required': 'required'}),
        }
        fields = '__all__'


class EditCity(ModelForm):
    class Meta:
        model = City
        widgets = {
            'name': forms.TextInput(attrs={'required': 'required'}),
            'country': forms.Select(attrs={'required': 'required'}),
        }
        fields = '__all__'


class AddHotel(ModelForm):
    class Meta:
        model = Hotel
        widgets = {
            'city': forms.Select(attrs={'required': 'required'}),
            'type': forms.Select(attrs={'required': 'required'}),
            'name': forms.TextInput(attrs={'required': 'required'}),
            'address': forms.Textarea(attrs={'required': 'required'}),
        }
        fields = '__all__'


class EditHotel(ModelForm):
    class Meta:
        model = Hotel
        widgets = {
            'city': forms.Select(attrs={'required': 'required'}),
            'type': forms.Select(attrs={'required': 'required'}),
            'name': forms.TextInput(attrs={'required': 'required'}),
            'address': forms.Textarea(attrs={'required': 'required'}),
        }
        fields = '__all__'


class AddAgreement(ModelForm):
    class Meta:
        model = Agreement
        widgets = {
            'organization': forms.Select(attrs={'required': 'required'}),
            'agent': forms.Select(attrs={}),
            'client': forms.Select(attrs={'required': 'required'}),
            'country': forms.Select(attrs={'required': 'required'}),
            'cities': forms.SelectMultiple(attrs={'required': 'required'}),
            'trip_start': forms.DateInput(attrs={'required': 'required'}),
            'trip_end': forms.DateInput(attrs={'required': 'required'}),
        }
        fields = ['organization', 'agent', 'client', 'country', 'cities', 'trip_start', 'trip_end']
        exclude = ['creation_date']


class EditAgreement(ModelForm):
    class Meta:
        model = Agreement
        widgets = {
            'organization': forms.Select(attrs={'required': 'required'}),
            'agent': forms.Select(attrs={}),
            'client': forms.Select(attrs={'required': 'required'}),
            'country': forms.Select(attrs={'required': 'required'}),
            'cities': forms.SelectMultiple(attrs={'required': 'required'}),
            'trip_start': forms.DateInput(attrs={'required': 'required'}),
            'trip_end': forms.DateInput(attrs={'required': 'required'}),
        }
        fields = ['organization', 'agent', 'client', 'country', 'cities', 'trip_start', 'trip_end']
        exclude = ['creation_date']
