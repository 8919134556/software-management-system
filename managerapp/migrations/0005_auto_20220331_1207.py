# Generated by Django 3.2.8 on 2022-03-31 06:37

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('managerapp', '0004_task_manager_id'),
    ]

    operations = [
        migrations.AddField(
            model_name='assign_project',
            name='status',
            field=models.CharField(db_column='status', max_length=50, null=True, verbose_name='Status'),
        ),
        migrations.AddField(
            model_name='task',
            name='status',
            field=models.CharField(db_column='status', max_length=50, null=True, verbose_name='Status'),
        ),
    ]