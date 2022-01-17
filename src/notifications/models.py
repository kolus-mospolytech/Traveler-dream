from django.conf import settings
from django.db import models


class Notification(models.Model):
    user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE, db_column='user',
                             verbose_name='Пользователь')
    link = models.URLField('Ссылка')
    done = models.BooleanField('Выполнено', default=False)

    def __str__(self):
        template = 'Уведомление №{0.id} для {0.user}'
        return template.format(self)

    class Meta:
        verbose_name = 'Уведомление'
        verbose_name_plural = 'Уведомления'
