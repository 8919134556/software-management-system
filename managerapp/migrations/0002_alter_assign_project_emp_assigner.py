# Generated by Django 3.2.8 on 2022-03-29 08:22

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('managerapp', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='assign_project',
            name='emp_assigner',
            field=models.CharField(db_column='emp_assigner', max_length=50, verbose_name='Emp_Assigner'),
        ),
    ]
