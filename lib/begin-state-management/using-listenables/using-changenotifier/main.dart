import 'package:flutter/material.dart';

void main() {
  final counter = Counter();

  runApp(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ListenableBuilder(
                  listenable: counter,
                  builder: (context, child) {
                    return Text('counter: ${counter.count}');
                  },
                ),
                ElevatedButton(
                  onPressed: counter.increment,
                  child: Text('increment'),
                )
              ],
            )
          )
        )
      )
  );
}

class Counter extends ChangeNotifier {
  int _count = 0;

  void increment(){
    _count++;
    notifyListeners();
  }

  int get count => _count;
}
