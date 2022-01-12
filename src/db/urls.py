from django.conf import settings
from django.conf.urls.static import static
from django.contrib.auth.views import LogoutView
from django.urls import path

from . import views

urlpatterns = [
                  path('', views.index, name='home'),
                  path('login/', views.login_page, name='login'),
                  path('logout/', LogoutView.as_view(next_page='login'), name='logout'),

                  path('employee/', views.view_employee, name='viewEmployee'),
                  path('employee/add/', views.add_employee, name='addEmployee'),
                  path('employee/edit/<int:pk>/', views.edit_employee, name='editEmployee'),
                  path('employee/delete/<int:pk>/', views.delete_employee, name='deletedEmployee'),

                  path('client/', views.view_client, name='viewClient'),
                  path('client/add/', views.add_client, name='addClient'),
                  path('client/edit/<int:pk>/', views.edit_client, name='editClient'),
                  path('client/delete/<int:pk>/', views.delete_client, name='deletedClient'),
                  path('passport/add/<int:pk>/', views.add_passport, name='addPassport'),

                  path('country/', views.view_country, name='viewCountry'),
                  path('country/add/', views.add_country, name='addCountry'),
                  path('country/edit/<int:pk>/', views.edit_country, name='editCountry'),
                  path('country/delete/<int:pk>/', views.delete_country, name='deletedCountry'),

                  path('city/', views.view_city, name='viewCity'),
                  path('city/add/', views.add_city, name='addCity'),
                  path('city/edit/<int:pk>/', views.edit_city, name='editCity'),
                  path('city/delete/<int:pk>/', views.delete_city, name='deletedCity'),

                  path('hotel/', views.view_hotel, name='viewHotel'),
                  path('hotel/add/', views.add_hotel, name='addHotel'),
                  path('hotel/edit/<int:pk>/', views.edit_hotel, name='editHotel'),
                  path('hotel/delete/<int:pk>/', views.delete_hotel, name='deletedHotel'),

                  path('agreement/', views.view_agreement, name='viewAgreement'),
                  path('agreement/add/', views.add_agreement, name='addAgreement'),
                  path('agreement/edit/<int:pk>/', views.edit_agreement, name='editAgreement'),
                  path('agreement/delete/<int:pk>/', views.delete_agreement, name='deletedAgreement'),
              ] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
