import 'package:flutter/material.dart';
import 'package:flutter_playground/begin-state-management/using-inheritedwidget/data.dart';

void main() {
  runApp(
    Data(
      'World!',
      child: Home()
    )
  );
}

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final String value = Data.of(context).value;

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(value),
            ]
          ),
        )
      )
    );
  }
}