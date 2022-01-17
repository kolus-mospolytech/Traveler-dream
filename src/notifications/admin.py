from django.contrib import admin
from django.utils.html import format_html

from .models import Notification


@admin.register(Notification)
class NotificationAdmin(admin.ModelAdmin):
    model = Notification
    list_display = ('user', 'show_url', 'done',)
    fields = ('user', 'show_url', 'done',)
    list_filter = ('done',)
    search_fields = ('user', 'show_url', 'done',)
    readonly_fields = ('user', 'show_url',)

    def show_url(self, obj):
        return format_html("<a href='{url}'>{url}</a>", url=obj.link)

    show_url.short_description = 'Ссылка'

