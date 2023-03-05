import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime firstDay = DateTime.now();

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
            _DDay(
              // 5. 하트 눌렀을 때 실행할 함수 전달하기
              onHeartPressed: onHeartPressed,
              firstDay: firstDay,
            ),
            _CoupleImage(),
          ],
        ),
      ),
    );
  }

  void onHeartPressed() {

    // 2. 쿠퍼티노 다이얼로그 실행
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            color: Colors.white,
            height: 300,
            // 4. 날짜 선택하는 다아얼로그
            child: CupertinoDatePicker(
              // 5. 시간 제회하고 날짜만 선택하기
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (DateTime date) {
                // 1. 상태 변경 시 setState() 함수 실행
                setState(() {
                  // 2. firstDay 변수에서 하루 빼기
                  firstDay = date;
                  // firstDay = firstDay.subtract(Duration(days: 1));
                });
                print('클릭');

              },
            ),
          ),
        );
      },
      barrierDismissible: true,
    );
  }
}

class _DDay extends StatelessWidget {
  // 1. 하트 눌렀을 때 실행할 함수
  final GestureTapCallback onHeartPressed;

  // 사기귀 시작한 날
  final DateTime firstDay;

  _DDay({
    // 2. 상위에서 함수 입력 받기
    required this.onHeartPressed,
    required this.firstDay,
  });

  @override
  Widget build(BuildContext context) {
    // 1. 테마 불러오기
    final textTheme = Theme.of(context).textTheme;
    final now = DateTime.now();

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
        // '2021.11.23',
        '${firstDay.year}.${firstDay.month}.${firstDay.day}',
        style: textTheme.bodyText2,
      ),
      const SizedBox(height: 16.0),
      IconButton(
        // 하트 아이콘 버튼
        iconSize: 60.0,
        onPressed: onHeartPressed,
        icon: Icon(
          Icons.favorite,
          color: Colors.red,
        ),
      ),
      const SizedBox(height: 16.0),
      Text(
        // 만난 후 DDay
        // 'D+365',
        'D+${DateTime(now.year, now.month, now.day).difference(firstDay).inDays + 1}',
        style: textTheme.headline2,
      )
    ]);
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
          height: MediaQuery.of(context).size.height / 2,
        ),
      ),
    );
  }
}

