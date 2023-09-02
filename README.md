# Fittrix

The Fittrix Test Project

## Getting Started

### 과제의 개요
- Main 화면에서는 동영상이 재생됩니다.
- Bottom menu에는 3개의 메뉴가 있습니다: 운동 기록하기, 운동 기록 보기, 로그인.
- '운동 기록하기'와 '운동 기록 보기'에는 하위 메뉴가 있습니다 (아코디언 형식으로 표시).

### 문제 해결을 위한 아이디어 요약
- MVVM 패턴을 사용했습니다.
- Dev와 Prod 환경을 분리했습니다.
- Retrofit, get_it, getX를 사용하여 개발 시간을 단축했습니다.
- Common UI 구성과 코드 재사용을 위해 wrapping을 사용했습니다.
- 다국어 처리를 했습니다.

### 프로세스 항목
- 개발 환경 구성
- 프로젝트 빌드, 테스트, 실행 방법
- 미해결 이슈 정리

### 작업 리스트 항목
- Network 모듈 구성
- Drift DB 사용
- GetStorage (preference 구성)
- 메인 화면 구성
- Bottom menu(navigation bar) 구성
- Common UI 구성
- Mock API 구성
- MVVM 패턴 적용

### API 설계
- 로그인 (Storage 처리)
- 운동 기록하기 (저장은 하지 않고, 기록 중/저장 완료만 처리)
- 운동 기록 보기 (Mock API 호출)

## 개발 환경
- FE: Flutter
- BE: Mock API 사용

## 환경 구성
### 프로젝트 빌드
- Android Studio 사용 시, 개발과 운영 환경 설정 필요
#### 개발
- `main_dev.dart`, build flavor -> dev
#### 운영
- `main.dart`, build flavor -> prod
- 
### 빌드 및 실행 방법 (Debug, 터미널 이용)

```bash
flutter run --flavor dev -t lib/main_dev.dart --debug
```

### 테스트

```bash
flutter test test/record_repository_test.dart
```


## 미해결 이슈 정리

- **DB 활용 방안**: 아직 구체적인 DB 활용 방안이 마련되지 않았습니다.
- **UI 테스트 코드 작성**: UI 테스트 코드가 부족합니다.
- **Login 시 토큰 관리 필요**: 로그인 이후 토큰 관리가 구현되어야 합니다.
- **테스트 코드 보강**: Unit test와 Widget test 코드를 추가로 작성해야 합니다.
- **Firebase 사용하여 Push 알림 추가 필요**: Firebase를 사용한 푸시 알림 기능이 필요합니다.
- **앱 업데이트 처리**: 앱 업데이트 로직이 필요합니다.
- **Android keystore 처리**: Android keystore 관련 처리가 필요합니다.
- **Permission 처리 (iOS, Android)**: 권한 설정 처리가 필요합니다.
- **CI/CD 구성**: 지속적인 통합 및 배포 설정이 필요합니다.
- **운동 기록 보기시 하위 메뉴 필터링**: 하위 메뉴를 클릭했을 때 해당 운동에 대한 기록만 필터링 되어야 합니다.
- **이미지 확장자 일원화**: 모든 이미지 확장자를 WebP로 변경해야 합니다.
- **'운동 기록 하기'와 '운동 기록 보기' 실제 API 구현 필요**: 이 두 기능을 위한 실제 API 구현이 필요합니다.
- **iOS 기본 테스트 필요**: iOS에서의 기본 테스트가 필요합니다.
- **사용자 정보 Preference 관리 필요**: 사용자 정보를 로컬에서 안전하게 관리할 방법이 필요합니다.

