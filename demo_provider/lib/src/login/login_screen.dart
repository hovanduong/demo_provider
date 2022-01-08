import 'package:demo_provider/src/base/base_widget.dart';
import 'package:demo_provider/src/login/login_viewmodel.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // LoginViewModel? _viewModel;

  @override
  Widget build(BuildContext context) {
    return BaseWidget<LoginViewModel>(
        viewModel: LoginViewModel(),
        onViewModelReady: (viewModel) {
          // _viewModel!.init();
        },
        builder: (context, viewmoel, child) {
          return Scaffold(
              body: Container(
            color: Colors.red,
          ));
        });
  }
}
