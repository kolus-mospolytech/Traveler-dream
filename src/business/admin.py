from django.contrib import admin
from django.contrib.auth import get_user_model
from ordered_model.admin import OrderedTabularInline, OrderedInlineModelAdminMixin

from .models import TourPoint, Agreement


class TourPointInline(OrderedTabularInline):
    model = TourPoint
    fields = ('move_up_down_links', 'order', 'city',)
    readonly_fields = ('order', 'move_up_down_links',)
    ordering = ('order',)


# class AgentModelChoiceField(forms.ModelChoiceField):
#     def label_from_instance(self, obj):
#         return "%s, %s" % (obj.name, obj.organization)


# class AgreementAdminForm(forms.ModelForm):
#     class Meta:
#         model = Agreement
#         fields = '__all__'
#         widgets = {
#             'agent': autocomplete.ModelSelect2(url='agent-autocomplete')
#         }

#     def __init__(self, *args, **kwargs):
#         super(AgreementAdminForm, self).__init__(*args, **kwargs)
#         self.fields['agent'].widget.queryset = Employee.objects.filter(groups=4)
#         self.fields['agent'].label_from_instance = lambda obj: "%s, %s" % (obj.name, obj.organization)
# agent = AgentModelChoiceField(queryset=Employee.objects.filter(groups=4))
#
# class Meta:
#     model = Agreement


@admin.register(Agreement)
class AgreementAdmin(OrderedInlineModelAdminMixin, admin.ModelAdmin):
    model = Agreement
    # form = AgreementAdminForm
    inlines = (TourPointInline,)
    list_display = ('id', 'creation_date', 'organization', 'client', 'country',)
    list_filter = ('creation_date', 'organization', 'country',)
    search_fields = ('id', 'organization', 'client', 'country',)
    ordering = ('creation_date', 'id',)
    autocomplete_fields = ('organization', 'agent', 'client', 'country',)
    raw_id_fields = ()

