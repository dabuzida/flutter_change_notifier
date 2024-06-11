import 'package:flutter/material.dart';
import 'package:flutter_change_notifier/group1/model/my_model.dart';

class MyController extends ChangeNotifier {
  factory MyController() => _instance;
  MyController._internal();
  static final MyController _instance = MyController._internal();

  void addValue(int value) {
    MyModel().listInt.add(value);
    notifyListeners();
  }

  void removeLastValue() {
    if (MyModel().listInt.isNotEmpty) {
      MyModel().listInt.removeLast();
      notifyListeners();
    }
  }

  void setTitle(String title) {
    MyModel().title = title;
    notifyListeners();
  }

  void setTitle2() {
    MyModel().title = 'title';
    notifyListeners();
  }
}
