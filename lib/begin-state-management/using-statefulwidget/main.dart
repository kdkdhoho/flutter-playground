import 'package:flutter/material.dart';
import 'package:flutter_playground/begin-state-management/using-statefulwidget/counter.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Center(
          child: Counter(),
        )
      )
    )
  );
}