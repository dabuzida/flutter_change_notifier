import 'package:flutter/material.dart';
import 'package:flutter_change_notifier/group1/my_view.dart';
import 'package:flutter_change_notifier/my2_change_notifier.dart';
import 'package:flutter_change_notifier/my_change_notifier.dart';
import 'package:flutter_change_notifier/my_list.dart';

import 'counter/my_counter.dart';
import 'my_test.dart';
import 'my_test2.dart';
import 'my_test3.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'ChangeNotifier',
      home: MyContainer(),
    );
  }
}

class MyContainer extends StatelessWidget {
  const MyContainer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ChangeNotifier'),
        elevation: 0,
        foregroundColor: Colors.white,
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      // body: MyChangeNotifier(),
      // body: My2ChangeNotifier(),
      // body: Row(
      //   children: const <Widget>[
      //     Expanded(child: MyTest()),
      //     Expanded(child: MyTest2()),
      //   ],
      // ),
      // body: const MyTest3(),
      // body: MyList(),
      //
      body: MyCounter(),
      // body: MyView(),
    );
  }
}
