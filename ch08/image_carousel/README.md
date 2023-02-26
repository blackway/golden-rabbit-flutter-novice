# image_carousel

## 완성 스크린샷

![image](./asset/final/final_screenshot.png)




Chapter-08
전자액자
	위젯 생명주기, PageView, Timer, SystemChrome, StatefulWidget

	-학습 목표
	    이미지 5개를 롤링해보여주는 액자 앱을 만듭니다. 좌우 스와이프해 이미지를 변경할 수 있습니다.
	    7장에서 콜백 함수를 이용해서 특정 이벤트가 일어났을 때 함수를 실행했습니다. 이번에는 특정 주기마다 반복적으로 
	    함수를 싱행하는 방법을 알아 보겠습니다.
	    

	    8.1 사전 지석
	    8.1.1 위젯 생명주기

	    StatelessWidget
	    	상태 없는 위젯
	    	StatelessWidget 생성자() -> build() 
	    	한번 생성하고 나면 속성을 변경할 수 없다.

	    StatefulWidget
	    	상태 있는 위젯
	    	StatefulWidget 생성자() -> createState() 
	    	한번 생성하고 나서 속성을 변경할 수 있다.	    	

	    8.1.2 Timer

	    	Timer는 특정 시간이 지난 후에 일회성 또는 지속적으로 함수를 실행합니다. 
	    	Timer.periodic(
	    		Duration(seconds: 3),  //1.주기
	    		(Timer timer) {},      //2.콜백 함수
	    	);

	    8.2 사전 준비
	    	이번 프로젝트에서 사용할 파일들을 내려받고 프로젝트에 등록하는 과정을 알아보겠습니다.

	    8.2.1 이미지 추가하기
	    	에셋은 프로젝트에서 사용되는 파일들을 의미합니다. 동영상, 이미지, 음악 파일 등 입니다.
	    	프로제트에 asset 디렉토리에 img 폴더를 생성하고 테스트 이미지를 넣습니다.

	    8.2.2 pubspec.yaml 설정하기
	    	assets:
	    	    - asset/img/

		8.2.3 프로젝트 초기화하기
		