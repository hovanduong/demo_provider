import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/user_model.dart';

class UserFireStore{
    static  createUser(UserModel user) async {
    final docUser = FirebaseFirestore.instance.collection('user').doc(user.id!);
    await docUser.set(user.toJson());
    return user.id!;
  }
    static Stream<List<UserModel>> getAllUser() => FirebaseFirestore.instance
      .collection('user')
      // .where('id', isEqualTo: FirebaseAuthentication.getUserId())
      .orderBy('id', descending: true)
      .snapshots()
      .transform(Utils.transformer(UserModel.fromJson));
  static remoteUserById(String id) async {
    final docTodo =
        FirebaseFirestore.instance.collection('user').doc(id);
    await docTodo.delete();
  }
}



class Utils {
  Utils._();

  static StreamTransformer<QuerySnapshot<Map<String, dynamic>>, List<T>>
      transformer<T>(T Function(Map<String, dynamic> json) fromJson) =>
          StreamTransformer<QuerySnapshot<Map<String, dynamic>>,
              List<T>>.fromHandlers(
            handleData: (QuerySnapshot<Map<String, dynamic>> data,
                EventSink<List<T>> sink) {
              final snaps = data.docs.map((doc) => doc.data()).toList();
              final objects = snaps.map((json) => fromJson(json)).toList();
              sink.add(objects);
            },
          );

}
