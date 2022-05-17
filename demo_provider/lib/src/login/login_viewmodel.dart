import 'dart:developer';

import 'package:demo_provider/src/resource/firebase/authen/authen_service.dart';
import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {
  checkvalidEmail(String email) {
    return RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
        .hasMatch(email);
  }

  String checkValidInputEmail(String inputEmail, String password) {
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
    } else if (password.isEmpty) {
      error = 'Mat khau Khong duoc de trong';
    } else if (password.length < 6) {
      error = 'Mat khau Khong duoc de trong';
    }
    return error;
  }
  createEmail(String inputEmail, String inputPassword)async{
    if(checkValidInputEmail(inputEmail,inputPassword) == ''){
        final result= await Authentication.createEmail(inputEmail, inputPassword);
        if(result){
          log('tao thanh cong');
        }
    }
  }
}
