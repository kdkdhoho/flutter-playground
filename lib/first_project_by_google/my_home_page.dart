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
     * LayoutBuilder의 builder 콜백은 constrains가 변경될 때마다 호출됩니다.
     * - 앱의 창 크기를 조절하는 경우
     * - 사용자가 핸드폰을 가로 모드에서 세로 모드로 변경하는 경우 (혹은 그 반대의 경우)
     * - MyHomePage 옆에 있는 일부 위젯의 크기가 커져, MyHomePage의 제약 조건이 작아지는 경우 등등
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
