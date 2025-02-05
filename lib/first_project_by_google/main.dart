import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'my_app_state.dart';
import 'my_home_page.dart';

/**
 * 앱의 시작점입니다.
 * MyApp 클래스이 반환하는 위젯을 화면에 그리게 됩니다.
 */
void main() {
  runApp(MyApp());
}

/**
 * 모든 위젯의 시작(Root)가 되는 클래스입니다.
 * ChangeNotifierProvider를 사용하여 전체 앱에 제공합니다. 이를 통해 앱이 위젯의 상태를 알 수 있게 됩니다.
 */
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
          title: 'My Namer App',
          theme: ThemeData(
              useMaterial3: true,
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue)),
          home: MyHomePage()),
    );
  }
}
