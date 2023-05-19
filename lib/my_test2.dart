import 'package:flutter/material.dart';

class MyTest2 extends StatefulWidget {
  const MyTest2({super.key});

  @override
  State<MyTest2> createState() => _MyTest2State();
}

class _MyTest2State extends State<MyTest2> {
  final ValueNotifier<String?> _time = ValueNotifier<String?>(null);

  @override
  void initState() {
    _time.value = '8898';
    // _time.value = null;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
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
    return AnimatedBuilder(
      animation: _time,
      builder: (BuildContext context, Widget? child) {
        print('AnimatedBuilder');

        if (_time.value == null) {
          return Text(_time.value.toString());
        }
        return Text(
          _time.value!,
        );
      },
    );
  }

  Widget _selectValue() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ElevatedButton(
          onPressed: () {
            _time.value = null;
          },
          child: const Text('Null'),
        ),
        const SizedBox(height: 30),
        ElevatedButton(
          onPressed: () {
            _time.value = '7';
          },
          child: const Text('7'),
        ),
        const SizedBox(height: 30),
        ElevatedButton(
          onPressed: () {
            _time.value = 'Angel';
          },
          child: const Text('Angel'),
        ),
      ],
    );
  }
}
