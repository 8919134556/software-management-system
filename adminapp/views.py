from django.contrib.auth import authenticate, login
from django.shortcuts import render, redirect, get_object_or_404
from django.http import HttpResponse
from django.contrib.auth.models import User
from django.contrib import messages
from django.template import loader
# Create your views here.
from django.shortcuts import render
from .models import Employees
from .models import Project
from django.core.mail import EmailMessage
from managerapp.models import Assign_project
from managerapp.models import Task
import socket
# Create your views here.



def admin_login (request):
    if request.method == "POST":
        admin_email = request.POST.get('email')
        admin_pws = request.POST.get ('pws')
        if admin_email =='admin' and admin_pws =='admin':
            messages.success(request, "welcome")
            return redirect('admin_dashboard')
            
        else:
            messages.error(request, "bad credential Please Register")
            return redirect('admin_login')
    return render (request, './admin/admin-login.html')

def admin_dashboard (request):
    data = Employees.objects.all().count
    demo = Project.objects.all().count
    obj = Task.objects.all().count
    data1 = Project.objects.filter(status = 'completed').count
    data2 = Project.objects.filter(status = 'Pending').count
    data3 = Project.objects.all().order_by('-pro_name')
    context = {
        'view' : data,
        'demo' : demo,
        'obj'  : obj,
        'data1': data1,
        'data2': data2,
        'data3' : data3

    }
    return render (request, './admin/admin-dashboard.html', context=context)


def add_employee (request):
    if request.method == 'POST' and request.FILES["image"]:
        name = request.POST['name']
       
        phone = request.POST['phone']
        email = request.POST['email']
        password = request.POST['password']
        select = request.POST['select']
        date = request.POST['date']
        eduation = request.POST['eduation']
        designation = request.POST['designation']
        image = request.FILES['image']
        address = request.POST['address']
    
        if Employees.objects.filter(emp_email=email).exists():
            messages.error (request, "Email alredy exist")
            return redirect("add_employee")
        
        employees = Employees.objects.create(emp_name=name,emp_phone=phone,emp_email=email,emp_pwd=password,emp_gender=select,emp_date_birth=date,emp_education=eduation, emp_designation=designation,emp_photo=image,emp_addres=address)
        employees.save()
        
        IPaddress=socket.gethostbyname(socket.gethostname())
        if IPaddress=="127.0.0.1":
            print("No internet, your localhost is "+ IPaddress)
            messages.error(request, "you are in offline")
            return redirect("add_employee")
        else:
            print("Connected, with the IP address: "+ IPaddress )
            
            emp_id = employees.emp_id
            emp_email = employees.emp_email
            emp_pwd = employees.emp_pwd
            email = EmailMessage('Subject',f'Hello {name},\nwe glad to inform you, congratulations\nHere Your Details:\nYour Id no : {emp_id}\nUsername : {emp_email}\nPassword : {emp_pwd}', to=[ emp_email ])
            email.send()
            messages.success(request, "Employee has been successfully Added")
            
        return redirect('view_employee')
        
        
    return render (request, './admin/addemployee.html')

def add_project (request):
    data = Employees.objects.filter(emp_designation = 'Manager')
    if request.method == 'POST' and request.FILES["document"]:
        name = request.POST['project_name']
       
        select = request.POST['select']
        document = request.FILES['document']
        start_date = request.POST['start_date']
        ending_date = request.POST ['end_date']
        pro = Project.objects.create(pro_name=name,pro_assigner=select, pro_file=document, start_date=start_date, ending_date=ending_date)
        pro.save()
        messages.success(request, "Project has been successfully Added")
        return redirect('admin_view_project')
        
    return render (request, './admin/admin-add-project.html', {'view' : data})

def edit_project (request):
    return render (request, './admin/admin-edit-project.html')

def emp_view (request, id):
    data = Employees.objects.filter(emp_id=id)
    return render (request, './admin/view-employee.html', {'view' : data})



def view_status (request):
    data = Project.objects.all()
    return render (request, './admin/admin-view-project-status.html', {'view' : data})

def admin_view_project (request):
    data = Project.objects.all()
    return render (request, './admin/admin-view-projects.html', {'view' : data})

def view_employee (request):
    data = Employees.objects.all()
    return render (request, './admin/admin-view-employee.html', {'view' : data})

def update(request):
    
   
    return render (request, './admin/edit-employee.html')

def delete(request, id):
    data = Employees.objects.get(emp_id=id)
    data.delete()
    return redirect('view_employee')

def edit_employee(request, id):
    data = Employees.objects.get(emp_id=id)
    if request.method == "POST"and request.FILES.get("image") :
        name = request.POST.get('name')
        phone = request.POST.get('phone')
        email = request.POST.get('email')
        gender = request.POST.get('select')
        date_birth = request.POST.get('date')
        eduction = request.POST.get('eduation')
        designation = request.POST.get('designation')
        emp_photo = request.FILES.get('image')
        addres = request.POST.get('address')
        data = get_object_or_404(Employees, emp_id= id)
        data.emp_name = name
        data.emp_phone = phone
        data.emp_email = email
        data.emp_gender = gender
        data.emp_date_birth = date_birth
        data.emp_education = eduction
        data.emp_designation = designation
        data.emp_addres = addres
        data.emp_photo = emp_photo
        
        data.save(update_fields=["emp_name","emp_phone","emp_email","emp_gender","emp_date_birth", "emp_education","emp_designation", "emp_addres", "emp_photo"])
        data.save()
        return redirect("view_employee")
    return render (request, './admin/edit-employee.html', {'i' : data})

def reject(request, id) : 
    reject = get_object_or_404(Employees, emp_id=id)
    reject.status = 'Rejected'
    reject.save(update_fields = ['status'])
    reject.save()
    messages.success(request, "successfuly deactivated")
    return redirect("view_employee")

def accept(request, id) : 
    accept = get_object_or_404(Employees, emp_id=id)
    accept.status = 'Accepted'
    accept.save(update_fields = ['status'])
    accept.save()
    messages.success(request, "Activated")
    return redirect("view_employee")
