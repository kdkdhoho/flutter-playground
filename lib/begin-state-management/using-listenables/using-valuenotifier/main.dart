import 'package:flutter/material.dart';

/**
 * ValueNotifier은 ChangeNotifier의 간단한 버전입니다.
 *
 *
 * ValueNotifier은 값을 한 개만 가지는 경우만 적용될 수 있습니다.
 *
 * ValueNotifier은 ValueListenable과 Listenable 인터페이스를 상속받기 때문에, ListeanbleBuilder와 ValueListeanableBuilder에 동일하게 적용될 수 있습니다.
 */
void main() {
  ValueNotifier<int> counterNotifier = ValueNotifier(0); // 초기화

  runApp(MaterialApp(
      home: Scaffold(
          body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ValueListenableBuilder(
                    valueListenable: counterNotifier,
                    builder: (context, value, child) {
                      return Text('counter: $value');
                    },
                  ),
                  ElevatedButton(
                    onPressed: () => counterNotifier.value++,
                      child: Text('Increase')
                  ),
                ]
              )
          )
      )
  ));
}
