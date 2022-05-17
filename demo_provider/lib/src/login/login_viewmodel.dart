import 'dart:developer';

import 'package:demo_provider/src/resource/firebase/authen/authen_service.dart';
import 'package:demo_provider/src/resource/firebase/firestore/user_firestore_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../resource/model/user_model.dart';

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
        UserCredential userCredential= await Authentication.createEmail(inputEmail, inputPassword);
        if(userCredential.user!.uid.isNotEmpty){
            UserModel userModel=UserModel(id: userCredential.user!.uid, email: userCredential.user!.email, name: 'name');
            UserFireStore.createUser(userModel);
        }
    }
  }
}
