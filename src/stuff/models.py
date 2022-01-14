from django.contrib.auth.models import AbstractBaseUser, PermissionsMixin, GroupManager
from django.contrib.auth.models import User, Group
from django.contrib.auth.validators import UnicodeUsernameValidator
from django.core.validators import RegexValidator
from django.db import models
from django.utils import timezone
from django.utils.translation import gettext_lazy as _
from phonenumber_field.modelfields import PhoneNumberField
from django.utils.html import mark_safe

from .managers import CustomUserManager


class Organization(models.Model):
    name = models.CharField('Название', unique=True, max_length=45)
    address = models.TextField('Адрес', max_length=255)
    phone = PhoneNumberField('Телефон', max_length=20, blank=True, null=True)
    mail = models.EmailField('E-Mail', max_length=45, blank=True, null=True)

    def __str__(self):
        template = '{0.name}'
        return template.format(self)

    class Meta:
        verbose_name = 'Филиал'
        verbose_name_plural = 'Филиалы'


class Position(Group):
    description = models.CharField('Описание', max_length=255, blank=True, null=True)

    objects = GroupManager()

    def __str__(self):
        template = '{0.name}'
        return template.format(self)

    class Meta:
        verbose_name = 'Должность'
        verbose_name_plural = 'Должности'


class Employee(AbstractBaseUser, PermissionsMixin):
    class Sex(models.TextChoices):
        MALE = 'Мужчина', 'Мужчина'
        FEMALE = 'Женщина', 'Женщина'

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
    name = models.CharField('Имя', max_length=45, blank=True)
    full_name = models.CharField('ФИО', max_length=255, blank=True)
    sex = models.CharField('Пол', max_length=7, choices=Sex.choices, blank=True)
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
    groups = models.ForeignKey(
        Position,
        verbose_name='Должность',
        blank=True,
        related_name="user_set",
        related_query_name="user",
        on_delete=models.CASCADE,
    )
    date_joined = models.DateTimeField(_('date joined'), default=timezone.now)

    objects = CustomUserManager()

    USERNAME_FIELD = 'username'
    REQUIRED_FIELDS = []

    def image_tag(self):
        if self.photo:
            return mark_safe('<img src="/media/%s" width="150" height="150" />' % self.photo)
        else:
            pass

    image_tag.short_description = 'Превью фото'

    def __str__(self):
        template = '{0.name}'
        return template.format(self)

    class Meta:
        constraints = [
            models.UniqueConstraint(fields=['full_name', 'birth_date'], name='unique_employees')
        ]
        verbose_name = 'Сотрудник'
        verbose_name_plural = 'Сотрудники'
