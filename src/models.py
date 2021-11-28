# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class Bill(models.Model):
    creation_date = models.DateTimeField()
    cost = models.DecimalField(max_digits=10, decimal_places=2)
    payed = models.IntegerField()
    payment_date = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'Bill'


class Birthcertificate(models.Model):
    client = models.OneToOneField('Client', models.DO_NOTHING, db_column='client')
    series = models.CharField(max_length=5)
    number = models.DecimalField(max_digits=6, decimal_places=0)
    issue_date = models.DateField()
    surname = models.CharField(max_length=45)
    name = models.CharField(max_length=45)
    patronymic = models.CharField(max_length=45, blank=True, null=True)
    birth_date = models.DateField()
    birth_place = models.CharField(max_length=45)

    class Meta:
        managed = False
        db_table = 'BirthCertificate'
        unique_together = (('id', 'client'),)


class Businessprocess(models.Model):
    id = models.IntegerField(primary_key=True)
    agreement = models.ForeignKey('Preliminaryagreement', models.DO_NOTHING, db_column='agreement')
    status = models.ForeignKey('Processstatus', models.DO_NOTHING, db_column='status')
    contract = models.ForeignKey('Contract', models.DO_NOTHING, db_column='contract', blank=True, null=True)
    bill = models.ForeignKey(Bill, models.DO_NOTHING, db_column='bill', blank=True, null=True)
    name = models.CharField(max_length=45)
    creation_date = models.DateTimeField()
    update_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'BusinessProcess'
        unique_together = (('id', 'agreement', 'status'),)


class City(models.Model):
    country = models.ForeignKey('Country', models.DO_NOTHING, db_column='country')
    name = models.CharField(max_length=45)

    class Meta:
        managed = False
        db_table = 'City'
        unique_together = (('id', 'country'),)


class Client(models.Model):
    status = models.ForeignKey('Clientstatus', models.DO_NOTHING, db_column='status')
    name = models.CharField(max_length=45)
    fullname = models.CharField(max_length=255)
    sex = models.CharField(max_length=1)
    birth_date = models.DateField()
    birth_place = models.CharField(max_length=45)

    class Meta:
        managed = False
        db_table = 'Client'
        unique_together = (('id', 'status'),)


class Clientstatus(models.Model):
    name = models.CharField(max_length=45)
    description = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'ClientStatus'


class Contract(models.Model):
    currency = models.ForeignKey('Currency', models.DO_NOTHING, db_column='currency')
    creation_date = models.DateTimeField()
    cost = models.DecimalField(max_digits=9, decimal_places=2)

    class Meta:
        managed = False
        db_table = 'Contract'


class Country(models.Model):
    name = models.CharField(max_length=45)

    class Meta:
        managed = False
        db_table = 'Country'


class Currency(models.Model):
    name = models.CharField(max_length=45)
    code = models.CharField(max_length=3)
    rate = models.DecimalField(max_digits=5, decimal_places=2)
    update_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'Currency'


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
        managed = False
        db_table = 'Employee'
        unique_together = (('id', 'position', 'organization'),)


class Feedingtype(models.Model):
    name = models.CharField(max_length=45)
    description = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'FeedingType'


class Hotel(models.Model):
    city = models.ForeignKey(City, models.DO_NOTHING, db_column='city')
    type = models.ForeignKey('Hoteltype', models.DO_NOTHING, db_column='type')
    name = models.CharField(max_length=45)
    address = models.CharField(max_length=255)

    class Meta:
        managed = False
        db_table = 'Hotel'
        unique_together = (('id', 'city'),)


class Hoteltype(models.Model):
    name = models.CharField(max_length=45)
    description = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'HotelType'


class Internationalpassport(models.Model):
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
        managed = False
        db_table = 'InternationalPassport'
        unique_together = (('id', 'client'),)


class Organization(models.Model):
    name = models.CharField(unique=True, max_length=45)
    address = models.CharField(max_length=255)
    phone = models.CharField(max_length=45)
    mail = models.CharField(max_length=45, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'Organization'


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
        managed = False
        db_table = 'Passport'
        unique_together = (('id', 'client'),)


class Position(models.Model):
    name = models.CharField(unique=True, max_length=45)
    description = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'Position'


class Preliminaryagreement(models.Model):
    id = models.IntegerField(primary_key=True)
    organization = models.ForeignKey(Organization, models.DO_NOTHING, db_column='organization')
    employee = models.ForeignKey(Employee, models.DO_NOTHING, db_column='employee', blank=True, null=True)
    client = models.ForeignKey(Client, models.DO_NOTHING, db_column='client')
    creation_date = models.DateTimeField()
    trip_start = models.DateField()
    trip_end = models.DateField()

    class Meta:
        managed = False
        db_table = 'PreliminaryAgreement'


class Processstatus(models.Model):
    name = models.CharField(max_length=45)
    description = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'ProcessStatus'


class Roomtype(models.Model):
    name = models.CharField(max_length=45)
    description = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'RoomType'


class Tourhotel(models.Model):
    agreement = models.ForeignKey(Preliminaryagreement, models.DO_NOTHING, db_column='agreement')
    hotel = models.ForeignKey(Hotel, models.DO_NOTHING, db_column='hotel')
    room_type = models.ForeignKey(Roomtype, models.DO_NOTHING, db_column='room_type')
    feeding_type = models.ForeignKey(Feedingtype, models.DO_NOTHING, db_column='feeding_type')
    order = models.DecimalField(max_digits=2, decimal_places=0)
    start_date = models.DateTimeField()
    end_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'TourHotel'
        unique_together = (('id', 'agreement', 'hotel'),)


class Tourist(models.Model):
    contract = models.OneToOneField(Contract, models.DO_NOTHING, db_column='contract', primary_key=True)
    client = models.ForeignKey(Client, models.DO_NOTHING, db_column='client')

    class Meta:
        managed = False
        db_table = 'Tourist'
        unique_together = (('contract', 'client'),)
