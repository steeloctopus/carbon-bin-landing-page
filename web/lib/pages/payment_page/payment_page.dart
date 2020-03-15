import 'package:carbonbins/model/model.dart';
import 'package:carbonbins/pages/navigation.gr.dart';
import 'package:flutter/material.dart';
import 'package:square_in_app_payments/models.dart';

import 'dart:js' as js;
import 'dart:js_util' as util;

class PaymentPage extends StatefulWidget {
  final UserModel userModel;

  PaymentPage({@required this.userModel});

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
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
