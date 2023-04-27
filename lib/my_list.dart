// import 'dart:math';
import 'dart:math' as math;

import 'package:flutter/material.dart';

class MyList extends StatefulWidget {
  const MyList({super.key});

  @override
  State<MyList> createState() => _MyListState();
}

class _MyListState extends State<MyList> {
  // final ValueNotifier<List<int>> list = ValueNotifier<List<int>>(<int>[]);
  ValueNotifier<List<int>>? list;

  @override
  void initState() {
    _fetch();
    super.initState();
  }

  Future<void> _fetch() async {
    await Future<void>.delayed(const Duration(seconds: 1));
    list = ValueNotifier<List<int>>(<int>[]); // notifyListeners x
    list!.value = <int>[9999]; // notifyListeners x
    await Future<void>.delayed(const Duration(seconds: 1));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    if (list == null) {
      return const Center(child: CircularProgressIndicator());
    }
    return Center(
      child: Container(
        width: 800,
        height: 600,
        color: Colors.teal[100],
        child: Row(
          children: <Widget>[
            AnimatedBuilder(
              animation: list!,
              builder: (BuildContext context, Widget? child) {
                print('AnimatedBuilder');
                print(list!.hashCode);
                return Container(
                  color: Colors.red[100],
                  width: 300,
                  height: 300,
                  child: Center(child: Text(list!.value.toString())),
                );
              },
            ),
            TextButton(
              onPressed: () {},
              child: Text('--------'),
            ),
            TextButton(
              onPressed: () {
                DateTime x = DateTime.now();
                final int s = x.second;
                list!.value = <int>[1, 2, 3];
                print(list!.hashCode);
                // list.value.addAll(<int>[1, 2, 3]);
              },
              child: Text('++++++++'),
            ),
          ],
        ),
      ),
    );
  }
}
