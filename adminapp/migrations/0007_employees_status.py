# Generated by Django 3.2.8 on 2022-03-29 11:44

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('adminapp', '0006_auto_20220329_1046'),
    ]

    operations = [
        migrations.AddField(
            model_name='employees',
            name='status',
            field=models.CharField(db_column='status', default='Accepted', max_length=50, null=True, verbose_name='Status'),
        ),
    ]
