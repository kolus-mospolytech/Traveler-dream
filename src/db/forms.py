from django.contrib.auth.forms import UserCreationForm, UserChangeForm
from django.contrib.auth.models import User

from .models import Employee


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
