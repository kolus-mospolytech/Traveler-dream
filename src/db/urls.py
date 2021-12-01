from django.conf import settings
from django.conf.urls.static import static
from django.contrib.auth.views import LogoutView
from django.urls import path
from . import views

urlpatterns = [
    path('', views.index, name='home'),

    path('login/', views.login_page, name='login'),
    # path('register/', views.register_page, name='register'),
    # path('logout/', views.logout, name='logout'),
    path('logout/', LogoutView.as_view(next_page='login'), name='logout'),

    path('employee/view/', views.view_employee, name='viewEmployee'),
    path('employee/add/', views.add_employee, name='addEmployee'),
    path('employee/edit/<int:pk>/', views.edit_employee, name='editEmployee'),
    path('employee/delete/<int:pk>/', views.delete_employee, name='deletedEmployee'),
    # <std:pk>/
    path('client/add/', views.add_client, name='addClient'),
    path('passport/add/<int:pk>/', views.add_passport, name='addPassport'),
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

