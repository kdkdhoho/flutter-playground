import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'my_app_state.dart';

class LikesPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var state = context.watch<MyAppState>();

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text('You have ${state.likes.length} favorites:')
        ),

        // case1 - for
        /*for (var word in state.likes)
          ListTile(leading: Icon(Icons.favorite), title: Text(word.asLowerCase))*/

        // case2 - stream
         ...state.likes.map((word) {
           return ListTile(
             leading: Icon(Icons.favorite),
             title: Text(word.asLowerCase)
           );
         })
      ],
    );
  }
}
