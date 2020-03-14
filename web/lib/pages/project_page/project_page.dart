import 'package:carbonbins/pages/project_page/project_page_widget.dart';
import 'package:carbonbins/utils/responsive_widget.dart';
import 'package:flutter/material.dart';

class ProjectPage extends StatefulWidget {
  final String firstName;

  ProjectPage(this.firstName);

  @override
  _ProjectPageState createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
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
                  largeScreen: ProjectPageWidget(
                    firstName: widget.firstName,
                  ),
                  mediumScreen: ProjectPageWidget(
                    firstName: widget.firstName,
                    headerFontSize: 70.0,
                  ),
                  smallScreen: ProjectPageWidget(
                    firstName: widget.firstName,
                    headerFontSize: 60.0,
                    topMargin: 20.0,
                    showImage: false,
                    subtitleFontSize: 16.0,
                    isSmall: true,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
