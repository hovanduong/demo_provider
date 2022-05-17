import 'package:demo_provider/src/login/login_viewmodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'components/input_text_from_filed.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController inputEmailController, inputPasswordController;
  @override
  void initState() {
    inputEmailController = TextEditingController();
    inputPasswordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginViewModel>(
      create: (context) => LoginViewModel(),
      child: Consumer<LoginViewModel>(builder: (context, viewModel, child) {
        return Scaffold(
            body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InputWidget(
              controller: inputEmailController,
              hinteText: 'Tai khoan',
              labelText: 'Xin moi nhap tai khoan ',
            ),
            InputWidget(
              controller: inputPasswordController,
              hinteText: 'Mat khau',
              labelText: 'Xin moi nhap mat khau',
            ),
            ElevatedButton(
              onPressed: () {
                viewModel.createEmail(
                    inputEmailController.text, inputPasswordController.text);
                // if (error.isEmpty) {
                //   // router home
                // } else {
                //   // loginEmail(inputEmailController.text,inputPasswordController.text);
                //   showAlertDialog(context, error);
                // }
              },
              child: const Text('Login'),
            )
          ],
        ));
      }),
    );
  }

  showAlertDialog(BuildContext context, String error) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: const Text("Cancel"),
      onPressed: () {},
    );
    Widget continueButton = TextButton(
      child: const Text("Oke"),
      onPressed: () {
        Navigator.of(context).pop(); // dismiss dialog
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Message"),
      content: Text('$error'),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

// loginEmail(String email, String password) async {
//   final auth = FirebaseAuth.instance;
//   await auth.signInWithEmailAndPassword(
//       email: 'duong@gmail.com', password: '12345678');
// }
//    createEmail(String email, String password) async {
//     final auth = FirebaseAuth.instance;
//     await auth.createUserWithEmailAndPassword(email: 'hovnaduong@gmail.com', password: 'password123');
//   }
