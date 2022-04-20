from django.contrib.auth import authenticate, login
from django.shortcuts import render, redirect, get_object_or_404
from django.http import HttpResponse
from django.contrib.auth.models import User
from django.contrib import messages
from django.template import loader
# Create your views here.
from django.shortcuts import render
# Create your views here.
def home(request):
    return render (request, './main/index.html')

def about(request):
    return render (request, './main/about.html')

def contact(request):
    return render (request, './main/contact.html')