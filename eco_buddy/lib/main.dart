import 'package:flutter/material.dart';
import 'package:eco_buddy/screen/home/home_page.dart';
import 'package:eco_buddy/screen/menu/menu_page.dart';
import 'package:eco_buddy/screen/stats/stats_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home', // 초기 화면
      routes: {
        '/home': (context) => const HomePage(), // 홈 페이지
        '/menu': (context) => const MenuPage(), // 메뉴 페이지
        '/stats': (context) => const StatsPage(), // 통계 페이지
      },
    );
  }
}
