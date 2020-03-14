import 'package:carbonbins/pages/landing_page/landing_page_widget.dart';
import 'package:carbonbins/utils/responsive_widget.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  LandingPage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xff296d2d),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ResponsiveWidget(
                largeScreen: LandingPageWidget(),
                mediumScreen: LandingPageWidget(
                  headerFontSize: 70.0,
                ),
                smallScreen: LandingPageWidget(
                  topMargin: 20.0,
                  showImage: false,
                  headerFontSize: 60.0,
                  subtitleFontSize: 16.0,
                  isSmall: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
