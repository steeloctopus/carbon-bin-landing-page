from django.shortcuts import render
from django.http import HttpResponseRedirect
from .payment_process import get_token, process_payment
from .models import UserModel


# Create your views here.
def home(request):
    if request.method == 'POST':
        data = request.POST
        print("First Name:", data['first_name'])
        print("LastName:", data['last_name'])
        print("Amount:", data['amount'])
        print("Email:", data['email'])
        print(request.POST)

        # save on sessions
        request.session["first_name"] = data['first_name']
        request.session["last_name"] = data['last_name']
        request.session["amount"] = data['amount']
        request.session["email"] = data['email']

        return HttpResponseRedirect('/payment/', )
    else:
        return render(request, 'index.html')


def payment(request):
    print("First Name: ", request.session.get('first_name'))
    if request.method == 'POST':
        data = request.POST
        nonce = data['payment_method_nonce']
        amount = request.session.get('amount')
        result = process_payment(nonce=nonce, amount=amount)

        if result.is_success:
            print("*" * 10)
            print("\n\n")
            firstName = request.session.get('first_name')
            lastName = request.session.get('last_name')
            email = request.session.get('email')
            print("User details: ", firstName, lastName, email, amount)
            print("transaction details: ", result.transaction)
            print("\n\n")
            print("*" * 10)

            user = UserModel()
            user.firstName = firstName
            user.lastName = lastName
            user.amount = amount
            user.email = email
            user.transiction = str(result.transaction)[:400]
            user.save()

            return HttpResponseRedirect('/project/')
        else:
            return render(request, 'payment.html', {'client_token': get_token()})

    return render(request, 'payment.html', {'client_token': get_token()})


def project(request):
    firstName = request.session.get('first_name')
    return render(request, 'project.html', {'name': firstName})
