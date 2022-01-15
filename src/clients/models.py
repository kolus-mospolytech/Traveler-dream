from django.contrib.auth.models import AbstractBaseUser, PermissionsMixin
from django.contrib.auth.models import User, Group
from django.db import models
from django.utils import timezone


class Status(models.Model):
    name = models.CharField('Название', max_length=45)
    description = models.CharField('Описание', max_length=255, blank=True, null=True)

    def __str__(self):
        template = '{0.name}'
        return template.format(self)

    class Meta:
        verbose_name = 'Статус Клиента'
        verbose_name_plural = 'Статусы Клиентов'


class Client(models.Model):
    class Sex(models.TextChoices):
        MALE = 'Мужчина', 'Мужчина'
        FEMALE = 'Женщина', 'Женщина'

    status = models.ForeignKey(Status, on_delete=models.DO_NOTHING, db_column='status', verbose_name='Статус',
                               blank=False)
    name = models.CharField('Имя', max_length=45)
    full_name = models.CharField('ФИО', max_length=255)
    sex = models.CharField('Пол', max_length=7, choices=Sex.choices, blank=False)

    def __str__(self):
        template = '{0.name}'
        return template.format(self)

    class Meta:
        unique_together = (('id', 'status'),)
        verbose_name = 'Клиент'
        verbose_name_plural = 'Клиенты'


class Passport(models.Model):
    client = models.OneToOneField(Client, on_delete=models.CASCADE, db_column='client', verbose_name='Клиент')
    series = models.DecimalField('Серия', max_digits=2, decimal_places=0)
    number = models.DecimalField('Номер', max_digits=7, decimal_places=0)
    birth_date = models.DateField('Дата рождения', default=timezone.now)
    birth_place = models.CharField('Место рождения', max_length=45)
    issue_date = models.DateField('Дата выдачи', default=timezone.now)
    expiry_date = models.DateField('Дата окончания срока действия', default=timezone.now)
    authority = models.CharField('Орган, выдавший документ', max_length=45)

    def __str__(self):
        template = 'Паспорт клиента {0.client.name}'
        return template.format(self)

    class Meta:
        unique_together = (('id', 'client'),)
        verbose_name = 'Паспорт'
        verbose_name_plural = 'Паспорта'
