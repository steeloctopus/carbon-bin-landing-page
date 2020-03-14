import 'package:carbonbins/pages/landing_page/landing_page_vm.dart';
import 'package:carbonbins/utils/image_helper.dart';
import 'package:carbonbins/pages/landing_page/landing_header.dart';
import 'package:flutter/material.dart';
import 'package:carbonbins/pages/navigation.gr.dart';

class LandingPageWidget extends StatefulWidget {
  final bool showImage;
  final double topMargin;
  final double headerFontSize;
  final double subtitleFontSize;
  final bool isSmall;

  LandingPageWidget(
      {this.showImage = true,
      this.topMargin = 40.0,
      this.headerFontSize = 83.0,
      this.subtitleFontSize = 20.0,
      this.isSmall = false});

  @override
  _LargeScreenPageState createState() => _LargeScreenPageState();
}

class _LargeScreenPageState extends State<LandingPageWidget> {
  //view model
  LandingPageViewModel _vm;

  //text controller to connect with text
  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  //save amount
  String amount;

  @override
  void initState() {
    _vm = LandingPageViewModel();
    _vm.validData.stream.listen((event) {
      if (event != null) {
        MyRoute.navigator.pushNamed(MyRoute.paymentPage, arguments: event);
      }
    });

    super.initState();
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
    return Container(
      margin: EdgeInsets.only(left: widget.topMargin, top: widget.topMargin),
      alignment: Alignment.topLeft,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          LandingHeader(
            headerFontSize: widget.headerFontSize,
            subtitleFontSize: widget.subtitleFontSize,
            showImage: widget.showImage,
          ),
          Container(
            width: 300.0,
            child: Column(
              children: <Widget>[
                StreamBuilder<String>(
                    stream: _vm.firstNameStream.stream,
                    builder: (context, snapshot) {
                      return Container(
                        padding: EdgeInsets.only(left: 8.0),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                            ),
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: TextField(
                          controller: firstNameController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Fisrt Name',
                              errorText: snapshot.data),
                          expands: false,
                          autofocus: false,
                        ),
                      );
                    }),
                SizedBox(
                  height: 20,
                ),
                StreamBuilder<String>(
                    stream: _vm.lastNameStream.stream,
                    builder: (context, snapshot) {
                      return Container(
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
                              border: InputBorder.none,
                              hintText: 'Last Name',
                              errorText: snapshot.data),
                          expands: false,
                          autofocus: false,
                        ),
                      );
                    }),
                SizedBox(
                  height: 20,
                ),
                StreamBuilder<String>(
                    stream: _vm.emailStream.stream,
                    builder: (context, snapshot) {
                      return Container(
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
                              errorText: snapshot.data),
                          expands: false,
                          autofocus: false,
                        ),
                      );
                    }),
                SizedBox(
                  height: 20,
                ),
                //todo replace with drop down list
                Container(
                  padding: EdgeInsets.only(left: 8.0),
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
                        _vm.click(firstName, lastName, email, amount);
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
                )
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 50.0),
                child: Image(
                  width: widget.isSmall ? 70.0 : 250.0,
                  height: widget.isSmall ? 70.0 : 250.0,
                  image: AssetImage(
                    ImageHelper.CICON,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
