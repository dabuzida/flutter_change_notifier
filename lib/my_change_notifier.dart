import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MyChangeNotifier extends StatefulWidget {
  const MyChangeNotifier({super.key});

  @override
  State<MyChangeNotifier> createState() => _MyChangeNotifierState();
}

class _MyChangeNotifierState extends State<MyChangeNotifier> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
