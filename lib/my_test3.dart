import 'package:flutter/material.dart';

class MyTest3 extends StatefulWidget {
  const MyTest3({super.key});

  @override
  State<MyTest3> createState() => _MyTest3State();
}

class _MyTest3State extends State<MyTest3> {
  final ValueNotifier<String?> _string = ValueNotifier('side');

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _showValues(),
        const SizedBox(width: 50),
        _setValue(),
      ],
    );
  }

  Widget _showValues() {
    List<Widget> widgets = <Widget>[
      const Text('@@@'),
      const SizedBox(height: 30),
    ];
    widgets.add(_showValue());
    widgets.add(const SizedBox(height: 30));
    widgets.add(const Text('###'));

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: widgets,
    );
  }

  Widget _showValue() {
    return AnimatedBuilder(
      animation: _string,
      builder: (BuildContext context, Widget? child) {
        print('call AnimatedBuilder');
        return Text(
          _string.value ?? 'Null',
        );
      },
    );
  }

  Widget _setValue() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ElevatedButton(
          onPressed: () {
            _string.value = null;
          },
          child: const Text('Null'),
        ),
        const SizedBox(height: 30),
        ElevatedButton(
          onPressed: () {
            _string.value = '7';
          },
          child: const Text('7'),
        ),
        const SizedBox(height: 30),
        ElevatedButton(
          onPressed: () {
            _string.value = 'Angel';
          },
          child: const Text('Angel'),
        ),
        const SizedBox(height: 30),
        ElevatedButton(
          onPressed: () async {
            ss();
          },
          child: const Text('Asynchronous'),
        ),
      ],
    );
  }

  Future<void> ss() async {
    await Future.delayed(const Duration(seconds: 1));
    _string.value = 'Asynchronous'; // 비동기통신 중 값이 바뀌면, 비동기 끝나지 않아도 AnimatedBuilder 호출됨
    print(1);
    await Future.delayed(const Duration(seconds: 1));
    print(2);
    _string.value = 'test';
  }
}
