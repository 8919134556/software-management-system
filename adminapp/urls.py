
from django.contrib import admin
from django.urls import path, include
from . import views

urlpatterns = [
    path('add_employee', views.add_employee, name='add_employee'),
    path('add_project', views.add_project, name='add_project'),
    path('edit_project', views.edit_project, name='edit_project'),
    path('emp_view/<int:id>', views.emp_view, name='emp_view'),
    
    path('view_status', views.view_status, name='view_status'),
    path('admin_view_project', views.admin_view_project, name='admin_view_project'),
    path('admin_dashboard', views.admin_dashboard, name='admin_dashboard'),
    path('admin_login', views.admin_login, name='admin_login'),
    path('view_employee', views.view_employee, name='view_employee'),
    path('update', views.update, name='update'),
    path('delete/<int:id>', views.delete, name='delete'),
    path('edit_employee/<int:id>', views.edit_employee, name='edit_employee'),
    path('accept/<int:id>', views.accept, name='accept'),
    path('reject/<int:id>', views.reject, name='reject')
    
    
        
]