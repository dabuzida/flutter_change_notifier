import 'package:flutter/material.dart';

import 'count_model.dart';

class MyCounter extends StatelessWidget {
  MyCounter({super.key});

  final MyCounterModel _counterModel = MyCounterModel();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text('Current counter value:'),
          ListenableBuilder(
            listenable: _counterModel,
            builder: (BuildContext context, Widget? child) {
              return Text('${_counterModel.count}');
            },
          ),
          ElevatedButton(
            onPressed: () {
              _counterModel.increment();
            },
            child: const Text('+++'),
          ),
        ],
      ),
    );
  }
}
