import 'package:flutter/material.dart';

class MyCounterOutput extends StatelessWidget {
  const MyCounterOutput({super.key, required this.counterValueNotifier});

  final ValueNotifier<int> counterValueNotifier;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text('Current counter value:'),
          AnimatedBuilder(
            animation: counterValueNotifier,
            builder: (BuildContext context, Widget? child) {
              return Text('${counterValueNotifier.value}');
            },
          ),
        ],
      ),
    );
  }
}
