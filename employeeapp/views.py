from django.contrib.auth import authenticate, login
from django.shortcuts import render, redirect, get_object_or_404
from django.http import HttpResponse
from django.contrib.auth.models import User
from django.contrib import messages
from django.template import loader
# Create your views here.
from django.shortcuts import render
from adminapp.models import Employees
from managerapp.models import Assign_project
from managerapp.models import Task
# Create your views here.
from django.core.mail import EmailMessage



def emp_login(request):
    if request.method == "POST":
        email = request.POST.get('email')
        password = request.POST.get('password')
        print('hii')
        
        try:
            login = Employees.objects.get(emp_email=email,emp_pwd=password)
            print('hi')
            request.session["emp_id"]=login.emp_id
            request.session["emp_name"] = login.emp_name
            status = login.status
            desig = login.emp_designation
            
            print("hallo")
            if status == "Accepted" and desig != 'Manager':                
                request.session['emp_email'] = login.emp_email            
                messages.success(request, "welcome")
                return redirect ("emp_dashboard")
                
            else : 
                messages.error(request, "your account not at activated")
   
        except:
            print('nee')
            messages.error(request, "bad credential Please Register")
            return redirect("emp_login")
    return render (request, './employee/emp-login.html')

def emp_project_status(request):
    obj = Employees.objects.filter(emp_id=request.session["emp_id"])
    data = Task.objects.filter(emp_assigner=request.session["emp_name"])
    demo = Assign_project.objects.filter(emp_assigner=request.session["emp_name"])
    context = {
        'obj' : obj,
        'data' : data,
        'demo' : demo
    }
    return render (request, './employee/emp-project-status.html', context=context)

def emp_view_task(request):
    obj = Employees.objects.filter(emp_id=request.session["emp_id"])
    data = Task.objects.filter(emp_assigner=request.session["emp_name"])
    context = {
        'obj':obj,
        'data':data
    }
    return render (request, './employee/emp-view-task.html', context=context)

def emp_dashboard(request):
    data = Employees.objects.filter(emp_id=request.session["emp_id"])
    data1 = Assign_project.objects.filter(emp_assigner=request.session["emp_name"]).count
    data2 = Task.objects.filter(emp_assigner=request.session["emp_name"]).count
    data3 = Assign_project.objects.filter(emp_assigner=request.session["emp_name"], status='completed').count
    context = {
        'view' : data,
        'data1' : data1,
        'data2' : data2,
        'data3' : data3
    }
    return render (request, './employee/employee-dashboard.html', context=context)

def emp_myproject(request):
    obj = Employees.objects.filter(emp_id=request.session["emp_id"])
    data = Assign_project.objects.filter(emp_assigner=request.session["emp_name"])
    context = {
        'obj' : obj,
        'data' : data
    }
    return render (request, './employee/employee-myproject.html', context=context)



def emp_profile(request):
    obj = Employees.objects.filter(emp_id=request.session["emp_id"])
    return render (request, './employee/myprofile.html', {'view' : obj})



def upd_profile(request, id):
    obj = Employees.objects.filter(emp_id=request.session["emp_id"])
    if request.method == "POST" :
        name = request.POST.get('name')
        phone = request.POST.get('phone')
        password = request.POST.get('password')
        gender = request.POST.get('select')
        
        data = get_object_or_404(Employees, emp_id= id)
        data.emp_name = name
        data.emp_phone = phone
        data.emp_pwd = password
        data.emp_gender = gender
     
        data.save(update_fields=["emp_name","emp_phone","emp_pwd","emp_gender"])
        data.save()
        return redirect("emp_profile")
    return render (request, './employee/emp-edit-profile.html', {'view' : obj})

def off_track(request, id) : 
    off_track = get_object_or_404(Task, task_id=id)
    off_track.status = 'Off-Track'
    off_track.save(update_fields = ['status'])
    off_track.save()
    
    return redirect("emp_project_status")

def on_track(request, id) : 
    on_track = get_object_or_404(Task, task_id=id)
    on_track.status = 'On-Track'
    on_track.save(update_fields = ['status'])
    on_track.save()
    
    return redirect("emp_project_status")

def completed(request, id) : 
    completed = get_object_or_404(Task, task_id=id)
    completed.status = 'completed'
    completed.save(update_fields = ['status'])
    completed.save()
    
    return redirect("emp_project_status")

def in_process(request, id) : 
    in_process = get_object_or_404(Assign_project, assign_id=id)
    in_process.status = 'in-process'
    in_process.save(update_fields = ['status'])
    in_process.save()
    
    return redirect("emp_project_status")

def pro_completed(request, id) : 
    pro_completed = get_object_or_404(Assign_project, assign_id=id)
    pro_completed.status = 'completed'
    pro_completed.save(update_fields = ['status'])
    pro_completed.save()
    
    return redirect("emp_project_status")



def password_reset(request):
    if request.method == "POST":
        gmail = request.POST['email']
        dict = gmail
        email = EmailMessage('Subject', 'http://127.0.0.1:8000/employeeapp/password_reset_confirm', to=[ dict ])
        email.send()
        return redirect ('password_reset/done/')
    return render (request, "./resetpws/password-reset.html") 

def password_reset_confirm(request):
    
    if request.method == "POST":
        user_email = request.POST.get('user_email')
        user_pwd = request.POST.get('user_pwd')

        user = get_object_or_404(Employees, emp_email = user_email)
        user.emp_pwd = user_pwd
        user.save(update_fields=["emp_pwd","emp_email"])
        user.save()
        messages.success(request, "your password has been successfully changed")
        return redirect("emp_login")
    return render (request, "./resetpws/password-reset-confirm.html")