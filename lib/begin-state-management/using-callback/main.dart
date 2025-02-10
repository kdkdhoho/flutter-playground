import 'package:flutter/material.dart';

void main() {
  runApp(Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Using Callback Example'),
            ),
            body: Center(child: Counter())));
  }
}

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<StatefulWidget> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _value = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('value: $_value'),
        IncreaseButton(value: _value, onPressed: _increaseValue),
      ],
    );
  }

  void _increaseValue(int newValue) {
    setState(() {
      _value = newValue;
    });
  }
}

class IncreaseButton extends StatelessWidget {
  final int value;
  final ValueChanged<int> onPressed;

  const IncreaseButton({super.key, required this.onPressed, required this.value});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => onPressed(value + 1),
        child: Text('Increase')
    );
  }
}
