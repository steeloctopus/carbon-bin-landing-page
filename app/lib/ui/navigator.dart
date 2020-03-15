import 'package:app/ui/main/main_ui.dart';
import 'package:app/ui/payment/payment_ui.dart';
import 'package:app/ui/project/project_ui.dart';
import 'package:auto_route/auto_route_annotations.dart';

@MaterialAutoRouter()
class $MyRoute {
  @initial
  MainPage mainUI;
  PaymentPage paymentPage;
  ProjectPage projectPage;
}
