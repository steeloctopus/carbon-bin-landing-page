import 'package:carbonbins/pages/project_page/project_header.dart';
import 'package:carbonbins/utils/image_helper.dart';
import 'package:flutter/material.dart';

class ProjectPageWidget extends StatefulWidget {
  final bool showImage;
  final double topMargin;
  final double headerFontSize;
  final double subtitleFontSize;
  final bool isSmall;
  final String firstName;

  ProjectPageWidget({
    this.showImage = true,
    this.topMargin = 40.0,
    this.headerFontSize = 70.0,
    this.subtitleFontSize = 20.0,
    this.isSmall = false,
    this.firstName = "Shudipto",
  });

  @override
  _ProjectPageWidgetState createState() => _ProjectPageWidgetState();
}

class _ProjectPageWidgetState extends State<ProjectPageWidget> {
  var des =
      "At present, funds intended for CO2 removal are being forwarded to the Yarra Yarra Biodiversity Corridor project that is being administered by Perth based organisation Carbon Neutral.\n\n"
      "This organisation plants endemic drought resistant trees - natures carbon removal machines.\n"
      "The project has been certified by The Gold Standard (TGS), an agency established by the World Wildlife Fund, it ensures that projects like theYarra Yarra Biodiversity Corridor do indeed remove CO2, that their methodologies are sound and that the projects “...deliver meaningful sustainable development benefits beyond emission reductions”.\n\n"
      "According to TGS, to date “... 10,000 hectares has been revegetated capturing 1.257 million tonnes of carbon”.";

  var footer =
      "Carbon Bins will direct all the funds we generate, that are intended for CO2 removal, to organisations that are, ethical, transparent, certified and/or audited by third parties.";

  var html =
      "<iframe src='https://www.youtube.com/watch?v=wzZiONbtwiA'></iframe>";

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
          ProjectHeader(
            headerFontSize: widget.headerFontSize,
            subtitleFontSize: widget.subtitleFontSize,
            firstName: widget.firstName,
          ),
          Container(
            alignment: Alignment.topLeft,
            width: MediaQuery.of(context).size.width,
            margin: widget.isSmall
                ? EdgeInsets.only(right: 10.0)
                : EdgeInsets.only(right: 50.0),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: widget.isSmall
                      ? AssetImage("")
                      : AssetImage(ImageHelper.CICON),
                  alignment: Alignment.bottomRight),
            ),
            child: Column(
              children: <Widget>[
                Container(
                  //complete add responsible way
                  width: getContainerWidth(context),
                  child: Text(
                    des,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        fontSize: widget.subtitleFontSize - 2,
                        color: Colors.white,
                        //todo change font
                        fontFamily: "Goatham",
                        height: 1.2,
                        fontWeight: FontWeight.w300),
                  ),
                )
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                widget.isSmall
                    ? Container(
                        child: Image(
                          width: 50.0,
                          height: 50.0,
                          image: AssetImage(ImageHelper.CICON),
                        ),
                      )
                    : Container()
              ],
            ),
          ),
          SizedBox(
            height: widget.isSmall ? 10 : 50,
          ),
          Container(child: SizedBox()),
          SizedBox(
            height: 50,
          ),
          Container(
            width: getContainerWidth(context),
            child: Text(
              footer,
              textAlign: TextAlign.justify,
              style: TextStyle(
                  fontSize: widget.subtitleFontSize - 2,
                  color: Colors.white,
                  //todo change font
                  fontFamily: "Goatham",
                  height: 1.2,
                  fontWeight: FontWeight.w300),
            ),
          ),
          SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }

  double getContainerWidth(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    if (width > 800) {
      return 420.0;
    } else if (width > 600) {
      return 380.0;
    } else {
      return 350.0;
    }
  }
}
