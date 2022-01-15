from django.contrib.auth.models import AbstractBaseUser, PermissionsMixin
from django.contrib.auth.models import User, Group
from django.db import models


class Country(models.Model):
    name = models.CharField('Название', max_length=45)

    def __str__(self):
        template = '{0.name}'
        return template.format(self)

    class Meta:
        verbose_name = 'Страна'
        verbose_name_plural = 'Страны'


class City(models.Model):
    country = models.ForeignKey(Country, on_delete=models.CASCADE, db_column='country', verbose_name='Страна')
    name = models.CharField('Название', max_length=45)

    def __str__(self):
        template = '{0.name}'
        return template.format(self)

    class Meta:
        unique_together = (('id', 'country'),)
        verbose_name = 'Город'
        verbose_name_plural = 'Города'


class HotelType(models.Model):
    name = models.CharField('Название', max_length=45)
    description = models.TextField('Описание', max_length=255, blank=True, null=True)

    def __str__(self):
        template = '{0.name}'
        return template.format(self)

    class Meta:
        verbose_name = 'Тип отеля'
        verbose_name_plural = 'Типы отелей'


class Hotel(models.Model):
    city = models.ForeignKey(City, on_delete=models.CASCADE, db_column='city', verbose_name='Город')
    type = models.ForeignKey(HotelType, on_delete=models.CASCADE, db_column='type', verbose_name='Тип отеля')
    name = models.CharField('Название', max_length=45)
    address = models.TextField('Адрес', max_length=255)

    def __str__(self):
        template = '{0.name}'
        return template.format(self)

    class Meta:
        unique_together = (('id', 'city'),)
        verbose_name = 'Отель'
        verbose_name_plural = 'Отели'


class FeedingType(models.Model):
    name = models.CharField('Название', max_length=45)
    description = models.TextField('Описание', max_length=255, blank=True, null=True)

    def __str__(self):
        template = '{0.name}'
        return template.format(self)

    class Meta:
        verbose_name = 'Тип питания'
        verbose_name_plural = 'Типы питания'


class RoomType(models.Model):
    name = models.CharField('Название', max_length=45)
    description = models.TextField('Описание', max_length=255, blank=True, null=True)

    def __str__(self):
        template = '{0.name}'
        return template.format(self)

    class Meta:
        verbose_name = 'Тип комнаты'
        verbose_name_plural = 'Типы комнаты'
