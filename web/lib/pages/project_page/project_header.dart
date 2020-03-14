import 'package:carbonbins/utils/image_helper.dart';
import 'package:flutter/material.dart';

class ProjectHeader extends StatefulWidget {
  final double headerFontSize;
  final double subtitleFontSize;
  final String firstName;

  ProjectHeader({
    @required this.headerFontSize,
    @required this.subtitleFontSize,
    @required this.firstName,
  });

  @override
  _ProjectHeaderState createState() => _ProjectHeaderState();
}

class _ProjectHeaderState extends State<ProjectHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: showImage(context)
                ? AssetImage(ImageHelper.MOON)
                : AssetImage(ImageHelper.START),
            alignment: Alignment.bottomRight),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Image(
              image: AssetImage(ImageHelper.CARBONBINS),
            ),
          ),
          SizedBox(
            height: 48,
          ),
          Text(
            "Thank you,\n${widget.firstName}",
            style: TextStyle(
                fontSize: widget.headerFontSize,
                color: Color(0xffcfa6cd),
                fontFamily: "Bookmania",
                fontWeight: FontWeight.w300),
          ),
          SizedBox(
            height: 48,
          ),
          Text(
            "How we\nremove CO2",
            style: TextStyle(
                fontSize: widget.headerFontSize,
                color: Color(0xffcfa6cd),
                fontFamily: "Bookmania",
                fontWeight: FontWeight.w300),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            width: 300.0,
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
          Text(
            "Yarra Yarra Biodiversity Corridor Project",
            style: TextStyle(
                fontSize: widget.subtitleFontSize,
                color: Colors.white,
                fontFamily: "Goatham",
                height: 1.2,
                fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }

  bool showImage(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    if (width > 1000) {
      return true;
    } else {
      return false;
    }
  }
}
