import 'dart:html';

import 'package:carbonbins/model/model.dart';
import 'package:carbonbins/pages/navigation.gr.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class PaymentPage extends StatefulWidget {
  final UserModel userModel;

  PaymentPage({@required this.userModel});

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  void getButton() {
    var htmlL = """<div id="checkout-message"></div>
        <div id="dropin-container"></div>
    <button id="submit-button">Submit payment</button>""";

    ui.platformViewRegistry.registerViewFactory(
        'dropin-container',
        (int viewId) => DivElement()
          ..appendHtml(htmlL)
          ..style.border = 'none');

    print(HtmlElementView(
      viewType: "dropin-container",
    ));
  }

  @override
  void initState() {
    getButton();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            width: 300.0,
            height: 300.0,
            child: HtmlElementView(
              viewType: "dropin-container",
            ),
          ),
          MaterialButton(
            onPressed: () {
              goToNextPage();
              //pay();
            },
            child: Text("Click me"),
          ),
        ],
      ),
    );
  }

  void goToNextPage() {
    MyRoute.navigator
        .pushNamed(MyRoute.projectPage, arguments: widget.userModel.firstName);
  }
}
