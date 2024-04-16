import 'package:flutter/material.dart';

var projects = [
  'Logistics - Outbound',
  'Logistics - Inbound',
];

class ProcessesView extends StatelessWidget {
  const ProcessesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        NavigationRail(
            extended: true,
            destinations: [
              NavigationRailDestination(
                  icon: Icon(Icons.folder),
                  label: ProcessLabel('Logistics', 'Outbound')),
              NavigationRailDestination(
                  icon: Icon(Icons.folder),
                  label: ProcessLabel('Logistics', 'Inbound')),
            ],
            selectedIndex: 0),
        const VerticalDivider(thickness: 1, width: 1),
        Expanded(child: ProcessView()),
      ],
    );
  }
}

class ProcessLabel extends StatelessWidget {
  const ProcessLabel(this.department, this.process, {Key? key})
      : super(key: key);

  final String department;
  final String process;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(department),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 10, top: 1),
          child: Text(process),
        )
      ],
    );
  }
}

class ProcessView extends StatelessWidget {
  const ProcessView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        NavigationRail(
            destinations: [
              NavigationRailDestination(
                  icon: Icon(Icons.folder),
                  label: ProcessLabel('Logistics', 'Outbound')),
              NavigationRailDestination(
                  icon: Icon(Icons.folder),
                  label: ProcessLabel('Logistics', 'Inbound')),
            ],
            selectedIndex: 0),
        const VerticalDivider(thickness: 1, width: 1),
        Expanded(child: Placeholder()),
      ],
    );
  }
}
