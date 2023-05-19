import 'package:flutter/material.dart';

class MyTest extends StatefulWidget {
  const MyTest({super.key});

  @override
  State<MyTest> createState() => _MyTestState();
}

class _MyTestState extends State<MyTest> {
  ValueNotifier<String>? _time;

  @override
  Widget build(BuildContext context) {
    print('build');
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.red)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _strings(),
          const SizedBox(width: 50),
          _selectValue(),
        ],
      ),
    );
  }

  Widget _strings() {
    print('strins');
    List<Widget> widgets = <Widget>[
      const Text('@@@'),
      const SizedBox(height: 30),
    ];
    widgets.add(_showString());
    widgets.add(const SizedBox(height: 30));
    widgets.add(const Text('###'));

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: widgets,
    );
  }

  Widget _showString() {
    if (_time == null) {
      return const Text('Null');
    }
    return AnimatedBuilder(
      animation: _time!,
      builder: (BuildContext context, Widget? child) {
        print('AnimatedBuilder');
        return Text(
          _time!.value,
        );
      },
    );
  }

  Widget _selectValue() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ElevatedButton(
          onPressed: _time == null
              ? () {
                  _time = ValueNotifier<String>('707');
                  setState(() {});
                }
              : null,
          child: const Text('초기화'),
        ),
        const SizedBox(height: 30),
        ElevatedButton(
          onPressed: _time == null
              ? null
              : () {
                  _time = null;
                  setState(() {});
                },
          child: const Text('Null'),
        ),
        const SizedBox(height: 30),
        ElevatedButton(
          onPressed: _time == null
              ? null
              : () {
                  _time!.value = '7';
                },
          child: const Text('7'),
        ),
        const SizedBox(height: 30),
        ElevatedButton(
          onPressed: _time == null
              ? null
              : () {
                  _time!.value = 'Angel';
                },
          child: const Text('Angel'),
        ),
      ],
    );
  }
}
