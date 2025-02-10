import 'package:flutter/cupertino.dart';

class Data extends InheritedWidget {

  final String value;

  const Data(this.value, {super.key, required super.child});

  static Data of(BuildContext context) {
    final result = context.dependOnInheritedWidgetOfExactType<Data>();
    assert(result != null, 'Data 클래스가 null 입니다.');
    return result!;
  }

  @override
  bool updateShouldNotify(Data oldWidget) {
    return value != oldWidget.value;
  }
}