import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {
  checkvalidEmail(String email) {
    return RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
        .hasMatch(email);
  }

  String checkValidInputEmail(String inputEmail) {
    //rong
    // dinh dang email
    //do dai lon > 6
    //check khoang trang
    //mail da ton tai ? // xu ly service
    //
    String error = '';
    if (inputEmail.isEmpty) {
      error = 'Khong duoc de trong';
    } else if (!checkvalidEmail(inputEmail)) {
      error = 'Sai dinh dang';
    }
    return error;
  }
}
