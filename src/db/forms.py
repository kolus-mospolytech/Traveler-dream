from django.contrib.auth.forms import UserCreationForm, UserChangeForm

from .models import Employee


class CustomUserCreationForm(UserCreationForm):
    class Meta:
        model = Employee
        fields = ('organization', 'name', 'full_name', 'sex', 'birth_date', 'photo')


class CustomUserChangeForm(UserChangeForm):
    class Meta:
        model = Employee
        fields = ('organization', 'name', 'full_name', 'sex', 'birth_date', 'photo')
