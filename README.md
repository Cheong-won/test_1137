# fittrix

The Fittix Test Project

## Getting Started

과제의 개요
-main 화면은 동영상이 재생이 되고
-bottom menu는 3개의 메뉴가 있습니다. (운동 기록하기, 운동 기록 보기 , 로그인)
-운동 기록하기, 운동기록 보기는 하위 메뉴가 있습니다.(아코디언 형식으로 표시 되어야합니다.)


문제 해결을 위한 아이디어 요약
- mvvm 패턴을 사용하였고 dev, prod 환경으로 분리하여 운영하기 위하여 실행 파일을 분리 하였고
- 개발 시간을 줄이기 위해서 retrofit, get_it, getX를 하였고 모듈화 하였습니다.
- 중복 코드를 줄이기 위해서 common ui 구성
- 자주 사용하는 코드는 wrraping 하여 사용하였습니다.
- 다국어 처리

프로세스 항목
- 개발 환경 구성
- 프로젝트 빌드 & 테스트 & 실행 방법
- 미해결 이슈 정리

작업 리스트 항목
- network 모듈 사용
- 메인 화면 구성
- bottom menu(navigation bar) 구성
- common ui 구성
- mock api 구성
- mvvm 패턴 적용(controller getX 사용, 나머지 get_it 사용)
- 

Flutter 사전 과제 #1 5

API 설계
- 로그인 (storage 처리하)
- 운동 기록하기 (저장은 하지 않으며 기록 중, 저장 완료처리만된)
- 운동 기록 보기 (mock api 호출)

개발 환경
FE - Flutter
BE - Mock API사용

환경 구성
프로젝트 빌드 & 테스트 & 실행 방법

미해결 이슈 정리
- DB 활용 방안 ()
- UI 테스트 코드 작성
- Login 시 토큰 관리 추가 필요
- 테스트 코드 보강 (unit test, widget test)
- firebase 사용하여 push 알림 추가
- 앱 업데이트 처리
- android keystore 처리
- permission 처리(ios, android)
- CI/CD 구성
- 운동 기록 보기시 하위 메뉴 클릭시 해당 운동에 대한 기록만 볼수 있게 rest api 필터 추가 필더
- 이미지 webp 확장자 일원화
- 운동 기록 하기, 운동기록 보기 (실제 API 구현 필요)
- iOS 기본 테스트 필요.
- 사용자 정보 Preference 관리 필요