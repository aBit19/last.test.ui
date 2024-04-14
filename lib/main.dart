import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:last_test_ui/ProcessView.dart';
import 'package:last_test_ui/generator_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ProcessView());
}

class LastTestApp extends StatelessWidget {
  const LastTestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WordPairState(),
      child: MaterialApp(
        title: "The Last Test",
        home: HomePage(),
        theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange)),
      ),
    );
  }
}

// create a class for an appbar widget
class MyAppBar extends StatelessWidget {
  const MyAppBar({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
    );
  }
}

class WordPairState extends ChangeNotifier {
  var current = WordPair.random();
  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }

  var favorites = <WordPair>[];
  void toggleFavorite() {
    if (favorites.contains(current)) {
      favorites.remove(current);
    } else {
      favorites.add(current);
    }
    notifyListeners();
  }
}

class SelectedPageState extends ChangeNotifier {
  var selectedIndex = 0;

  void setSelectedIndex(int idx) {
    selectedIndex = idx;
    notifyListeners();
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SelectedPageState(),
      child: Scaffold(
          body: Row(
        children: [
          NavigationWidget(),
          MainContent(),
        ],
      )),
    );
  }
}

class NavigationWidget extends StatelessWidget {
  const NavigationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var changeContext = context.watch<SelectedPageState>();
    return LayoutBuilder(builder: (context, contstraints) {
      return SafeArea(
        child: NavigationRail(
          extended: contstraints.maxWidth >= 600,
          destinations: [
            NavigationRailDestination(
                icon: Icon(Icons.folder), label: Text("Logistics")),
            NavigationRailDestination(
                icon: Icon(Icons.folder), label: Text("HR")),
          ],
          selectedIndex: changeContext.selectedIndex,
          onDestinationSelected: (value) {
            changeContext.setSelectedIndex(value);
          },
        ),
      );
    });
  }
}

class MainContent extends StatelessWidget {
  const MainContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var selectedIndex = context.watch<SelectedPageState>().selectedIndex;
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = GeneratorPage();
      case 1:
        page = Environments();
      case 2:
        page = Placeholder();
      default:
        throw UnimplementedError("No page for selected index $selectedIndex");
    }
    return Expanded(
        child: Container(
      color: Theme.of(context).colorScheme.primaryContainer,
      child: page,
    ));
  }
}

class Environments extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var favorites = context.watch<WordPairState>().favorites;

    if (favorites.isEmpty) return Center(child: Text("No favorites yet!"));

    return Center(
      child: ListView(
        children: [
          Padding(
              padding: const EdgeInsets.all(20),
              child: Text("You have ${favorites.length} favorites word pairs")),
          for (var pair in favorites)
            ListTile(
                leading: Icon(Icons.favorite), title: Text(pair.asCamelCase))
        ],
      ),
    );
  }
}

class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.pair,
  });

  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );
    return Card(
      color: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          pair.asLowerCase,
          style: style,
          semanticsLabel: "${pair.first} ${pair.second}",
        ),
      ),
    );
  }
}
