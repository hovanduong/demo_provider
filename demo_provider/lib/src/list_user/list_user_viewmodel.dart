import 'package:demo_provider/src/resource/model/user_model.dart';
import 'package:flutter/material.dart';

import '../resource/firebase/firestore/user_firestore_service.dart';

class ListUserViewModel extends ChangeNotifier{
  getAllUser()=> UserFireStore.getAllUser();
  remoteUserById(String id)=>UserFireStore.remoteUserById(id);
}