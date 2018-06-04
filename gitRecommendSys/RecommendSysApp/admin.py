#引入models里面的哪个类并进行注册,就能在后台管理哪个类了
from django.contrib import admin
from .models import Sys_Para




admin.site.register(Sys_Para)