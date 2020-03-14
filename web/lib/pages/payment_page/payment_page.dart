import 'package:carbonbins/model/model.dart';
import 'package:carbonbins/pages/navigation.gr.dart';
import 'package:flutter/material.dart';
import 'package:square_in_app_payments/in_app_payments.dart';
import 'package:square_in_app_payments/models.dart';

class PaymentPage extends StatefulWidget {
  final UserModel userModel;

  PaymentPage({@required this.userModel});

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  void pay() {
    print("Found it");

    InAppPayments.setSquareApplicationId(
        "sandbox-sq0idb-Sg71LIPcalhW661Mt_mvyw");

    InAppPayments.startCardEntryFlow(
        onCardNonceRequestSuccess: success, onCardEntryCancel: cancel);
  }

  void cancel() {
    print("Sorry");
  }

  void success(CardDetails results) {
    print(results.toString());
    print("***************");
    goToNextPage();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialButton(
        onPressed: () {
          goToNextPage();
          //pay();
        },
        child: Text("Click me"),
      ),
    );
  }

  void goToNextPage() {
    MyRoute.navigator
        .pushNamed(MyRoute.projectPage, arguments: widget.userModel.firstName);
  }
}
