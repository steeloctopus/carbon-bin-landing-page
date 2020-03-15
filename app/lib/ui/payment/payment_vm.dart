import 'dart:async';

import 'package:app/model/model.dart';
import 'package:app/utils/validator.dart';

class PaymentVM {
  StreamController<UserModel> validData = StreamController<UserModel>();

  void dispose() {
    validData.close();
  }

  void click(String firstName, String lastName, String email, String amount) {
    if (firstName.length < 3) {
      return;
    } else {}

    if (lastName.length < 3) {
      return;
    } else {}
    if (!Validator.isEmailValid(email)) {
      return;
    } else {}

    //post valid data
    var model = UserModel(
        firstName: firstName, lastName: lastName, email: email, amount: amount);
    validData.add(model);
  }
}
