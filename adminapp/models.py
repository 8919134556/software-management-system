from django.db import models
from datetime import datetime
from datetime import date
# Create your models here.

class Employees(models.Model):
    emp_id = models.AutoField(primary_key=True)

    emp_name = models.CharField(verbose_name='Emp_Name', db_column="emp_name", max_length=50, blank=False,
                                  null=False)
   
    emp_phone = models.BigIntegerField(verbose_name='Emp_Phone', db_column="emp_phone", blank=False,
                                  null=False)
    emp_email = models.EmailField(db_column='emp_email', verbose_name='Emp_Email', max_length=100, null=True, blank=True)
    
    emp_pwd=models.CharField(verbose_name='Emp_Password',db_column="emp_pwd",max_length=100,blank=False,null=False)
    
    emp_gender=models.CharField(verbose_name='Emp_Gender',db_column="emp_gender",max_length=50,blank=False,null=False)
    
    emp_date_birth = models.DateTimeField(verbose_name='Emp_Date_Birth', db_column="emp_date_birth", max_length=50, blank=False,
                                  null=False)

    emp_education = models.CharField(verbose_name='Emp_Education', db_column="emp_education", max_length=50, blank=False,
                                  null=False)

    emp_designation = models.CharField(verbose_name='Emp_Designation', db_column="emp_designation", max_length=50, blank=False,
                                  null=False)
    emp_photo = models.ImageField(verbose_name='Emp_Photo', db_column="emp_photo", upload_to='employees/images/', blank=False,)
    

    emp_addres = models.CharField(verbose_name='Emp_Addres', db_column="emp_addres", max_length=50, blank=False,
                                  null=False)
    
    status = models.CharField(verbose_name='Status', db_column="status", max_length=50, blank=False,
                                 default = 'Accepted', null=True)
    
    datetime_created = models.DateTimeField(default=datetime.now)
   
    class Meta:
        db_table='emp_details'
    

class Project(models.Model):
    pro_id = models.AutoField(primary_key=True)

    pro_name = models.CharField(verbose_name='Pro_Name', db_column="pro_name", max_length=50, blank=False,
                                  null=False)
    pro_assigner = models.CharField(verbose_name='Pro_Assigner', db_column="pro_assigner", max_length=50, blank=False,
                                  null=False)
    pro_file = models.FileField(verbose_name='Pro_File', db_column="pro_file", upload_to='Project/Project-details/', blank=False,)
    
    start_date = models.DateTimeField(verbose_name='Start_Date', db_column="start_date", max_length=50, blank=False,
                                  null=True)

    ending_date = models.DateTimeField(verbose_name='Ending_Date', db_column="ending_date", max_length=50, blank=False,
                                  null=True)
    status = models.CharField(verbose_name='Status', db_column="status", max_length=50, blank=False,
                                  default = 'Pending', null=True)
    datetime_created = models.DateTimeField(default=datetime.now)        
    
    class Meta:
        db_table='project_details'