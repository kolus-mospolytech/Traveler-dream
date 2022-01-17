from django.contrib import admin

from .models import Country, City, HotelType, Hotel, FeedingType, RoomType


@admin.register(Country)
class CountryAdmin(admin.ModelAdmin):
    search_fields = ('name',)
    ordering = ('name',)


@admin.register(City)
class CityAdmin(admin.ModelAdmin):
    list_display = ('name', 'country',)
    search_fields = ('name', 'country__name',)
    ordering = ('name',)
    autocomplete_fields = ('country',)


@admin.register(HotelType)
class HotelTypeAdmin(admin.ModelAdmin):
    search_fields = ('name', 'description',)
    ordering = ('name',)


@admin.register(Hotel)
class HotelAdmin(admin.ModelAdmin):
    list_display = ('name', 'city', 'type',)
    list_filter = ('type',)
    search_fields = ('name', 'city',)
    ordering = ('name',)
    autocomplete_fields = ('city', 'type',)


@admin.register(FeedingType)
class FeedingTypeAdmin(admin.ModelAdmin):
    search_fields = ('name', 'description',)
    ordering = ('name',)


@admin.register(RoomType)
class RoomTypeAdmin(admin.ModelAdmin):
    search_fields = ('name', 'description',)
    ordering = ('name',)
