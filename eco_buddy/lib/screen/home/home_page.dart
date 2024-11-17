import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // 배경, 바닥, 캐릭터 이미지 경로 변수
  String backgroundImage = 'assets/images/background/background_1.png';
  String floorImage = 'assets/images/floor/floor_1.png';
  String characterImage = 'assets/images/character/character_1.png';

  Offset characterPosition = const Offset(100, 300); // 캐릭터 초기 위치

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[50], // 배경 색상
      body: Stack(
        children: [
          // 배경 이미지
          Positioned.fill(
            child: Image.asset(
              backgroundImage, // 동적으로 설정된 배경 이미지
              fit: BoxFit.cover,
            ),
          ),
          // 바닥 이미지
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              floorImage, // 동적으로 설정된 바닥 이미지
              fit: BoxFit.cover,
              height: 100,
            ),
          ),
          // 상단 사용자 정보
          Positioned(
            top: 20,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // 사용자 아이콘
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 5,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Image.asset(
                    'assets/images/icon/user_icon.png', // 사용자 아이콘 이미지
                    width: 40,
                    height: 40,
                  ),
                ),
                // 사용자 레벨 및 게이지
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: [
                        Text(
                          '레벨 10',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: LinearProgressIndicator(
                            value: 0.7, // 경험치 게이지
                            backgroundColor: Colors.grey[200],
                            valueColor: const AlwaysStoppedAnimation(Colors.green),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // 토큰 수 표시
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 5,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: const [
                      Icon(Icons.monetization_on, color: Colors.yellow, size: 20),
                      SizedBox(width: 4),
                      Text(
                        '120',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // 드래그 가능한 캐릭터
          Positioned(
            left: characterPosition.dx,
            top: characterPosition.dy,
            child: GestureDetector(
              onPanUpdate: (details) {
                setState(() {
                  characterPosition += details.delta; // 캐릭터 위치 업데이트
                });
              },
              child: Image.asset(
                characterImage, // 동적으로 설정된 캐릭터 이미지
                width: 100,
                height: 100,
              ),
            ),
          ),
        ],
      ),
      // 하단 버튼 추가
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    // 배경 이미지 변경
                    backgroundImage = 'assets/images/background/background_1.png';
                  });
                },
                child: const Text('배경 변경'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    // 바닥 이미지 변경
                    floorImage = 'assets/images/floor/floor_1.png';
                  });
                },
                child: const Text('바닥 변경'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    // 캐릭터 이미지 변경
                    characterImage = 'assets/images/character/character_1.png';
                  });
                },
                child: const Text('캐릭터 변경'),
              ),
            ],
          ),
          BottomNavigationBar(
            currentIndex: 1, // 기본 선택된 탭 (홈)
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.bar_chart),
                label: '탄소 발자국',
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
            onTap: (index) {
              // 탭 이동 로직 추가
              print('탭 $index 선택됨');
            },
          ),
        ],
      ),
    );
  }
}
