from django.db import models
from datetime import datetime
# Create your models here.
class Assign_project(models.Model):
    assign_id = models.AutoField(primary_key=True)

    pro_name = models.CharField(verbose_name='Pro_Name', db_column="pro_name", max_length=50, blank=False,
                                  null=False)
    emp_assigner = models.CharField(verbose_name='Emp_Assigner', db_column="emp_assigner", max_length=50, blank=False,
                                  null=False)
    pro_file = models.FileField(verbose_name='Pro_File', db_column="pro_file", upload_to='Assign/Project-details/', blank=False,)

    manager_id = models.CharField(verbose_name='Manager_Id', db_column="manager_id", max_length=50, blank=False,
                                  null=True)
    
    status = models.CharField(verbose_name='Status', db_column="status", max_length=50, blank=False,
                                  null=True)
    datetime_created = models.DateTimeField(default=datetime.now)
    
    class Meta:
        db_table='assign_details'


class Task(models.Model):
    task_id = models.AutoField(primary_key=True)

    pro_name = models.CharField(verbose_name='Pro_Name', db_column="pro_name", max_length=50, blank=False,
                                  null=False)
    emp_assigner = models.CharField(verbose_name='Emp_Assigner', db_column="emp_assigner", max_length=50, blank=False,
                                  null=False)
    due_date = models.DateTimeField(verbose_name='Due_Date', db_column="due_date", max_length=50, blank=False,
                                  null=True)
    priorty = models.CharField(verbose_name='Priorty', db_column="priorty", max_length=50, blank=False,
                                  null=False)
    text = models.TextField(verbose_name='Text', db_column="text", max_length=100, blank=False,
                                  null=False)
    manager_id = models.CharField(verbose_name='Manager_Id', db_column="manager_id", max_length=50, blank=False,
                                  null=True)
    
    status = models.CharField(verbose_name='Status', db_column="status", max_length=50, blank=False,
                                  null=True)
    datetime_created = models.DateTimeField(default=datetime.now)
    class Meta:
        db_table='task_details'
