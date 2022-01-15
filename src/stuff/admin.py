from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from django.contrib.auth.models import Group

from .forms import CustomUserCreationForm, CustomUserChangeForm
from .models import Employee, Position, Organization


@admin.register(Organization)
class OrganizationAdmin(admin.ModelAdmin):
    search_fields = ('name', 'address', 'phone', 'mail',)
    ordering = ('name',)


@admin.register(Position)
class PositionAdmin(admin.ModelAdmin):
    search_fields = ('name',)
    ordering = ('name',)
    filter_horizontal = ('permissions',)

    def formfield_for_manytomany(self, db_field, request=None, **kwargs):
        if db_field.name == 'permissions':
            qs = kwargs.get('queryset', db_field.remote_field.model.objects)
            kwargs['queryset'] = qs.select_related('content_type')
        return super().formfield_for_manytomany(db_field, request=request, **kwargs)


@admin.register(Employee)
class CustomUserAdmin(UserAdmin):
    add_form = CustomUserCreationForm
    form = CustomUserChangeForm
    model = Employee
    list_display = ('name', 'organization', 'groups', 'username', 'is_active',)
    list_filter = ('organization', 'groups', 'is_active',)
    search_fields = ('name', 'organization', 'groups', 'username', 'is_active',)
    ordering = ('name', 'organization',)
    filter_horizontal = ()
    autocomplete_fields = ('organization', 'groups',)
    readonly_fields = ('image_tag',)

    def get_fieldsets(self, request, obj=None):
        if request.user.is_superuser:
            fieldsets = (
                (None, {'fields': (
                    'username', 'password', 'organization', 'groups', 'name', 'full_name', 'sex', 'birth_date',
                    'image_tag', 'photo', 'is_active', 'is_superuser',)}),
            )
        else:
            fieldsets = (
                (None, {'fields': (
                    'username', 'password', 'organization', 'groups', 'name', 'full_name', 'sex', 'birth_date',
                    'image_tag', 'photo', 'is_active',)}),
            )

        return fieldsets

    add_fieldsets = (
        (None, {'fields': (
            'username', 'password1', 'password2', 'name', 'full_name', 'sex', 'birth_date', 'photo',
            'organization', 'groups', 'is_active',)}),
    )


admin.site.unregister(Group)
