import 'package:flutter/material.dart';

class MyCounterModel extends ChangeNotifier {
// class CounterModel with ChangeNotifier {
  int _count = 0;
  int get count => _count;

  void increment() {
    _count += 1;
    notifyListeners();
  }
}
