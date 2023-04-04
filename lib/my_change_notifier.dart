import 'package:flutter/material.dart';
import 'package:flutter_change_notifier/my_counter_controller.dart';
import 'package:flutter_change_notifier/my_counter_controller2.dart';

class MyChangeNotifier extends StatelessWidget {
  MyChangeNotifier({super.key});

  final ValueNotifier<int> _counter = ValueNotifier<int>(10);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.purple)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 500,
            height: 500,
            decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
            child: MyCounterController(),
          ),
          Container(
            width: 500,
            height: 500,
            decoration: BoxDecoration(border: Border.all(color: Colors.red)),
            child: MyCounterController2(),
          ),
        ],
      ),
    );

    // return ListView(
    //   children: <Widget>[
    //     Row(
    //       children: <Widget>[
    //         Container(
    //           width: 500,
    //           height: 500,
    //           decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
    //           child: CounterBody(counterValueNotifier: _counter),
    //         ),
    //         ElevatedButton(
    //           onPressed: () => _counter.value--, //
    //           child: const Icon(Icons.remove),
    //         ),
    //         ElevatedButton(
    //           onPressed: () => _counter.value++,
    //           child: const Icon(Icons.add),
    //         ),
    //       ],
    //     ),
    //   ],
    // );
  }
}

class CounterBody extends StatelessWidget {
  const CounterBody({super.key, required this.counterValueNotifier});

  final ValueNotifier<int> counterValueNotifier;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text('Current counter value:'),
          // Thanks to the [AnimatedBuilder], only the widget displaying the
          // current count is rebuilt when `counterValueNotifier` notifies its
          // listeners. The [Text] widget above and [CounterBody] itself aren't
          // rebuilt.
          AnimatedBuilder(
            // [AnimatedBuilder] accepts any [Listenable] subtype.
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
