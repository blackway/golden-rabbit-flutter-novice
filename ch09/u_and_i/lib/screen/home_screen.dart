import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      body: SafeArea(
        // 1. 시스템 UI 피해서 UI 그리기
        top: true,
        bottom: false,
        child: Column(
          // 2. 위아래 끝에 위젯 배치
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // 반채축 최대 크기로 늘리기
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _DDay(),
            _CoupleImage(),
          ],
        ),
      ),
    );
  }
}

class _CoupleImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      // Expanded 추가로 해상도에 따른 오버플로어 해결
        child: Center(
          // 1. 이미지 중앙 정렬
          child: Image.asset(
            'asset/img/middle_image.png',
            // 2. 화면의 반만큼 높이 구현
            height: MediaQuery
                .of(context)
                .size
                .height / 2,
          ),
        ),
    );
  }
}

class _DDay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 1. 테마 불러오기
    final textTheme = Theme
        .of(context)
        .textTheme;

    return Column(children: [
      const SizedBox(height: 16.0),
      Text(
        // 최상단 U&I 글자
        'U&I',
        style: textTheme.headline1,
      ),
      const SizedBox(height: 16.0),
      Text(
        // 두번째 글자
        '우리 처음 만난 날',
        style: textTheme.bodyText1,
      ),
      Text(
        // 임시로 지정한 만난 날짜
        '2021.11.23',
        style: textTheme.bodyText2,
      ),
      const SizedBox(height: 16.0),
      IconButton(
        // 하트 아이콘 버튼
        iconSize: 60.0,
        onPressed: () {},
        icon: Icon(
          Icons.favorite,
          color: Colors.red,
        ),
      ),
      const SizedBox(height: 16.0),
      Text(
        // 만난 후 DDay
        'D+365',
        style: textTheme.headline2,
      )
    ]);
  }
}
