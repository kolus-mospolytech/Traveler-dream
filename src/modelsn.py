# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.contrib.auth.models import User
from django.db import models


class Bill(models.Model):
    creation_date = models.DateTimeField()
    cost = models.DecimalField(max_digits=10, decimal_places=2)
    payed = models.IntegerField()
    payment_date = models.DateTimeField(blank=True, null=True)

    class Meta:
        db_table = 'Bill'
        verbose_name = 'Чек'
        verbose_name_plural = 'Чеки'


class City(models.Model):
    country = models.ForeignKey('Country', models.DO_NOTHING, db_column='country')
    name = models.CharField(max_length=45)

    class Meta:
        db_table = 'City'
        unique_together = (('id', 'country'),)
        verbose_name = 'Город'
        verbose_name_plural = 'Города'


class Client(models.Model):
    status = models.ForeignKey('ClientStatus', models.DO_NOTHING, db_column='status')
    name = models.CharField(max_length=45)
    fullname = models.CharField(max_length=255)
    sex = models.CharField(max_length=1)
    birth_date = models.DateField()
    birth_place = models.CharField(max_length=45)

    class Meta:
        db_table = 'Client'
        unique_together = (('id', 'status'),)
        verbose_name = 'Клиент'
        verbose_name_plural = 'Клиенты'


class ClientStatus(models.Model):
    name = models.CharField(max_length=45)
    description = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        db_table = 'ClientStatus'
        verbose_name = 'Статус Клиента'
        verbose_name_plural = 'Статусы Клиентов'


class Contract(models.Model):
    currency = models.ForeignKey('Currency', models.DO_NOTHING, db_column='currency')
    creation_date = models.DateTimeField()
    cost = models.DecimalField(max_digits=9, decimal_places=2)

    class Meta:
        db_table = 'Contract'
        verbose_name = 'Договор'
        verbose_name_plural = 'Договоры'


class Country(models.Model):
    name = models.CharField(max_length=45)

    class Meta:
        db_table = 'Country'
        verbose_name = 'Страна'
        verbose_name_plural = 'Страны'


class Currency(models.Model):
    name = models.CharField(max_length=45)
    code = models.CharField(max_length=3)
    rate = models.DecimalField(max_digits=5, decimal_places=2)
    update_date = models.DateTimeField()

    class Meta:
        db_table = 'Currency'
        verbose_name = 'Валюта'
        verbose_name_plural = 'Валюты'


class Employee(models.Model):
    position = models.ForeignKey('Position', models.DO_NOTHING, db_column='position')
    organization = models.ForeignKey('Organization', models.DO_NOTHING, db_column='organization')
    login = models.CharField(unique=True, max_length=45)
    password = models.CharField(max_length=255)
    name = models.CharField(max_length=45)
    full_name = models.CharField(max_length=255)
    sex = models.CharField(max_length=1)
    birth_date = models.DateField()
    photo = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        db_table = 'Employee'
        unique_together = (('id', 'position', 'organization'),)
        verbose_name = 'Сотрудник'
        verbose_name_plural = 'Сотрудники'


class FeedingType(models.Model):
    name = models.CharField(max_length=45)
    description = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        db_table = 'FeedingType'
        verbose_name = 'Тип Питания'
        verbose_name_plural = 'Типы Питания'


class Hotel(models.Model):
    city = models.ForeignKey(City, models.DO_NOTHING, db_column='city')
    type = models.ForeignKey('HotelType', models.DO_NOTHING, db_column='type')
    name = models.CharField(max_length=45)
    address = models.CharField(max_length=255)

    class Meta:
        db_table = 'Hotel'
        unique_together = (('id', 'city'),)
        verbose_name = 'Отель'
        verbose_name_plural = 'Отели'


class HotelType(models.Model):
    name = models.CharField(max_length=45)
    description = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        db_table = 'HotelType'
        verbose_name = 'Тип Отеля'
        verbose_name_plural = 'Типы Отелей'


class InternationalPassport(models.Model):
    client = models.OneToOneField(Client, models.DO_NOTHING, db_column='client')
    type = models.CharField(max_length=3)
    state = models.CharField(max_length=3)
    series = models.DecimalField(max_digits=2, decimal_places=0)
    number = models.DecimalField(max_digits=7, decimal_places=0)
    surname = models.CharField(max_length=45)
    given_name = models.CharField(max_length=45)
    nationality = models.CharField(max_length=45)
    birth_date = models.DateField()
    sex = models.CharField(max_length=1)
    birth_place = models.CharField(max_length=45)
    issue_date = models.DateField()
    expiry_date = models.DateField()
    authority = models.CharField(max_length=45)

    class Meta:
        db_table = 'InternationalPassport'
        unique_together = (('id', 'client'),)


class Organization(models.Model):
    name = models.CharField(unique=True, max_length=45)
    address = models.CharField(max_length=255)
    phone = models.CharField(max_length=45)
    mail = models.CharField(max_length=45, blank=True, null=True)

    class Meta:
        db_table = 'Organization'
        verbose_name = 'Организация'
        verbose_name_plural = 'Организации'


class Passport(models.Model):
    client = models.OneToOneField(Client, models.DO_NOTHING, db_column='client')
    series = models.DecimalField(max_digits=4, decimal_places=0)
    number = models.DecimalField(max_digits=6, decimal_places=0)
    authority = models.CharField(max_length=255)
    issue_date = models.DateField()
    authority_code = models.DecimalField(max_digits=6, decimal_places=0)
    surname = models.CharField(max_length=45)
    name = models.CharField(max_length=45)
    patronymic = models.CharField(max_length=45, blank=True, null=True)
    sex = models.CharField(max_length=1)
    birth_date = models.DateField()
    birth_place = models.CharField(max_length=45)

    class Meta:
        db_table = 'Passport'
        unique_together = (('id', 'client'),)
        verbose_name = 'Паспорт'
        verbose_name_plural = 'Паспорта'


class Position(models.Model):
    name = models.CharField(unique=True, max_length=45)
    description = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        db_table = 'Position'
        verbose_name = 'Должность'
        verbose_name_plural = 'Должности'


class PreliminaryAgreement(models.Model):
    id = models.IntegerField(primary_key=True)
    organization = models.ForeignKey(Organization, models.DO_NOTHING, db_column='organization')
    employee = models.ForeignKey(Employee, models.DO_NOTHING, db_column='employee', blank=True, null=True)
    client = models.ForeignKey(Client, models.DO_NOTHING, db_column='client')
    creation_date = models.DateTimeField()
    trip_start = models.DateField()
    trip_end = models.DateField()

    class Meta:
        db_table = 'PreliminaryAgreement'
        verbose_name = 'Предварительное Соглашение'
        verbose_name_plural = 'Предварительные Соглашения'


class ProcessStatus(models.Model):
    name = models.CharField(max_length=45)
    description = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        db_table = 'ProcessStatus'
        verbose_name = 'Статус Процесса'
        verbose_name_plural = 'Статусы Процесса'


class RoomType(models.Model):
    name = models.CharField(max_length=45)
    description = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        db_table = 'RoomType'
        verbose_name = 'Тип Комнаты'
        verbose_name_plural = 'Типы Комнат'


class TourHotel(models.Model):
    agreement = models.ForeignKey(PreliminaryAgreement, models.DO_NOTHING, db_column='agreement')
    hotel = models.ForeignKey(Hotel, models.DO_NOTHING, db_column='hotel')
    room_type = models.ForeignKey(RoomType, models.DO_NOTHING, db_column='room_type')
    feeding_type = models.ForeignKey(FeedingType, models.DO_NOTHING, db_column='feeding_type')
    order = models.DecimalField(max_digits=2, decimal_places=0)
    start_date = models.DateTimeField()
    end_date = models.DateTimeField()

    class Meta:
        db_table = 'TourHotel'
        unique_together = (('id', 'agreement', 'hotel'),)


class Tourist(models.Model):
    contract = models.OneToOneField(Contract, models.DO_NOTHING, db_column='contract', primary_key=True)
    client = models.ForeignKey(Client, models.DO_NOTHING, db_column='client')

    class Meta:
        db_table = 'Tourist'
        unique_together = (('contract', 'client'),)
        verbose_name = 'Турист'
        verbose_name_plural = 'Туристы'


class BusinessProcess(models.Model):
    id = models.IntegerField(primary_key=True)
    agreement = models.ForeignKey('PreliminaryAgreement', models.DO_NOTHING, db_column='agreement')
    status = models.ForeignKey('ProcessStatus', models.DO_NOTHING, db_column='status')
    contract = models.ForeignKey('Contract', models.DO_NOTHING, db_column='contract', blank=True, null=True)
    bill = models.ForeignKey(Bill, models.DO_NOTHING, db_column='bill', blank=True, null=True)
    name = models.CharField(max_length=45)
    creation_date = models.DateTimeField()
    update_date = models.DateTimeField()

    class Meta:
        db_table = 'BusinessProcess'
        unique_together = (('id', 'agreement', 'status'),)
        verbose_name = 'Бизнес процесс'
        verbose_name_plural = 'Бизнес процессы'
