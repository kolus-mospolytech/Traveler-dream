from django.contrib import admin
from django.core.exceptions import ValidationError
from django.db.models.signals import post_save, pre_save
from django.dispatch import receiver
from django.forms.models import BaseInlineFormSet
from django.urls import reverse
from ordered_model.admin import OrderedTabularInline, OrderedInlineModelAdminMixin

from .models import TourPoint, Agreement, ProcessStatus, BusinessProcess, Contract, Bill, Currency, Tourist
from notifications.models import Notification


@receiver(post_save, sender=Agreement)
def create_process(sender, instance, created, **kwargs):
    if created:
        process = BusinessProcess.objects.create(agreement=instance, status=ProcessStatus.objects.get(id=1))
        process.save()
    if instance.ready:
        process = BusinessProcess.objects.get(agreement=instance, status=ProcessStatus.objects.get(id=1))
        process.status = ProcessStatus.objects.get(id=2)
        process.save()


@receiver(pre_save, sender=BusinessProcess)
def create_notification(sender, instance, update_fields, **kwargs):
    if instance.manager and instance.status.id == 2:
        print(update_fields)
        agreement = instance.agreement
        contract = Contract.objects.create(
            organization=agreement.organization,
            agent=agreement.agent,
            client=agreement.client,
            persons=agreement.persons,
            trip_start=agreement.trip_start,
            trip_end=agreement.trip_end,
        )
        contract.save()

        points = TourPoint.objects.filter(agreement=agreement)
        for point in points:
            point.contract = contract
            point.save()

        instance.contract = contract

        url = reverse('admin:%s_%s_change' % (contract._meta.app_label, contract._meta.model_name), args=[contract.id])
        notification = Notification.objects.create(
            user=instance.manager,
            link=url,
        )
        notification.save()


class TourPointInlineFormSet(BaseInlineFormSet):
    def clean(self):
        for form in self.forms:
            print(form.cleaned_data)
            if form.cleaned_data['city'].country != form.cleaned_data['agreement'].country:
                template = 'Можно выбирать только города в стране: {0.country}'
                raise ValidationError(template.format(form.cleaned_data['agreement']))


class TourPointInline(OrderedTabularInline):
    model = TourPoint
    formset = TourPointInlineFormSet
    fields = ('move_up_down_links', 'order', 'city',)
    ordering = ('order',)
    autocomplete_fields = ('city',)
    extra = 0
    can_delete = True

    def get_readonly_fields(self, request, obj):
        if hasattr(obj, 'ready'):
            if obj.ready:
                self.can_delete = False
                return 'move_up_down_links', 'order', 'city',
            else:
                return 'order', 'move_up_down_links',
        else:
            return 'order', 'move_up_down_links',


@admin.register(Agreement)
class AgreementAdmin(OrderedInlineModelAdminMixin, admin.ModelAdmin):
    model = Agreement
    inlines = (TourPointInline,)
    list_display = ('id', 'creation_date', 'ready', 'organization', 'client', 'country',)
    list_filter = ('creation_date', 'ready', 'organization', 'country',)
    search_fields = ('id', 'organization__name', 'client__name', 'country__name',)
    ordering = ('creation_date', 'id',)
    autocomplete_fields = ('organization', 'agent', 'client', 'country',)

    def get_readonly_fields(self, request, obj):
        if hasattr(obj, 'ready'):
            if obj.ready:
                return 'organization', 'agent', 'client', 'country', 'persons', 'ready', 'trip_start', 'trip_end',
            else:
                return ()
        else:
            return ()


class HotelPointInlineFormSet(BaseInlineFormSet):
    def clean(self):
        for form in self.forms:
            print(form.cleaned_data)
            if form.cleaned_data['city'].country != form.cleaned_data['contract'].country:
                template = 'Можно выбирать только города в стране: {0.country}'
                raise ValidationError(template.format(form.cleaned_data['contract']))


class HotelPointInline(OrderedTabularInline):
    model = TourPoint
    formset = HotelPointInlineFormSet
    fields = ('move_up_down_links', 'order', 'city', 'hotel', 'room_type', 'feeding_type', 'start_date', 'end_date',)
    ordering = ('order',)
    autocomplete_fields = ('city', 'hotel', 'room_type', 'feeding_type',)
    extra = 0
    can_delete = True

    def get_readonly_fields(self, request, obj):
        if hasattr(obj, 'ready'):
            if obj.ready:
                self.can_delete = False
                return 'move_up_down_links', 'order', 'city', 'hotel', 'room_type', 'feeding_type', 'start_date', 'end_date',
            else:
                return 'order', 'move_up_down_links',
        else:
            return 'order', 'move_up_down_links',


class TouristInlineFormSet(BaseInlineFormSet):
    def clean(self):
        for form in self.forms:
            print(form.cleaned_data)
            # if form.cleaned_data['city'].country != form.cleaned_data['agreement'].country:
            #     template = 'Можно выбирать только города в стране: {0.country}'
            #     raise ValidationError(template.format(form.cleaned_data['agreement']))


class TouristInline(OrderedTabularInline):
    model = Tourist
    formset = TouristInlineFormSet
    fields = ('move_up_down_links', 'order', 'client',)
    ordering = ('order',)
    autocomplete_fields = ('client',)
    extra = 0
    can_delete = True

    def get_readonly_fields(self, request, obj):
        if hasattr(obj, 'ready'):
            if obj.ready:
                self.can_delete = False
                return 'move_up_down_links', 'order', 'client',
            else:
                return 'order', 'move_up_down_links',
        else:
            return 'order', 'move_up_down_links',


@admin.register(Contract)
class ContractAdmin(admin.ModelAdmin):
    model = Contract
    inlines = (TouristInline, HotelPointInline,)
    list_display = ('id', 'creation_date', 'ready', 'organization', 'client', 'country',)
    list_display_links = None
    list_filter = ('creation_date', 'ready', 'organization', 'country',)
    search_fields = ('id', 'organization__name', 'client__name', 'country__name',)
    ordering = ('creation_date', 'id',)
    autocomplete_fields = ('organization', 'agent', 'client', 'country', 'currency',)

    def get_readonly_fields(self, request, obj):
        if hasattr(obj, 'ready'):
            if obj.ready:
                return 'organization', 'agent', 'client', 'country', 'persons', 'currency', 'cost', 'ready', 'trip_start', 'trip_end',
            else:
                return ()
        else:
            return ()


@admin.register(Bill)
class BillAdmin(admin.ModelAdmin):
    model = Bill
    list_display = ('id', 'creation_date', 'contract', 'client')
    list_filter = ('creation_date',)
    search_fields = ('id', 'contract', 'client',)
    ordering = ('creation_date', 'id',)

    def client(self, obj):
        process = BusinessProcess.objects.get(bill=obj.id)
        return process.agreement.client

    def contract(self, obj):
        process = BusinessProcess.objects.get(bill=obj.id)
        return process.contract


@admin.register(Currency)
class CurrencyAdmin(admin.ModelAdmin):
    model = Currency
    list_display = ('code', 'name', 'rate', 'update_date')
    list_filter = ('update_date',)
    search_fields = ('code', 'name',)
    ordering = ('update_date', 'code',)

    # def get_list_display(self, request):
    #     with client.settings(raw_response=True):
    #         response = client.service.GetCursOnDate(date.today())
    #         print(response)
    #         return 'code', 'name', 'rate', 'update_date',


@admin.register(ProcessStatus)
class ProcessStatusAdmin(admin.ModelAdmin):
    list_display = ('name',)
    search_fields = ('name', 'description',)
    ordering = ('name',)


@admin.register(BusinessProcess)
class BusinessProcessAdmin(admin.ModelAdmin):
    model = BusinessProcess
    list_display = (
        'id', 'creation_date', 'status', 'organization', 'client', 'country',)
    list_filter = ('creation_date', 'status', 'agreement__organization', 'agreement__country',)
    search_fields = (
        'id', 'status__name', 'agreement__organization__name', 'agreement__client__name', 'agreement__country__name',)
    ordering = ('creation_date', 'id',)
    autocomplete_fields = ('manager', 'agreement', 'status', 'contract', 'bill',)
    readonly_fields = ('agreement', 'status', 'contract', 'bill', 'voucher', 'creation_date', 'update_date',)

    def organization(self, obj):
        return obj.agreement.organization

    def client(self, obj):
        return obj.agreement.client

    def country(self, obj):
        return obj.agreement.country

    client.short_description = 'Клиент'
    organization.short_description = 'Организация'
    country.short_description = 'Страна'
