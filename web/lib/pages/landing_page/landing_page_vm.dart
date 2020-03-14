import 'dart:async';

import 'package:carbonbins/model/model.dart';
import 'package:carbonbins/utils/validator.dart';

class LandingPageViewModel {
  StreamController<UserModel> validData = StreamController<UserModel>();

  //controller
  StreamController<String> firstNameStream = StreamController<String>();
  StreamController<String> lastNameStream = StreamController<String>();
  StreamController<String> emailStream = StreamController<String>();

  void dispose() {
    validData.close();
    firstNameStream.close();
    lastNameStream.close();
    emailStream.close();
  }

  void click(String firstName, String lastName, String email, String amount) {
    if (firstName.length < 3) {
      firstNameStream.add("h");
      return;
    } else {
      firstNameStream.add(null);
    }

    if (lastName.length < 3) {
      lastNameStream.add("Please input valid last name");
      return;
    } else {
      lastNameStream.add(null);
    }
    if (!Validator.isEmailValid(email)) {
      emailStream.add("Please input valid email name");
      return;
    } else {
      emailStream.add(null);
    }

    //post valid data
    var model = UserModel(firstName, lastName, email, amount);
    validData.add(model);
  }
}
