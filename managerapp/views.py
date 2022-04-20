from django.contrib.auth import authenticate, login
from django.shortcuts import render, redirect, get_object_or_404
from django.http import HttpResponse
from django.contrib.auth.models import User
from django.contrib import messages
from django.template import loader
# Create your views here.
from django.shortcuts import render
from adminapp.models import Employees
from adminapp.models import Project
from .models import Assign_project
from .models import Task
from django.core.mail import EmailMessage
# Create your views here.


def manager_login (request):
    if request.method == "POST":
        email = request.POST.get('email')
        password = request.POST.get('password')
        mobile = request.POST.get("mobile")
        print('demo')
        
        try:
            login = Employees.objects.get(emp_email=email,emp_pwd=password)
            print('hi')
            
            request.session["manager_name"] = login.emp_name
            status = login.status
            desig = login.emp_designation
            

            if status == "Accepted" and desig == 'Manager': 
                request.session["manager_id"]=login.emp_id               
                request.session['manager_email'] = login.emp_email          
                messages.success(request, "welcome")
                return redirect ("manager_dashboard")                
            else : 
                messages.error(request, "your account not at activated")
   
        except:
            print('nee')
            messages.error(request, "bad credential Please Register")
            return redirect("manager_login")
    return render (request, './manager/manager-login.html')

def manager_dashboard (request):
    data = Employees.objects.filter(emp_id=request.session["manager_id"])
    obj = Project.objects.filter(pro_assigner=request.session["manager_name"]).count
    demo = Task.objects.filter(manager_id=request.session["manager_id"]).count
    data1 = Assign_project.objects.filter(manager_id=request.session["manager_id"], status='completed')
    demo1 = data1.count()

    data2 = Employees.objects.all().exclude(emp_designation='Manager').count
    data3 = data1 = Assign_project.objects.filter(manager_id=request.session["manager_id"]).order_by("-pro_name")
    
    context = {
        'view' : data,
        'obj' : obj,
        'demo' : demo,
        'data1' : demo1,
        'data2' : data2,
        'data3' : data3
        

    }
    return render (request, './manager/manager-dashboard.html', context=context)

def add_task (request):
    
    demo = Employees.objects.filter(emp_id=request.session["manager_id"])
    data = Project.objects.filter(pro_assigner=request.session["manager_name"])
    obj = Employees.objects.all().exclude(emp_designation='Manager')
    if request.method == 'POST':
        pro_name = request.POST ['pro_name']
        emp_name = request.POST ['emp_name']
        date = request.POST ['due_date']
        priorty = request.POST ['priorty']
        text = request.POST ['text']
       
        demo = Task.objects.create (manager_id=request.session["manager_id"],pro_name=pro_name, emp_assigner=emp_name, due_date=date, priorty=priorty, text=text)
        demo.save()
        messages.success(request, "Task has been successfully Added")
        return redirect('view_task')
    context = {
        'data' : data,
        'obj' : obj,
        'demo' : demo
    }
    return render (request, './manager/manager-add-task.html', context=context)

def edit_task (request, id):
    demo1 = Employees.objects.filter(emp_id=request.session["manager_id"])
    demo = Project.objects.all()
    obj = Employees.objects.all()
    data = Task.objects.get(task_id=id)
    if request.method == "POST" :
        pro_name = request.POST.get('pro_name')
        emp_name = request.POST.get('emp_name')
        due_date = request.POST.get('due_date')
        priorty = request.POST.get('priorty')
        text = request.POST.get('text')
        
        data = get_object_or_404(Task, task_id= id)
        data.pro_name = pro_name
        data.emp_name = emp_name
        data.due_date = due_date
        data.priorty = priorty
        data.text = text
        data.save(update_fields=["pro_name","emp_assigner","due_date","priorty","text"])
        data.save()
       
        return redirect("view_task")
    context = {
        'demo' : demo,
        'obj' : obj,
        'data' : data,
        'demo1' : demo1
    }
        
    return render (request, './manager/manager-edit-task.html', context=context)

def assign_project (request):
    demo = Employees.objects.filter(emp_id=request.session["manager_id"])
    data = Project.objects.filter(pro_assigner=request.session["manager_name"])
    obj = Employees.objects.all().exclude(emp_designation='Manager')
    if request.method == 'POST' and request.FILES["pro_file"]:
        pro_name = request.POST ['project_name']
        ass_name = request.POST ['assign_name']
        pro_file = request.FILES ['pro_file']
        print('demo')
        demo = Assign_project.objects.create (manager_id=request.session["manager_id"],pro_name=pro_name, emp_assigner=ass_name, pro_file=pro_file)
        demo.save()
        messages.success(request, "successfully Assigned")
        return redirect('assign_project')
    
    context = {
        'data' : data,
        'obj' : obj,
        'demo' : demo
    }

    return render (request, './manager/manager-assign-project.html', context=context)

def project_status (request):
    obj = Employees.objects.filter(emp_id=request.session["manager_id"])
    data = Assign_project.objects.filter(manager_id=request.session["manager_id"], status='in-process')
    demo = Assign_project.objects.filter(manager_id=request.session["manager_id"], status='completed')
    context = {
        'obj' : obj,
        'data' : data,
        'demo' : demo
    }
    return render (request, './manager/manager-project-status.html', context=context)

def view_emp (request):
    obj = Employees.objects.filter(emp_id=request.session["manager_id"])
    data = Employees.objects.all()
    context = {
        'obj' : obj,
        'data' : data
    }
    return render (request, './manager/manager-view-emp.html', context=context)

def view_project (request):
 
    obj = Employees.objects.filter(emp_id=request.session["manager_id"])
    data = Project.objects.filter(pro_assigner=request.session["manager_name"])
    
    context = {
        'obj' : obj,
        'data' : data
    }
    return render (request, './manager/manager-view-projects.html', context=context)

def view_task (request):
    obj = Employees.objects.filter(emp_id=request.session["manager_id"])
    data = Task.objects.filter(manager_id=request.session["manager_id"])
    context = {
        'obj' : obj,
        'data' : data
    }
    return render (request, './manager/manager-view-task.html', context=context)

def manager_view(request, id):
    obj = Employees.objects.filter(emp_id=request.session["manager_id"])
    data = Employees.objects.filter(emp_id=id)
    context = {
        'obj' : obj,
        'data' : data
    }
    return render (request, './manager/view-employee.html', context=context)

def task_status (request):
    obj = Employees.objects.filter(emp_id=request.session["manager_id"])
    data = Task.objects.filter(manager_id=request.session["manager_id"], status='On-Track')
    data1 = Task.objects.filter(manager_id=request.session["manager_id"], status='Off-Track')
    data2 = Task.objects.filter(manager_id=request.session["manager_id"], status='completed')
    context = {
        'obj' : obj,
        'data' : data,
        'data1' : data1,
        'data2' : data2
    }
    return render (request, './manager/task-status.html', context=context)

def verified(request, id) : 
    verified = get_object_or_404(Project, pro_id=id)
    verified.status = 'completed'
    verified.save(update_fields = ['status'])
    verified.save()
    
    return redirect("view_project")

def pending(request, id) : 
    pending = get_object_or_404(Project, pro_id=id)
    pending.status = 'pending'
    pending.save(update_fields = ['status'])
    pending.save()
    
    return redirect("view_project")



def man_password_reset(request):
    if request.method == "POST":
        gmail = request.POST['email']
        dict = gmail
        email = EmailMessage('Subject', 'http://127.0.0.1:8000/managerapp/password_reset_confirm', to=[ dict ])
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