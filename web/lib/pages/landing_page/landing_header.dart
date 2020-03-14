import 'package:carbonbins/utils/image_helper.dart';
import 'package:flutter/material.dart';

class LandingHeader extends StatelessWidget {
  final double headerFontSize;
  final double subtitleFontSize;
  final bool showImage;

  LandingHeader(
      {@required this.headerFontSize,
      @required this.showImage,
      @required this.subtitleFontSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: showImage
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
            height: 75,
          ),
          Text(
            "Bin your\ncarbon.\nBetter our\nplanet",
            style: TextStyle(
                fontSize: headerFontSize,
                color: Color(0xffcfa6cd),
                fontFamily: "Bookmania",
                fontWeight: FontWeight.w300),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "You throw out your garbage. You recycle \nyour plastic. Carbon Bin makes it easy to \ninstantly get rid  of your carbon emissions.",
            style: TextStyle(
                fontSize: subtitleFontSize,
                color: Colors.white,
                fontFamily: "Goatham",
                height: 1.2,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
