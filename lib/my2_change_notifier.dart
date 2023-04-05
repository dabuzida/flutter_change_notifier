// import 'dart:math';
import 'dart:math' as math;

import 'package:flutter/material.dart';

class My2ChangeNotifier extends StatelessWidget {
  My2ChangeNotifier({super.key});
  final ValueNotifier<Color> color = ValueNotifier<Color>(Colors.amberAccent);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 800,
        height: 600,
        color: Colors.teal[100],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            MyLeftBox(colorValueNotifier: color),
            MyRightBox(colorValueNotifier: color),
            // AnimatedBuilder(
            //   animation: color,
            //   builder: (BuildContext context, Widget? child) {
            //     return Container(
            //       width: 300,
            //       height: 300,
            //       color: color.value,
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}

class MyLeftBox extends StatelessWidget {
  const MyLeftBox({super.key, required this.colorValueNotifier});
  final ValueNotifier<Color> colorValueNotifier;

  Color _getColor() {
    return Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      color: Colors.indigoAccent,
      alignment: Alignment.bottomCenter,
      child: Container(
        width: 200,
        height: 50,
        color: Colors.green,
        child: TextButton(
          onPressed: () {
            // _color.value = _getColor();
            colorValueNotifier.value = _getColor();
            // colorValueNotifier.addListener(() {});
          },
          child: const Text(
            'change color',
            style: TextStyle(
              fontSize: 30,
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}

class MyRightBox extends StatefulWidget {
  const MyRightBox({super.key, required this.colorValueNotifier});
  final ValueNotifier<Color> colorValueNotifier;

  @override
  State<MyRightBox> createState() => _MyRightBoxState();
}

class _MyRightBoxState extends State<MyRightBox> {
  @override
  void initState() {
    super.initState();
    widget.colorValueNotifier.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      color: widget.colorValueNotifier.value,
    );

    // return AnimatedBuilder(
    //   animation: colorValueNotifier,
    //   builder: (BuildContext context, Widget? child) {
    //     return Container(
    //       width: 300,
    //       height: 300,
    //       color: colorValueNotifier.value,
    //     );
    //   },
    // );
  }
}
