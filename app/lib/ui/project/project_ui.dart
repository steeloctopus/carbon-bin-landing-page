import 'package:app/model/model.dart';
import 'package:app/utils/image_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class ProjectPage extends StatefulWidget {
  final UserModel _userModel;

  ProjectPage(this._userModel);

  @override
  _ProjectPageState createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  String khtml =
      "<iframe src='https://www.youtube.com/embed/jNQXAC9IVRw'></iframe>";

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
              SizedBox(height: 30),
              Container(
                child: Image(
                  image: AssetImage(ImageHelper.CARBONBINS),
                ),
              ),
              SizedBox(
                height: 48,
              ),
              Container(
                padding: EdgeInsets.only(left: 20.0),
                child: Text(
                  "Thank you,\n${widget._userModel.firstName}",
                  style: TextStyle(
                      fontSize: 50.0,
                      color: Color(0xffcfa6cd),
                      fontFamily: "Bookmania",
                      fontWeight: FontWeight.w300),
                ),
              ),
              SizedBox(
                height: 48,
              ),
              Container(
                padding: EdgeInsets.only(left: 20.0),
                child: Text(
                  "How we\nremove CO2",
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image(
                      image: AssetImage(ImageHelper.SMILE),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.only(left: 20.0, right: 20.0),
                child: Text(
                  "Yarra Yarra Biodiversity Corridor Project",
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontFamily: "Goatham",
                      height: 1.2,
                      fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                padding: EdgeInsets.only(left: 20.0, right: 20.0),
                child: Text(
                  des,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                      //todo change font
                      fontFamily: "Goatham",
                      height: 1.2,
                      fontWeight: FontWeight.w300),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              //todo add youtube video
              Container(
                width: MediaQuery.of(context).size.width,
                height: 300.0,
                padding: EdgeInsets.only(left: 20.0, right: 20.0),
                //"https://www.youtube.com/watch?v=aNrqaOAt5P4",
                child: HtmlWidget(
                  khtml,
                  webView: true,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.only(left: 20.0, right: 20.0),
                child: Text(
                  footer,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                      //todo change font
                      fontFamily: "Goatham",
                      height: 1.2,
                      fontWeight: FontWeight.w300),
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
      ),
    );
  }

  var des =
      "At present, funds intended for CO2 removal are being forwarded to the Yarra Yarra Biodiversity Corridor project that is being administered by Perth based organisation Carbon Neutral.\n\n"
      "This organisation plants endemic drought resistant trees - natures carbon removal machines.\n"
      "The project has been certified by The Gold Standard (TGS), an agency established by the World Wildlife Fund, it ensures that projects like theYarra Yarra Biodiversity Corridor do indeed remove CO2, that their methodologies are sound and that the projects “...deliver meaningful sustainable development benefits beyond emission reductions”.\n\n"
      "According to TGS, to date “... 10,000 hectares has been revegetated capturing 1.257 million tonnes of carbon”.";

  var footer =
      "Carbon Bins will direct all the funds we generate, that are intended for CO2 removal, to organisations that are, ethical, transparent, certified and/or audited by third parties.";
}
