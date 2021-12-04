from django.contrib.auth.models import AbstractBaseUser, PermissionsMixin
from django.contrib.auth.models import User, Group
from django.contrib.auth.validators import UnicodeUsernameValidator
from django.core.validators import RegexValidator
from django.db import models
from django.utils import timezone
from django.utils.translation import gettext_lazy as _

from .managers import CustomUserManager


class Organization(models.Model):
    name = models.CharField('Название', unique=True, max_length=45)
    address = models.CharField('Адрес', max_length=255)
    phone = models.CharField('Телефон', max_length=20, blank=True, null=True)
    mail = models.CharField('E-Mail', max_length=45, blank=True, null=True)

    def __str__(self):
        template = '{0.name}'
        return template.format(self)

    class Meta:
        verbose_name = 'Организация'
        verbose_name_plural = 'Организации'


class Employee(AbstractBaseUser, PermissionsMixin):
    class Sex(models.TextChoices):
        MALE = 'М', 'Мужчина'
        FEMALE = 'Ж', 'Женщина'

    username_validator = UnicodeUsernameValidator()

    name_validator = RegexValidator(r'^[a-zA-Z-А-Яа-я]*$', 'Вы можете использовать только буквы')

    fullname_validator = RegexValidator(r'^[a-zA-Z-А-Яа-я ]*$', 'Вы можете использовать только буквы')

    username = models.CharField(
        _('username'),
        max_length=150,
        unique=True,
        help_text=_('Required. 150 characters or fewer. Letters, digits and @/./+/-/_ only.'),
        validators=[username_validator],
        error_messages={
            'unique': _("A user with that username already exists."),
        },
    )
    organization = models.ForeignKey(Organization, on_delete=models.CASCADE, db_column='organization',
                                     verbose_name='Организация', blank=True, null=True)
    name = models.CharField('Имя', max_length=45, validators=[name_validator], blank=True)
    full_name = models.CharField('ФИО', max_length=255, validators=[fullname_validator], blank=True)
    sex = models.CharField('Пол', max_length=1, choices=Sex.choices, blank=False)
    birth_date = models.DateField('Дата рождения', blank=True, default=timezone.now)
    photo = models.ImageField('Фото', upload_to='avatars', blank=True, null=True)
    is_staff = models.BooleanField(
        _('staff status'),
        default=False,
        help_text=_('Designates whether the user can log into this admin site.'),
    )
    is_active = models.BooleanField(
        _('active'),
        default=True,
        help_text=_(
            'Designates whether this user should be treated as active. '
            'Unselect this instead of deleting accounts.'
        ),
    )
    date_joined = models.DateTimeField(_('date joined'), default=timezone.now)

    objects = CustomUserManager()

    USERNAME_FIELD = 'username'
    REQUIRED_FIELDS = []

    def __str__(self):
        template = '{0.name}'
        return template.format(self)

    class Meta:
        constraints = [
            models.UniqueConstraint(fields=['full_name', 'birth_date'], name='unique_employees')
        ]
        verbose_name = 'Сотрудник'
        verbose_name_plural = 'Сотрудники'


class ClientStatus(models.Model):
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
        MALE = 'М', 'Мужчина'
        FEMALE = 'Ж', 'Женщина'

    status = models.ForeignKey(ClientStatus, on_delete=models.DO_NOTHING, db_column='status', verbose_name='Статус',
                               blank=False)
    name = models.CharField('Имя', max_length=45)
    fullname = models.CharField('ФИО', max_length=255)
    sex = models.CharField('Пол', max_length=1, choices=Sex.choices, blank=False)

    def __str__(self):
        template = '{0.name}'
        return template.format(self)

    class Meta:
        unique_together = (('id', 'status'),)
        verbose_name = 'Клиент'
        verbose_name_plural = 'Клиенты'


class InternationalPassport(models.Model):
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
    description = models.CharField('Описание', max_length=255, blank=True, null=True)

    def __str__(self):
        template = '{0.name}'
        return template.format(self)

    class Meta:
        verbose_name = 'Тип Отеля'
        verbose_name_plural = 'Типы Отелей'


class Hotel(models.Model):
    city = models.ForeignKey(City, on_delete=models.CASCADE, db_column='city', verbose_name='Город')
    type = models.ForeignKey(HotelType, on_delete=models.CASCADE, db_column='type', verbose_name='Тип отеля')
    name = models.CharField('Название', max_length=45)
    address = models.CharField('Адрес', max_length=255)

    def __str__(self):
        template = '{0.name}'
        return template.format(self)

    class Meta:
        unique_together = (('id', 'city'),)
        verbose_name = 'Отель'
        verbose_name_plural = 'Отели'


class FeedingType(models.Model):
    name = models.CharField('Название', max_length=45)
    description = models.CharField('Описание', max_length=255, blank=True, null=True)

    def __str__(self):
        template = '{0.name}'
        return template.format(self)

    class Meta:
        verbose_name = 'Тип Питания'
        verbose_name_plural = 'Типы Питания'


class RoomType(models.Model):
    name = models.CharField('Название', max_length=45)
    description = models.CharField('Описание', max_length=255, blank=True, null=True)

    def __str__(self):
        template = '{0.name}'
        return template.format(self)

    class Meta:
        verbose_name = 'Тип Комнаты'
        verbose_name_plural = 'Типы Комнат'


class PreliminaryAgreement(models.Model):
    organization = models.ForeignKey(Organization, on_delete=models.CASCADE, db_column='organization',
                                     verbose_name='Организация')
    employee = models.ForeignKey(Employee, on_delete=models.CASCADE, db_column='employee', blank=True, null=True,
                                 verbose_name='Агент')
    client = models.ForeignKey(Client, on_delete=models.DO_NOTHING, db_column='client', verbose_name='Клиент')
    creation_date = models.DateTimeField('Дата заключения', auto_now_add=True)
    trip_start = models.DateField('Дата начала поездки')
    trip_end = models.DateField('Дата конца поездки')

    def __str__(self):
        template = 'Предварительное соглашение №{0.id}'
        return template.format(self)

    class Meta:
        verbose_name = 'Предварительное Соглашение'
        verbose_name_plural = 'Предварительные Соглашения'


class TourHotel(models.Model):
    agreement = models.ForeignKey(PreliminaryAgreement, on_delete=models.CASCADE, db_column='agreement',
                                  verbose_name='Предварительно соглашение')
    hotel = models.ForeignKey(Hotel, on_delete=models.CASCADE, db_column='hotel', verbose_name='Отель')
    room_type = models.ForeignKey(RoomType, on_delete=models.CASCADE, db_column='room_type', verbose_name='Тип комнаты')
    feeding_type = models.ForeignKey(FeedingType, on_delete=models.CASCADE, db_column='feeding_type',
                                     verbose_name='Тип питания')
    order = models.DecimalField('Порядок', max_digits=2, decimal_places=0)
    start_date = models.DateTimeField('Дата заселения')
    end_date = models.DateTimeField('Дата выселения')

    class Meta:
        unique_together = (('id', 'agreement', 'hotel'),)


class Bill(models.Model):
    creation_date = models.DateTimeField('Дата выписки', auto_now_add=True)
    cost = models.DecimalField('Стоимость', max_digits=10, decimal_places=2)
    payed = models.IntegerField('Оплачено')
    payment_date = models.DateTimeField('Дата платежа', blank=True, null=True)

    def __str__(self):
        template = 'Чек №{0.id}'
        return template.format(self)

    class Meta:
        verbose_name = 'Чек'
        verbose_name_plural = 'Чеки'


class Currency(models.Model):
    name = models.CharField('Наименование', max_length=45)
    code = models.CharField('Код', max_length=3)
    rate = models.DecimalField('Курс', max_digits=5, decimal_places=2)
    update_date = models.DateTimeField('Дата последнего изменения', auto_now=True)

    def __str__(self):
        template = '{0.name}'
        return template.format(self)

    class Meta:
        verbose_name = 'Валюта'
        verbose_name_plural = 'Валюты'


class Contract(models.Model):
    currency = models.ForeignKey(Currency, on_delete=models.CASCADE, db_column='currency', verbose_name='Валюта')
    creation_date = models.DateTimeField('Дата создания', auto_now_add=True)
    cost = models.DecimalField('Стоимость', max_digits=9, decimal_places=2)

    def __str__(self):
        template = 'Договор №{0.id} от {0.creation_date}'
        return template.format(self)

    class Meta:
        verbose_name = 'Договор'
        verbose_name_plural = 'Договоры'


class Tourist(models.Model):
    contract = models.OneToOneField(Contract, models.DO_NOTHING, db_column='contract', primary_key=True,
                                    verbose_name='Договор')
    client = models.ForeignKey(Client, models.DO_NOTHING, db_column='client', verbose_name='Клиент')

    class Meta:
        unique_together = (('contract', 'client'),)
        verbose_name = 'Турист'
        verbose_name_plural = 'Туристы'


class ProcessStatus(models.Model):
    name = models.CharField('Название', max_length=45)
    description = models.CharField('Описание', max_length=255, blank=True, null=True)

    def __str__(self):
        template = '{0.name}'
        return template.format(self)

    class Meta:
        verbose_name = 'Статус Процесса'
        verbose_name_plural = 'Статусы Процесса'


class BusinessProcess(models.Model):
    agreement = models.ForeignKey(PreliminaryAgreement, on_delete=models.CASCADE, db_column='agreement',
                                  verbose_name="Предварительное соглашение")
    status = models.ForeignKey(ProcessStatus, models.DO_NOTHING, db_column='status', verbose_name="Статус")
    contract = models.ForeignKey(Contract, models.DO_NOTHING, db_column='contract', blank=True, null=True,
                                 verbose_name="Договор")
    bill = models.ForeignKey(Bill, models.DO_NOTHING, db_column='bill', blank=True, null=True, verbose_name="Чек")
    name = models.CharField('Название', max_length=45)
    creation_date = models.DateTimeField('Дата создания', auto_now_add=True)
    update_date = models.DateTimeField('Дата последнего изменения', auto_now=True)

    def __str__(self):
        template = 'Бизнес процесс {0.name}'
        return template.format(self)

    class Meta:
        unique_together = (('id', 'agreement', 'status'),)
        verbose_name = 'Бизнес процесс'
        verbose_name_plural = 'Бизнес процессы'
