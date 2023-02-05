import 'dart:math';
import 'package:flutter/material.dart';

class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

List<Item> generateItems(int numberOfItems) {
  return List<Item>.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'Panel $index',
      expandedValue: 'This is item number $index',
    );
  });
}

class MyStatefulWidget2 extends StatefulWidget {
  const MyStatefulWidget2({super.key});

  @override
  State<MyStatefulWidget2> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget2> {
  final List<Item> _data = generateItems(3);

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
              leading: _getRandomIcon(),
              title: Text(item.headerValue),
            );
          },
          body: ListTile(title: Text(item.expandedValue)),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }

  Icon _getRandomIcon() {
    final List<IconData> icons = [
      Icons.directions_bus,
      Icons.directions_subway,
      Icons.train,
      Icons.tram,
      Icons.directions_railway
    ];
    return Icon(
      icons[Random().nextInt(icons.length)],
      color: Colors.black,
    );
  }
}
