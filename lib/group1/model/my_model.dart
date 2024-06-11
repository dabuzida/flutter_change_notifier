class MyModel {
  factory MyModel() => _instance;
  MyModel._internal();
  static final MyModel _instance = MyModel._internal();

  String title = '';
  final List<int> listInt = <int>[];
}
