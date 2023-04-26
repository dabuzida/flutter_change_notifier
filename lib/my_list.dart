// import 'dart:math';
import 'dart:math' as math;

import 'package:flutter/material.dart';

class MyList extends StatelessWidget {
  MyList({super.key});

  final ValueNotifier<List<int>> list = ValueNotifier<List<int>>(<int>[]);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 800,
        height: 600,
        color: Colors.teal[100],
        child: Row(
          children: <Widget>[
            AnimatedBuilder(
              animation: list,
              builder: (BuildContext context, Widget? child) {
                return Container(
                  color: Colors.red[100],
                  width: 300,
                  height: 300,
                  child: Center(child: Text(list.value.toString())),
                );
              },
            ),
            TextButton(
              onPressed: () {},
              child: Text('--------'),
            ),
            TextButton(
              onPressed: () {
                // list.value = <int>[1, 2, 3];
                list.value.addAll(<int>[1, 2, 3]);
              },
              child: Text('++++++++'),
            ),
          ],
        ),
      ),
    );
  }
}
