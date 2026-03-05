from django.http import JsonResponse
from django.urls import path

def index(request):
    return JsonResponse({"message": "Hello from Django!"})

def health(request):
    return JsonResponse({"status": "healthy"})

urlpatterns = [
    path('', index),
    path('health/', health),
]
