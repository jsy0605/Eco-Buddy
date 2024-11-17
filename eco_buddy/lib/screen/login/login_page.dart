import 'package:flutter/material.dart';
import '../home/home_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 앱 이름과 설명
              Text(
                'ECO Buddy',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '디지털 탄소 발자국을 줄여보세요!',
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
              const SizedBox(height: 40),
              // 카카오 로그인 버튼
              ElevatedButton.icon(
                onPressed: () {
                  // 메인 페이지로 이동
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
                icon: Image.asset(
                  'assets/images/icon/kakao_icon.png', // 카카오 아이콘 경로
                  width: 24,
                  height: 24,
                ),
                label: const Text(
                  '카카오 로그인',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFEE500), // 카카오 배경색
                  elevation: 0, // 음영 고정
                  minimumSize: const Size(200, 50), // 버튼 크기
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  splashFactory: NoSplash.splashFactory, // 클릭 효과 제거
                  foregroundColor: Colors.transparent, // 클릭/호버 효과 제거
                ),
              ),
              const SizedBox(height: 16),
              // 네이버 로그인 버튼
              ElevatedButton.icon(
                onPressed: () {
                  // 메인 페이지로 이동
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
                icon: Image.asset(
                  'assets/images/icon/naver_icon.png', // 네이버 아이콘 경로
                  width: 24,
                  height: 24,
                ),
                label: const Text(
                  '네이버 로그인',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF03C75A), // 네이버 배경색
                  elevation: 0, // 음영 고정
                  minimumSize: const Size(200, 50), // 버튼 크기
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  splashFactory: NoSplash.splashFactory, // 클릭 효과 제거
                  foregroundColor: Colors.transparent, // 클릭/호버 효과 제거
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
