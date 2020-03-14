// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:carbonbins/pages/landing_page/landing_page.dart';
import 'package:carbonbins/pages/payment_page/payment_page.dart';
import 'package:carbonbins/model/model.dart';
import 'package:carbonbins/pages/project_page/project_page.dart';

class MyRoute {
  static const landingPage = '/';
  static const paymentPage = '/payment-page';
  static const projectPage = '/project-page';
  static final navigator = ExtendedNavigator();
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case MyRoute.landingPage:
        if (hasInvalidArgs<Key>(args)) {
          return misTypedArgsRoute<Key>(args);
        }
        final typedArgs = args as Key;
        return MaterialPageRoute<dynamic>(
          builder: (_) => LandingPage(key: typedArgs),
          settings: settings,
        );
      case MyRoute.paymentPage:
        if (hasInvalidArgs<UserModel>(args, isRequired: true)) {
          return misTypedArgsRoute<UserModel>(args);
        }
        final typedArgs = args as UserModel;
        return MaterialPageRoute<dynamic>(
          builder: (_) => PaymentPage(userModel: typedArgs),
          settings: settings,
        );
      case MyRoute.projectPage:
        if (hasInvalidArgs<String>(args)) {
          return misTypedArgsRoute<String>(args);
        }
        final typedArgs = args as String;
        return MaterialPageRoute<dynamic>(
          builder: (_) => ProjectPage(typedArgs),
          settings: settings,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}
