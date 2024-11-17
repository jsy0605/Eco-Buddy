import 'package:flutter/material.dart';
import 'screen/login/login_page.dart'; // 로그인 페이지 파일 임포트

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ECO Buddy', // 앱 제목
      theme: ThemeData(
        primarySwatch: Colors.green, // 앱 기본 테마 색상
      ),
      home: const LoginPage(), // 초기 화면으로 로그인 페이지 설정
    );
  }
}
