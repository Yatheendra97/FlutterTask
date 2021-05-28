import 'package:flutter/cupertino.dart';

class OTPProvider extends ChangeNotifier {
  String number = "";
  bool isLoggedIn = false;
  setNumber(String num) {
    number = num;
    notifyListeners();
  }

  setLogin(bool login) {
    isLoggedIn = true;
    notifyListeners();
  }
}
