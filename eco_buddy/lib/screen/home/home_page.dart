import 'package:flutter/material.dart';
import '../../common/widget/custom_bottom_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 화면 높이 계산
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    // 캐릭터 위치 (화면 정중앙보다 약간 아래 + 10px 더 아래)
    final characterTopPosition = screenHeight * 0.56; // 기존 0.55에서 10px 추가로 아래로
    final characterLeftPosition = (screenWidth - 120) / 2; // 가로 중앙 (캐릭터 크기 고려)

    return Scaffold(
      backgroundColor: const Color(0xFFFFF8E1),
      body: Stack(
        children: [
          // 배경 이미지
          Positioned.fill(
            child: Image.asset(
              'assets/images/background/background_1.png',
              fit: BoxFit.cover,
            ),
          ),
          // 바닥 이미지
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/floor/floor_1.png',
              fit: BoxFit.cover,
              height: 150,
            ),
          ),
          // 상단 사용자 정보 및 토큰
          Positioned(
            top: 20,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildUserInfo(),
                _buildTokenInfo(),
              ],
            ),
          ),
          // 캐릭터 고정 위치
          Positioned(
            top: characterTopPosition,
            left: characterLeftPosition,
            child: Image.asset(
              'assets/images/character/character_1.png',
              width: 160, // 기존 크기보다 더 큼
              height: 160, // 기존 크기보다 더 큼
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomBar(
        currentIndex: 1, // 홈 페이지는 인덱스 1
        onTap: (index) {
          if (index != 1) {
            switch (index) {
              case 0:
                Navigator.pushNamed(context, '/stats'); // 통계 페이지로 이동
                break;
              case 2:
                Navigator.pushNamed(context, '/menu'); // 메뉴 페이지로 이동
                break;
            }
          }
        },
      ),
    );
  }

  // 사용자 정보 위젯
  Widget _buildUserInfo() {
    return Container(
      decoration: _buildInfoBoxDecoration(),
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: const Color(0xFFA57C50),
            child: const Icon(Icons.person, color: Colors.white),
          ),
          const SizedBox(width: 16.0),
          const Text(
            '캐릭터 이름',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  // 토큰 정보 위젯
  Widget _buildTokenInfo() {
    return Container(
      decoration: _buildInfoBoxDecoration(),
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage('assets/images/icon/leaf_token.png'),
          ),
          const SizedBox(width: 16.0),
          const Text(
            '10,000',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  // 공통 박스 데코레이션
  BoxDecoration _buildInfoBoxDecoration() {
    return BoxDecoration(
      color: const Color(0xFFDCC6A0),
      borderRadius: BorderRadius.circular(25.0),
      border: Border.all(
        color: const Color(0xFFA57C50),
        width: 2,
      ),
    );
  }
}
