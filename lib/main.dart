import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: Scaffold(body: TextWidget())));
}

/// MaterialApp : 최상위 레이아웃
/// Scaffold : 화면의 기본 레이아웃 - 도화지
/// SafeArea : 화면의 안전한 영역 - 도화지의 안쪽 영역

class TextWidget extends StatelessWidget {
  const TextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                print('home button pressed');
              }),
          Icon(Icons.play_arrow),
        ],
        centerTitle: true,
        title: const Text('App Bar'),
      ),
      body: Body(),
    ));
  }
}

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 500,
        height: 500,
        color: Colors.lightGreen,
        child: Container(
          constraints: BoxConstraints(
            maxWidth: 300,
            maxHeight: 300,
          ),
          child: Container(
            width: 200,
            height: 200,
            color: Colors.lightBlue,
          ),
        ));
  }
}

class CustomStack extends StatelessWidget {
  const CustomStack({super.key});

  @override
  Widget build(BuildContext context) {
    var StackWidget = Stack(children: [
      Align(
        alignment: Alignment.center,
        child: Container(
          width: 300,
          height: 300,
          decoration: BoxDecoration(
              color: Colors.amber, borderRadius: BorderRadius.circular(150)),
        ),
      ),
      Align(
        alignment: Alignment.center,
        child: Container(
          width: 260,
          height: 260,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(130)),
        ),
      ),
      Align(
        alignment: Alignment.center,
        child: Text(
          'Count 0',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      )
    ]);
    return StackWidget;
  }
}

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        // width: double.infinity,
        // height: double.infinity,
        width: 300,
        height: 300,
        // color: Colors.pink.shade50,
        padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
        margin: const EdgeInsets.symmetric(vertical: 50, horizontal: 50),
        decoration: BoxDecoration(
          //상위에 color가 있으면 적용되지 않음 - 충돌남
          color: const Color(0xFC97B7FF),
          border: Border.all(color: Colors.black, width: 2),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.3),
                offset: Offset(10, 10),
                blurRadius: 10,
                spreadRadius: 1),
          ],
        ),
        child: const Center(
            child: Text('Hello World',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold))));
  }
}
