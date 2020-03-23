@JS()
library my_script;

import 'dart:html';
import 'dart:js_util';

import 'package:carbonbins/model/model.dart';
import 'package:carbonbins/pages/navigation.gr.dart';
import 'package:carbonbins/utils/image_helper.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:js/js.dart';
import 'package:js/js.dart' as js;

@JS()
external void initBraintree(auth);

@JS()
external String payment(auth);

class PaymentPage extends StatefulWidget {
  final UserModel userModel;

  PaymentPage({@required this.userModel});

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String auth = "sandbox_nd8g377g_mwpffq4vznpywc5q";

  void getButton() {
    var htmlL = """<div id="checkout-message"></div>
        <div id="dropin-container"></div>
    <button id="submit-button">Submit payment</button>""";

    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
        'payment-container',
        (int viewId) => DivElement()
          ..appendHtml(htmlL)
          ..style.border = 'none');

    print(HtmlElementView(
      viewType: "dropin-container",
    ));
  }

  void setupDropin() {
    print(auth);
    var status = payment(auth);
    print("Status: $status");
  }

  void test() {
    js.allowInteropCaptureThis(() {
      payment(auth);
    });
  }

  @override
  void initState() {
    getButton();
    //initBraintree(auth);
    setupDropin();
    test();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Color(0xff296d2d),
          image: DecorationImage(
              image: isSmall(context)
                  ? AssetImage(ImageHelper.MOON)
                  : AssetImage(ImageHelper.START),
              alignment: Alignment.bottomRight),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 100,
            ),
            Container(
              width: 500.0,
              height: 300.0,
              child: HtmlElementView(
                viewType: "payment-container",
              ),
            ),
            MaterialButton(
              onPressed: () {
                //goToNextPage();
                //pay();
                print("I called the drop in");
                setupDropin();
              },
              child: Text("Click me"),
            ),
          ],
        ),
      ),
    );
  }

  bool isSmall(BuildContext context) {
    return MediaQuery.of(context).size.width > 800;
  }

  void goToNextPage() {
    MyRoute.navigator
        .pushNamed(MyRoute.projectPage, arguments: widget.userModel.firstName);
  }
}
