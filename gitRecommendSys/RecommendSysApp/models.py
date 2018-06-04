#coding=utf-8
from django.db import models

class Raw_Item(models.Model):
    fid=models.IntegerField(primary_key=True)
    fitemname=models.CharField(max_length=255)
    fmusician=models.CharField(max_length=100)
class Recommendation_Flow(models.Model):
    fid=models.IntegerField(primary_key=True)
    fuserid=models.CharField(max_length=15)
    fitemname=models.CharField(max_length=255)
    fmusician=models.CharField(max_length=100)
    fcreatetime=models.DateTimeField()
    factivity=models.CharField(max_length=20)
class Sys_Para(models.Model):
    fid=models.IntegerField(primary_key=True, verbose_name='标识id')
    fparatype=models.CharField(max_length=255, verbose_name='参数类型')
    fparaname=models.CharField(max_length=255, verbose_name='参数名称')
    fparaorder=models.CharField(max_length=4, verbose_name='排序号')

    def __str__(self):
        return str(self.fid)+"  ，  "+self.fparatype+"  ，  "+self.fparaname

class User(models.Model):
    fid = models.IntegerField(primary_key=True)
    fusername=models.CharField(max_length=255)
    fuserid=models.IntegerField(primary_key=True)
    fpassword=models.CharField(max_length=18)
    fcreatetime=models.DateTimeField()
    fstatus=models.CharField(max_length=255)
    fdate=models.DateTimeField()
class User_Activity(models.Model):
    fid = models.IntegerField(primary_key=True)
    fuser=models.CharField(max_length=255)
    fitemname=models.CharField(max_length=255)
    factivity=models.CharField(max_length=20)
    factivitytime=models.DateTimeField()
class User_Info(models.Model):
    fid = models.IntegerField(primary_key=True)
    fusername=models.CharField(max_length=255)
    fsex=models.CharField(max_length=4)
    fuserid=models.CharField(max_length=15)

