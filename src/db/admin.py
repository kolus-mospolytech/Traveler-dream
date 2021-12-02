from django.contrib import admin
from django.contrib.auth.admin import UserAdmin

from .forms import CustomUserCreationForm, CustomUserChangeForm
from .models import Employee


class CustomUserAdmin(UserAdmin):
    add_form = CustomUserCreationForm
    form = CustomUserChangeForm
    model = Employee
    list_display = (
    'username', 'organization', 'name', 'full_name', 'sex', 'birth_date', 'photo', 'is_staff', 'is_active',)
    list_filter = ('username', 'name', 'is_staff', 'is_active',)
    fieldsets = (
        (
        None, {'fields': ('username', 'password', 'organization', 'name', 'full_name', 'sex', 'birth_date', 'photo',)}),
        ('Permissions', {'fields': ('is_staff', 'is_active', 'is_superuser', 'groups', 'user_permissions')}),
    )
    add_fieldsets = (
        (None, {
            'classes': ('wide',),
            'fields': (
            'username', 'password1', 'password2', 'organization', 'name', 'full_name', 'sex', 'birth_date', 'photo',
            'is_staff', 'is_active',)}
         ),
    )
    search_fields = ('username', 'name',)
    ordering = ('username', 'name',)


admin.site.register(Employee, CustomUserAdmin)
