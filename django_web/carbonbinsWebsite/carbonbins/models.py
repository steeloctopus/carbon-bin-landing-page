from django.db import models


# Create your models here.
class UserModel(models.Model):
    firstName = models.CharField
    lastName = models.CharField
    email = models.CharField
    amount = models.IntegerField
