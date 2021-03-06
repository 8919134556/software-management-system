# Generated by Django 3.2.8 on 2022-03-29 08:21

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Assign_project',
            fields=[
                ('assign_id', models.AutoField(primary_key=True, serialize=False)),
                ('pro_name', models.CharField(db_column='pro_name', max_length=50, verbose_name='Pro_Name')),
                ('emp_assigner', models.CharField(db_column='pro_assigner', max_length=50, verbose_name='Pro_Assigner')),
                ('pro_file', models.FileField(db_column='pro_file', upload_to='Assign/Project-details/', verbose_name='Pro_File')),
            ],
            options={
                'db_table': 'assign_details',
            },
        ),
    ]
