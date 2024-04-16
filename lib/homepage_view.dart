import 'package:flutter/material.dart';
import 'package:last_test_ui/processes_view.dart';

List<String> tests = [
  'Logistics',
  'HR Sympa',
];

class MainViewAppBar extends StatelessWidget {
  const MainViewAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const int count = 1;
    return DefaultTabController(
        initialIndex: 0,
        length: count,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Last Test"),
            notificationPredicate: (notification) => notification.depth == 1,
            scrolledUnderElevation: 4.0,
            shadowColor: Theme.of(context).shadowColor,
            bottom: TabBar(
              tabs: <Widget>[
                Tab(icon: const Icon(Icons.folder), text: 'Processes'),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
             ProcessesView(), 
            ],
          ),
        ));
  }
}
