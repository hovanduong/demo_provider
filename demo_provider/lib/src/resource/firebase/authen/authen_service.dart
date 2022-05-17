
import 'package:firebase_auth/firebase_auth.dart';


class Authentication {
 

  static  createEmail(String email, String password) async {
    final auth = FirebaseAuth.instance;
   final UserCredential userCredential= await auth.createUserWithEmailAndPassword(email: email, password: password);
   return userCredential;
  }
}
