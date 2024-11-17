import 'package:flutter/material.dart';

class CustomBottomBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex, // 현재 선택된 탭
      onTap: (index) {
        if (index != currentIndex) {
          _navigateToPage(context, index);
        }
        onTap(index);
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.bar_chart),
          label: '통계', // "탄소 발자국" 대신 "통계"로 변경
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: '홈',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu),
          label: '메뉴',
        ),
      ],
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.grey,
    );
  }

  void _navigateToPage(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/stats'); // 통계 페이지로 이동
        break;
      case 1:
        Navigator.pushNamed(context, '/home'); // 홈 페이지로 이동
        break;
      case 2:
        Navigator.pushNamed(context, '/menu'); // 메뉴 페이지로 이동
        break;
    }
  }
}
