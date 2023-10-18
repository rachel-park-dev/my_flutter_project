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
        body: const Column(children: [
          TestCheckBox(),
        ]),
      )));
}

class TestCheckBox extends StatefulWidget {
  const TestCheckBox({super.key});

  @override
  State<TestCheckBox> createState() => _TestCheckBoxState();
}

class _TestCheckBoxState extends State<TestCheckBox> {
  late List<bool> isChecked;

  @override
  void initState() {
    super.initState();
    isChecked = [false, false, false];
  }

  @override
  Widget build(BuildContext context) {
    var list = isChecked
        .asMap()
        .entries
        .map((e) => Checkbox(
              value: e.value,
              onChanged: (value) => changedValue(value!, e.key),
            ))
        .toList();
    return Row(
      children: list,
    );
  }

  void changedValue(bool value, int index) {
    setState(() {
      isChecked[index] = value;
    });
  }
}
