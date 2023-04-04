import 'package:flutter/material.dart';
import 'package:flutter_change_notifier/my_counter_output.dart';

class MyCounterController extends StatelessWidget {
  MyCounterController({super.key});

  final ValueNotifier<int> _counter = ValueNotifier<int>(10);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        MyCounterOutput(counterValueNotifier: _counter),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              width: 200,
              height: 150,
              color: Colors.red,
              child: TextButton(
                onPressed: () => _counter.value--,
                child: const Icon(
                  Icons.remove,
                  color: Colors.amber,
                ),
              ),
            ),
            Container(
              width: 200,
              height: 150,
              color: Colors.green,
              child: TextButton(
                onPressed: () => _counter.value++,
                child: const Icon(
                  Icons.add,
                  color: Colors.amber,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
