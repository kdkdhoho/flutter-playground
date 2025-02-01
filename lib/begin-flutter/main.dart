import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      // Material 위젯을 추가합니다. Material 위젯은 Material 디자인 기반의 위젯들을 사용하게 해줍니다.
      home: Scaffold(
          // Material 다음으로 위치하는 위젯으로, 화면 전체를 차지하며 레이아웃을 도와주고 UI 관련 특수 기능을 제공합니다.
          // Meterial 위젯과 Scaffold 위젯을 추가하는 것이 기본 설정이라고 생각하면 된다.

          body: Center(
              child:
                  Text('Hello World!'))), // Center 위젯을 사용하여 텍스트를 중앙에 정렬시켰습니다.
    ),
  );
}
