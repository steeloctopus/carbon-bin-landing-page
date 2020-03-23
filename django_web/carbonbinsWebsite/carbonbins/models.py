from django.db import models


# Create your models here.
class UserModel(models.Model):
    id = models.IntegerField
    firstName = models.CharField
    lastName = models.CharField
    email = models.CharField
    amount = models.IntegerField


class UserInput(models.Model):
    firstName = models.CharField
    lastName = models.CharField
    email = models.CharField
    amount = models.IntegerField
