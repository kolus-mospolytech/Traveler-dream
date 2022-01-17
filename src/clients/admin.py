from django.contrib import admin

from .models import Status, Client, Passport


@admin.register(Status)
class StatusAdmin(admin.ModelAdmin):
    search_fields = ('name', 'description',)
    ordering = ('name',)


class PassportInline(admin.StackedInline):
    model = Passport


@admin.register(Client)
class ClientAdmin(admin.ModelAdmin):
    inlines = (PassportInline,)
    list_display = ('name', 'status',)
    list_filter = ('status', 'sex',)
    search_fields = ('name', 'sex',)
    ordering = ('name',)
    autocomplete_fields = ('status',)
    fieldsets = (
        (None, {'fields': (
            'status', 'name', 'full_name', 'sex',)}),
    )
