import 'package:flutter/material.dart';

class HomeModel extends ChangeNotifier {
  int counter = 0;

  incrementCounter() {
    counter++;
    notifyListeners();
  }
}
