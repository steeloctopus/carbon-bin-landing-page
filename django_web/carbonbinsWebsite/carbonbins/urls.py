from django.urls import path
from .views import home, payment, project

urlpatterns = [
    path('', home, name="Home"),
    path('payment/', payment, name="Payment"),
    path('project/', project, name="Project"),
]
