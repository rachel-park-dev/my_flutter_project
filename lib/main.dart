import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: Scaffold(body: TextWidget())));
}

/// MaterialApp : 최상위 레이아웃
/// Scaffold : 화면의 기본 레이아웃 - 도화지
/// SafeArea : 화면의 안전한 영역 - 도화지의 안쪽 영역

/// 단축키 stless : stateless 위젯 생성
class TextWidget extends StatelessWidget {
  const TextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Text(
            'Hello Flutter!',
            style: TextStyle(
                fontSize: 40, color: Colors.blue, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
