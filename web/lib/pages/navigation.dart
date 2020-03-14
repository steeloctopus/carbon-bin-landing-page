import 'package:auto_route/auto_route_annotations.dart';
import 'package:carbonbins/pages/landing_page/landing_page.dart';
import 'package:carbonbins/pages/payment_page/payment_page.dart';
import 'package:carbonbins/pages/project_page/project_page.dart';

@MaterialAutoRouter()
class $MyRoute {
  @initial
  LandingPage landingPage;
  PaymentPage paymentPage;
  ProjectPage projectPage;
}
