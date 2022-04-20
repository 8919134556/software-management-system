from django.contrib import admin
from django.urls import path, include
from . import views
from django.contrib.auth import views as auth_views 

urlpatterns = [
    path('add_task', views.add_task, name='add_task'),
    path('edit_task/<int:id>', views.edit_task, name='edit_task'),
    path('view_task', views.view_task, name='view_task'),
    path('manager_login', views.manager_login, name='manager_login'),
    path('assign_project', views.assign_project, name='assign_project'),
    path('manager_dashboard', views.manager_dashboard, name='manager_dashboard'),
    path('project_status', views.project_status, name='project_status'),
    path('view_emp', views.view_emp, name='view_emp'),
    path('view_project', views.view_project, name='view_project'),
    path('manager_view/<int:id>', views.manager_view, name='manager_view'),
    path('task_status', views.task_status, name='task_status'),
    path('verified/<int:id>', views.verified, name='verified'),
    path('pending/<int:id>', views.pending, name='pending'),
    path('man_password_reset',views.man_password_reset,name='man_password_reset'),
    path('password_reset/done/',auth_views.PasswordResetDoneView.as_view(template_name="resetpws/password-reset-done.html"),name='password_reset_done'),
    path('password_reset_confirm',views.password_reset_confirm, name='password_reset_confirm'),
    path('password_reset_complete/done/',auth_views.PasswordResetCompleteView.as_view(template_name="resetpws/password-reset-complete.html"),name='password_reset_complete')
    

    
]