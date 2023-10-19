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
          TestRadioButton(),
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

class TestRadioButton extends StatefulWidget {
  const TestRadioButton({super.key});

  @override
  State<TestRadioButton> createState() => _TestRadioButtonState();
}

enum TestRadioValue {
  test1,
  test2,
  test3,
}

class _TestRadioButtonState extends State<TestRadioButton> {
  TestRadioValue? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Radio<TestRadioValue>(
              value: TestRadioValue.test1,
              groupValue: selectedValue,
              onChanged: ((value) => setState(() {
                    selectedValue = value!;
                  }))),
          title: Text(TestRadioValue.test1.name),
          onTap: (() => setState(() {
                if (selectedValue != TestRadioValue.test1)
                  selectedValue = TestRadioValue.test1;
              })),
        ),
        ListTile(
          leading: Radio<TestRadioValue>(
            value: TestRadioValue.test2,
            groupValue: selectedValue,
            onChanged: ((value) => setState(() {
                  selectedValue = value!;
                })),
          ),
          title: Text(TestRadioValue.test2.name),
          onTap: (() => setState(() {
                if (selectedValue != TestRadioValue.test2)
                  selectedValue = TestRadioValue.test2;
              })),
        ),
        ListTile(
          leading: Radio<TestRadioValue>(
            value: TestRadioValue.test3,
            groupValue: selectedValue,
            onChanged: ((value) => setState(() {
                  selectedValue = value!;
                })),
          ),
          title: Text(TestRadioValue.test3.name),
          onTap: (() => setState(() {
                if (selectedValue != TestRadioValue.test3)
                  selectedValue = TestRadioValue.test3;
              })),
        ),
      ],
    );
  }
}
