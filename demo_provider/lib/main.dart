import 'package:demo_provider/home.dart';
import 'package:demo_provider/home_viewmodel.dart';
import 'package:demo_provider/src/login/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
runApp(
    const MyApp(),
  );}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  LoginScreen(),
    );
  }
}
