import 'package:flutter/material.dart';

List<String> tests = [
  'Test 1',
  'Test 2',
];

class ProcessView extends StatelessWidget {
  const ProcessView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ProcessViewAppBar(),
    );
  }
}

class ProcessViewAppBar extends StatelessWidget {
  const ProcessViewAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const int count = 2;
    return DefaultTabController(
        initialIndex: 0,
        length: count,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Logistics"),
            notificationPredicate: (notification) => notification.depth == 1,
            scrolledUnderElevation: 4.0,
            shadowColor: Theme.of(context).shadowColor,
            bottom: TabBar(
              tabs: <Widget>[
                Tab(icon: const Icon(Icons.home), text: 'Documentation'),
                Tab(icon: const Icon(Icons.folder), text: 'Tests'),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              Placeholder(),
              ListView.builder(
                itemCount: tests.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(tests[index]),
                  );
                },
              ),
            ],
          ),
        ));
  }
}
