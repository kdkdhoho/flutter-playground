import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_playground/begin-state-management/using-widget-constructor/counter.dart';

void main() {
  runApp(Home());
}

class Home extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int count = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Counter(count: count),
                  Counter(count: count),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          count++;
                        });
                      },
                      child: Text('Increase')
                  )
                ],
              ),
            )
        )
    );
  }
}