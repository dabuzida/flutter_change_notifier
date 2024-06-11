import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_change_notifier/group1/controller/my_controller.dart';
import 'package:flutter_change_notifier/group1/model/my_model.dart';

class MyView extends StatelessWidget {
  MyView({super.key});

  final Random _random = Random(0);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          const Text('Current values:'),
          ListenableBuilder(
            listenable: MyController(),
            builder: (BuildContext context, Widget? child) {
              return Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blue,
                      ),
                    ),
                    child: Text(MyModel().title),
                  ),
                  Container(
                    decoration: BoxDecoration(border: Border.all(color: Colors.red)),
                    width: 300,
                    height: 500,
                    child: ListView.builder(
                      itemCount: MyModel().listInt.length,
                      itemBuilder: (BuildContext context, int index) => ListTile(
                        title: Text(
                          MyModel().listInt[index].toString(),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                child: const Icon(Icons.add),
                onPressed: () {
                  MyController().addValue(_random.nextInt(1 << 31));
                },
              ),
              TextButton(
                child: const Icon(Icons.remove),
                onPressed: () {
                  MyController().removeLastValue();
                },
              ),
              FilledButton(
                child: const Icon(Icons.near_me),
                onPressed: () {
                  MyController().setTitle(generateRandomString(5));
                },
              ),
              FilledButton.tonal(
                child: const Icon(Icons.air),
                onPressed: () {
                  MyController().setTitle2();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  String generateRandomString(int len) {
    final Random r = Random();
    const String chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    return List.generate(len, (index) => chars[r.nextInt(chars.length)]).join();
  }
}
