# Generated by Django 2.0.3 on 2018-05-23 16:00

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('RecommendSysApp', '0001_initial'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='user_activity',
            name='fuserid',
        ),
        migrations.AddField(
            model_name='user_activity',
            name='fuser',
            field=models.CharField(default=1, max_length=255),
            preserve_default=False,
        ),
    ]
