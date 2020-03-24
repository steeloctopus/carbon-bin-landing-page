from django.db import models


# Create your models here.
class UserModel(models.Model):
    id = models.AutoField(primary_key=True)
    firstName = models.CharField(max_length=100, default="")
    lastName = models.CharField(max_length=100, default="")
    email = models.CharField(max_length=100, default="")
    amount = models.IntegerField(default=0)
    transiction = models.CharField(max_length=1000, default="")

    def __str__(self):
        return self.firstName
