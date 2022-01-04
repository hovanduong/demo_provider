import 'package:demo_provider/home.dart';
import 'package:demo_provider/home_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
runApp(
    ChangeNotifierProvider(
      create: (context) => HomeModel(),
      child: const MyApp(),
    ),
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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
