# Generated by Django 3.2.8 on 2022-03-31 07:22

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('managerapp', '0005_auto_20220331_1207'),
    ]

    operations = [
        migrations.AddField(
            model_name='assign_project',
            name='manager_id',
            field=models.CharField(db_column='manager_id', max_length=50, null=True, verbose_name='Manager_Id'),
        ),
    ]
