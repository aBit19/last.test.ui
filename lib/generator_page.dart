import 'package:flutter/material.dart';
import 'package:last_test_ui/main.dart';
import 'package:provider/provider.dart';

class GeneratorPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<WordPairState>();
    var pair = appState.current;

    IconData icon;
    if (appState.favorites.contains(pair)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    return Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      BigCard(pair: pair),
      SizedBox(
        height: 10,
      ),
      // Constraints go down, sizes go up, parent sets position
      // A widget get its own constraints from its parent.
      // A constraint is a set of 4 doubles: a min and max width, min and max height
      // Then the widget goes through its own list of children.
      // One by one the widget tells the each child what the constraints are and then asks the child what size it wants
      // to be.
      Row(mainAxisSize: MainAxisSize.min, children: [
        ElevatedButton.icon(
          onPressed: () {
            appState.toggleFavorite();
          },
          icon: Icon(icon),
          label: Text("Like"),
        ),
        SizedBox(
          width: 20,
        ),
        ElevatedButton(
            onPressed: () {
              appState.getNext();
            },
            child: Text("Next"))
      ])
    ]));
  }
}
