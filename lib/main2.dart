import 'dart:math';
import 'package:flutter/material.dart';

class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    required this.icon,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  IconData icon;
  bool isExpanded;
}

class MyStatefulWidget2 extends StatefulWidget {
  const MyStatefulWidget2({super.key});

  @override
  State<MyStatefulWidget2> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget2> {
  final List<Item> _data = [
    Item(
        headerValue: 'Public Transport(MARTA)',
        expandedValue: 'This is panel 1',
        icon: Icons.train),
    Item(
        headerValue: 'UBER',
        expandedValue: 'This is panel 2',
        icon: Icons.local_taxi),
    Item(
        headerValue: 'Walk',
        expandedValue: 'This is panel 3',
        icon: Icons.directions_walk),
    Item(
        headerValue: 'Car',
        expandedValue: 'This is panel 4',
        icon: Icons.directions_car),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: _buildPanel(),
      ),
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = !isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              leading: Icon(item.icon, color: Colors.black),
              title: Text(item.headerValue),
            );
          },
          body: ListTile(title: Text(item.expandedValue)),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}
