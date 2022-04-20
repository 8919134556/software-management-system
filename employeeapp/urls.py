from django.contrib import admin
from django.urls import path, include
from . import views
from django.contrib.auth import views as auth_views 

urlpatterns = [
    path('emp_project_status', views.emp_project_status, name='emp_project_status'),
    path('emp_view_task', views.emp_view_task, name='emp_view_task'),
    path('emp_dashboard', views.emp_dashboard, name='emp_dashboard'),
    path('emp_myproject', views.emp_myproject, name='emp_myproject'),
    path('emp_login', views.emp_login, name='emp_login'),
    path('emp_profile', views.emp_profile, name='emp_profile'),
    path('upd_profile/<int:id>', views.upd_profile, name='upd_profile'),
    path('off_track/<int:id>', views.off_track, name='off_track'),
    path('on_track/<int:id>', views.on_track, name='on_track'),
    path('completed/<int:id>', views.completed, name='completed'),
    path('in_process/<int:id>', views.in_process, name='in_process'),
    path('pro_completed/<int:id>', views.pro_completed, name='pro_completed'),

    path('password_reset',views.password_reset,name='password_reset'),
    path('password_reset/done/',auth_views.PasswordResetDoneView.as_view(template_name="resetpws/password-reset-done.html"),name='password_reset_done'),
    path('password_reset_confirm',views.password_reset_confirm, name='password_reset_confirm'),
    path('password_reset_complete/done/',auth_views.PasswordResetCompleteView.as_view(template_name="resetpws/password-reset-complete.html"),name='password_reset_complete')
    

       
]