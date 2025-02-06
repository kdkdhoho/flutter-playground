import 'package:flutter/material.dart';
import 'package:flutter_playground/first_project_by_google/generator_page.dart';

import 'likes_page.dart';
import 'my_app_state.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;

  /**
   * 모든 build 메서드는 위젯, 또는 위젯 트리를 반환해야 합니다.
   */
  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = GeneratorPage();
        break;
      case 1:
        page = LikesPage();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    /**
     * 반응형 위젯을 만들기 위해 사용하는 위젯 중 하나인, LayoutBuilder 입니다.
     *
     * LayoutBuilder의 builder 콜백은 constrains가 변경될 때마다 호출됩니다. constrains 가 변경되는 경우는 다음과 같습니다.
     * - 앱의 창 크기를 조절하는 경우
     * - 사용자가 핸드폰을 가로 모드에서 세로 모드로 변경하는 경우 (혹은 그 반대의 경우)
     * - MyHomePage 옆에 있는 일부 위젯의 크기가 커져, MyHomePage의 제약 조건이 작아지는 경우 등등
     *
     * constraints는 부모로부터 전달받는 파라미터입니다.
     *
     * LayoutBuilder와 같은 Builder 위젯들 (ListView.Builder, GridView.builder, Builder, FutureBuilder 등)은 모두 동작 방식이 통일됩니다.
     * 모든 Builder 위젯은 builder 라는 파라미터를 가집니다. builder 파라미터는 항상 콜백 함수를 인자로 받습니다.
     * 이 콜백 함수는 **builder function** 입니다. builder function은, 부모 위젯에 데이터를 전달하는 콜백 함수이며, 부모 위젯은 전달받은 데이터를 사용하여 build하고 자식 위젯을 반환합니다.**
     *
     */
    return LayoutBuilder(
      builder: (context, constrains) {
        return Scaffold(
            body: Row(children: [
          SafeArea(
              child: NavigationRail(
                  extended: constrains.maxWidth >= 600,
                  destinations: [
                    NavigationRailDestination(
                        icon: Icon(Icons.home), label: Text('Home')),
                    NavigationRailDestination(
                        icon: Icon(Icons.favorite), label: Text('Favorites'))
                  ],
                  selectedIndex: selectedIndex,
                  onDestinationSelected: (value) {
                    setState(() {
                      selectedIndex = value;
                    });
                  })),
          Expanded(
              child: Container(
            color: Theme.of(context).colorScheme.primaryContainer,
            child: page,
          ))
        ]));
      },
    );
  }

  IconData chooseIcon(final MyAppState appState) {
    if (appState.likes.contains(appState.current)) {
      return Icons.favorite;
    }
    return Icons.favorite_border;
  }
}
