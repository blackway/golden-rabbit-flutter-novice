// import 'package:image_carousel/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    ),
  );
}


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

// ❷ State 정의
class _HomeScreenState extends State<HomeScreen> {
  final PageController pageController = PageController();

  @override
  void initState() {
    super.initState(); // ➌ 부모 initState() 실행
    print('실행! initState() 함수');

    Timer.periodic(
      // ➍ Timer.periodic() 등록
      Duration(seconds: 3),
          (timer) {
        print('실행! Timer.periodic');
        // int? nextPage = pageController.page?.toInt();
        int? nextPage = pageController.page?.toInt();

        print('실행2! nextPage : $nextPage');


        // ➋
        if (nextPage == null) {
          return;
        }
        // ➌
        if (nextPage == 4) {
          nextPage = 0;
        } else {
          nextPage++;
        }
        print('실행3! nextPage : $nextPage');

        pageController.animateToPage(
          // ➍ 페이지 변경
          nextPage,
          // duration: Duration(milliseconds: 10),
          duration: Duration(milliseconds: 500),
          curve: Curves.ease,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    print('실행 build() 함수!!');

    return Scaffold(
      body: PageView(
        controller: pageController,
        // ➊ PageView 추가
        children: [1, 2, 3, 4, 5] // ➋ 샘플 리스트 생성
            .map(
          // ➌ 위젯으로 매핑
              (number) => Image.asset(
            'asset/img/image_$number.jpeg',
            fit: BoxFit.cover,
          ),
        )
            .toList(),
        onPageChanged: _onPageViewChange,
      ),
      onDrawerChanged: _onDrawerChanged(true),
    );
  }
}

/// PageView 변경시 실행.
_onPageViewChange(int page) {
  print("PageView _onPageViewChange Current Page : " + page.toString());
  // int previousPage = page;
  // if(page != 0) previousPage--;
  // else previousPage = 2;
  // print("Previous page: $previousPage");
}

/// Scaffold 함수 호출시 실행.
_onDrawerChanged(bool flag) {
  print("Scaffold _onDrawerChanged : ");
}