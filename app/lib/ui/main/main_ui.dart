import 'package:app/utils/image_helper.dart';
import 'package:flutter/material.dart';
import 'package:app/ui/navigator.gr.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            color: Color(0xff296d2d),
            image: DecorationImage(
                image: AssetImage(ImageHelper.START),
                alignment: Alignment.topRight,
                repeat: ImageRepeat.repeat),
          ),
          child: ListView(
            children: <Widget>[
              SizedBox(height: 20),
              Container(
                child: Image(
                  image: AssetImage(ImageHelper.CARBONBINS),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                padding: EdgeInsets.only(left: 20.0),
                child: Text(
                  "Bin your\ncarbon.\nBetter our\nplanet",
                  style: TextStyle(
                      fontSize: 50.0,
                      color: Color(0xffcfa6cd),
                      fontFamily: "Bookmania",
                      fontWeight: FontWeight.w300),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.only(left: 20.0, right: 20.0),
                child: Text(
                  "You throw out your garbage. You recycle your plastic. Carbon Bin makes it easy to instantly get rid  of your carbon emissions.",
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontFamily: "Goatham",
                      height: 1.2,
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.justify,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: 20.0),
                    child: Image(
                      width: 42.0,
                      height: 42.0,
                      image: AssetImage(
                        ImageHelper.CICON,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            MyRoute.navigator.pushNamed(MyRoute.paymentPage);
          },
          label: Container(
            child: Text(
              "Remove CO2",
              style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                  fontFamily: "Goatham",
                  height: 1.2,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
