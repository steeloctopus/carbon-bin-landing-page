from django.shortcuts import render
from django.http import HttpResponseRedirect
from .payment_process import get_token, process_payment


# Create your views here.
def home(request):
    if request.method == 'POST':
        data = request.POST
        print("First Name:", data['first_name'])
        print("LastName:", data['last_name'])
        print("Amount:", data['amount'])
        print("Email:", data['email'])
        print(request.POST)

        return HttpResponseRedirect('/payment/', )
    else:
        return render(request, 'index.html')


def payment(request):
    print(request.method)
    print("I called")
    print(request)

    if request.method == 'POST':
        data = request.POST
        nonce = data['payment_method_nonce']

        result = process_payment(nonce=nonce, amount=10)

        if result.is_success:
            return HttpResponseRedirect('/project/')
        else:
            return render(request, 'payment.html', {'client_token': get_token()})

    return render(request, 'payment.html', {'client_token': get_token()})


def project(request):
    return render(request, 'project.html', {'name': "Shudipto"})
