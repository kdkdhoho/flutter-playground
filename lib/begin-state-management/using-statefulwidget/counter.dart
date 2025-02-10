import 'package:flutter/material.dart';

class Counter extends StatefulWidget {

  const Counter({super.key});

  @override
  State createState() => _CounterState();
}

class _CounterState extends State<Counter> {

  var count = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('count: $count'),
        ElevatedButton(
            onPressed: () {
                setState(() {
                  increase();
                });
        }, child: Text('Press'))
      ],
    );
  }

  void increase() {
    count++;
  }
}