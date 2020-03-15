import 'package:flutter/material.dart';
import 'package:app/ui/navigator.gr.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColorDark: Color(0xff296d2d),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoute.mainUI,
      navigatorKey: MyRoute.navigator.key,
      onGenerateRoute: MyRoute.onGenerateRoute,
    );
  }
}
