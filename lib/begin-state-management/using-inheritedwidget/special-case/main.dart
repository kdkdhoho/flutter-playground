import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final MutableCounter counter = MutableCounter(0);

  @override
  Widget build(BuildContext context) {
    return Data(
      counter: counter,
      child: MaterialApp(
        home: Home(
            onIncrement: () {
              setState(() {
                counter.value++;
              });
            }
        ),
      ),
    );
  }
}

class Home extends StatelessWidget {
  final VoidCallback onIncrement;

  const Home({super.key, required this.onIncrement});

  @override
  Widget build(BuildContext context) {
    final counter = Data.of(context).counter;

    return Scaffold(
      appBar: AppBar(
          title: Text('가변 상태 InheritedWidget 예제')
      ),
      body: Center(
        child: Text(
          'Counter: ${counter.value}',
          style: TextStyle(fontSize: 24),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onIncrement,
        child: Icon(Icons.add),
      ),
    );
  }
}

class Data extends InheritedWidget {
  final MutableCounter counter;

  const Data({super.key, required super.child, required this.counter});

  static Data of(BuildContext context) {
    final result = context.dependOnInheritedWidgetOfExactType<Data>();
    assert(result != null, 'Data를 찾을 수 없습니다.');
    return result!;
  }

  @override
  bool updateShouldNotify(Data oldWidget) {
    return true;
  }
}

class MutableCounter {
  int value;

  MutableCounter(this.value);
}