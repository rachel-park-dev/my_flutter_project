import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      title: "hello",
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Gesture Example'),
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                print('Pressed add button');
              },
            ),
            IconButton(
              icon: const Icon(Icons.remove),
              onPressed: () {
                print('Pressed remove button');
              },
            ),
          ],
        ),
        body: const Column(children: [TestPopupMenu()]),
      )));
}

class TestPopupMenu extends StatefulWidget {
  const TestPopupMenu({super.key});

  @override
  State<TestPopupMenu> createState() => _TestPopupMenuState();
}

enum TestRadioValue {
  first,
  second,
  third,
}

class _TestPopupMenuState extends State<TestPopupMenu> {
  TestRadioValue? selectedValue = TestRadioValue.first;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (context) => TestRadioValue.values
          .map((value) => PopupMenuItem(
                value: value,
                child: Text(value.name),
              ))
          .toList(),
      onSelected: (newValue) => setState(() => selectedValue = newValue),
      child: ListTile(
        title: Text(selectedValue!.name),
        trailing: const Icon(Icons.arrow_drop_down),
      ),
    );
  }
}
