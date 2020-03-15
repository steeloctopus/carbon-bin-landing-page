// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:app/ui/main/main_ui.dart';
import 'package:app/ui/payment/payment_ui.dart';
import 'package:app/ui/project/project_ui.dart';
import 'package:app/model/model.dart';

class MyRoute {
  static const mainUI = '/';
  static const paymentPage = '/payment-page';
  static const projectPage = '/project-page';
  static final navigator = ExtendedNavigator();
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case MyRoute.mainUI:
        return MaterialPageRoute<dynamic>(
          builder: (_) => MainPage(),
          settings: settings,
        );
      case MyRoute.paymentPage:
        return MaterialPageRoute<dynamic>(
          builder: (_) => PaymentPage(),
          settings: settings,
        );
      case MyRoute.projectPage:
        if (hasInvalidArgs<UserModel>(args)) {
          return misTypedArgsRoute<UserModel>(args);
        }
        final typedArgs = args as UserModel;
        return MaterialPageRoute<dynamic>(
          builder: (_) => ProjectPage(typedArgs),
          settings: settings,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}
