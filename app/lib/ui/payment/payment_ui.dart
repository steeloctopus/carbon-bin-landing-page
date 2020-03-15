import 'dart:convert';

import 'package:app/model/model.dart';
import 'package:app/ui/payment/payment_vm.dart';
import 'package:flutter/material.dart';
import 'package:app/ui/navigator.gr.dart';
import 'package:flutter_braintree/flutter_braintree.dart';
import 'package:http/http.dart' as http;

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  //view model
  PaymentVM _vm;

  //text controller to connect with text
  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  @override
  void initState() {
    _vm = PaymentVM();
    _vm.validData.stream.listen((event) {
      if (event != null) {
        //MyRoute.navigator.pushNamed(MyRoute.projectPage, arguments: event);
      }
    });
    super.initState();
  }

  Future<void> pay(UserModel model) async {
    var response =
        await http.get("https://secret-woodland-22617.herokuapp.com//token");
    print("\n\n" * 3);
    print(response.body);
    print("\n\n" * 3);

    var js = jsonDecode(response.body);

    print(model.amount);

    final request = BraintreeDropInRequest(
      clientToken: js['token'],
      collectDeviceData: true,
      googlePaymentRequest: BraintreeGooglePaymentRequest(
        totalPrice: "10",
        currencyCode: 'USD',
        billingAddressRequired: false,
      ),
      paypalRequest: BraintreePayPalRequest(
        amount: '4.20',
        displayName: 'Example company',
      ),
    );

    BraintreeDropInResult result = await BraintreeDropIn.start(request);

    if (result != null) {
      print("\n\n" * 3);
      print('Nonce: ${result.paymentMethodNonce.nonce}');
      print("\n\n" * 3);
      //todo send to server
      MyRoute.navigator.pushNamed(MyRoute.projectPage, arguments: model);
    } else {
      print("\n\n" * 3);
      print('Selection was canceled.');
      print("\n\n" * 3);
    }
  }

  @override
  void dispose() {
    //dispose everything
    _vm.dispose();
    emailController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.cyan,
          child: Container(
            padding: EdgeInsets.only(left: 20.0, right: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                      ),
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: TextField(
                    controller: firstNameController,
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: 'Fisrt Name'),
                    expands: false,
                    autofocus: false,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.only(left: 8.0),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                      ),
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: TextField(
                    controller: lastNameController,
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: 'Last Name'),
                    expands: false,
                    autofocus: false,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.only(left: 8.0),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                      ),
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Email Address',
                    ),
                    expands: false,
                    autofocus: false,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                      ),
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter Amount',
                    ),
                    expands: false,
                    autofocus: false,
                  ),
                ),
                SizedBox(
                  height: 23,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    MaterialButton(
                      onPressed: () {
                        var firstName = firstNameController.text;
                        var lastName = lastNameController.text;
                        var email = emailController.text;
                        var amount = amountController.text.trim();
                        //_vm.click(firstName, lastName, email, amount);

                        var model = UserModel(
                            firstName: firstName,
                            lastName: lastName,
                            email: email,
                            amount: amount);

                        pay(model);
                      },
                      color: Color(0xffcfa6cd),
                      child: Container(
                        width: 200,
                        padding: EdgeInsets.all(12.0),
                        child: Center(
                          child: Text(
                            "Remove CO2",
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.green,
                                fontWeight: FontWeight.w700,
                                fontFamily: "Goatham"),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
