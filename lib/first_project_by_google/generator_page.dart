import 'package:flutter/material.dart';
import 'package:flutter_playground/first_project_by_google/big_card.dart';
import 'package:flutter_playground/first_project_by_google/my_app_state.dart';
import 'package:provider/provider.dart';

class GeneratorPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BigCard(pair: appState.current),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
                onPressed: appState.toggleLike,
                icon: chooseIcon(appState),
                label: Text('Like')),
            ElevatedButton(onPressed: appState.getNext, child: Text('Next'))
          ],
        )
      ],
    ));
  }

  Icon chooseIcon(final MyAppState appState) {
    if (appState.likes.contains(appState.current)) {
      return Icon(Icons.favorite);
    }
    return Icon(Icons.favorite_border);
  }
}
