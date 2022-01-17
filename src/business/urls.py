from django.conf import settings
from django.conf.urls.static import static
from django.contrib.auth.views import LogoutView
from django.urls import path

from . import views

urlpatterns = [
                  path('voucher/<int:pk>/', views.voucher, name='home'),
              ] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
