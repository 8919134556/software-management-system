# Generated by Django 3.2.8 on 2022-04-01 08:49

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('managerapp', '0006_assign_project_manager_id'),
    ]

    operations = [
        migrations.AddField(
            model_name='assign_project',
            name='datetime_created',
            field=models.DateTimeField(default=datetime.datetime.now),
        ),
        migrations.AddField(
            model_name='task',
            name='datetime_created',
            field=models.DateTimeField(default=datetime.datetime.now),
        ),
    ]
