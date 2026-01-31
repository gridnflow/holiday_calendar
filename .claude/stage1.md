**"진행순서"**
1. 데이터 모델 + API 연결
2. Riverpod 상태 관리 설계
3. UI + AsyncValue + Loader 구현
4. 광고/수익 구조 통합 고려
5. 핵심 기능 구현 (공휴일 필터, Bridge Day, Multi-Year)
6. 테스트 + 다국어 + 확장 가능성 확인

각각의 stage를 넘어가기 전에 더블체크 해야해

---

# 📁 프로젝트 아키텍처

## 폴더 구조 (Clean Architecture)

```
lib/
├── main.dart                      # 앱 진입점
├── app.dart                       # MaterialApp 설정
│
├── core/                          # 공통 유틸리티
│   ├── constants/
│   │   ├── api_constants.dart     # API 엔드포인트
│   │   └── app_constants.dart     # 앱 상수
│   ├── error/
│   │   ├── exceptions.dart        # 커스텀 예외
│   │   └── failures.dart          # Failure 클래스
│   ├── theme/
│   │   └── app_theme.dart         # 테마 설정
│   └── utils/
│       └── date_utils.dart        # 날짜 유틸
│
├── data/                          # 데이터 레이어
│   ├── datasources/
│   │   └── holiday_remote_datasource.dart
│   ├── models/
│   │   ├── holiday_model.dart
│   │   └── federal_state_model.dart
│   └── repositories/
│       └── holiday_repository_impl.dart
│
├── domain/                        # 도메인 레이어
│   ├── entities/
│   │   ├── holiday.dart
│   │   └── federal_state.dart
│   ├── repositories/
│   │   └── holiday_repository.dart
│   └── usecases/
│       ├── get_holidays.dart
│       └── get_federal_states.dart
│
├── presentation/                  # 프레젠테이션 레이어
│   ├── providers/
│   │   ├── holiday_provider.dart
│   │   ├── state_provider.dart
│   │   └── year_provider.dart
│   ├── screens/
│   │   ├── home_screen.dart
│   │   └── settings_screen.dart
│   └── widgets/
│       ├── calendar/
│       │   ├── holiday_calendar.dart
│       │   └── holiday_marker.dart
│       ├── common/
│       │   ├── loading_shimmer.dart
│       │   └── error_widget.dart
│       └── state_selector.dart
│
└── l10n/                          # 다국어
    ├── app_de.arb
    └── app_en.arb
```

## 의존성 흐름

```
┌─────────────────────────────────────────────────────────────┐
│                     Presentation Layer                       │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────────────┐  │
│  │   Screens   │──│   Widgets   │──│  Riverpod Providers │  │
│  └─────────────┘  └─────────────┘  └──────────┬──────────┘  │
└───────────────────────────────────────────────┼─────────────┘
                                                │
                                                ▼
┌─────────────────────────────────────────────────────────────┐
│                       Domain Layer                           │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────────────┐  │
│  │  Entities   │  │  Use Cases  │──│ Repository Interface│  │
│  └─────────────┘  └─────────────┘  └──────────┬──────────┘  │
└───────────────────────────────────────────────┼─────────────┘
                                                │
                                                ▼
┌─────────────────────────────────────────────────────────────┐
│                        Data Layer                            │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────────────┐  │
│  │   Models    │──│ Repository  │──│    DataSources      │  │
│  └─────────────┘  │    Impl     │  │  (Remote API)       │  │
│                   └─────────────┘  └─────────────────────┘  │
└─────────────────────────────────────────────────────────────┘
```

## 필수 패키지

```yaml
dependencies:
  # State Management
  flutter_riverpod: ^2.5.1
  riverpod_annotation: ^2.3.5

  # Networking
  dio: ^5.4.3+1

  # Calendar UI
  table_calendar: ^3.1.2

  # Localization
  intl: ^0.19.0

  # Functional Programming
  dartz: ^0.10.1

  # Code Generation
  freezed_annotation: ^2.4.1
  json_annotation: ^4.9.0

dev_dependencies:
  build_runner: ^2.4.9
  freezed: ^2.5.2
  json_serializable: ^6.8.0
  riverpod_generator: ^2.4.0
```

## API 엔드포인트

**Nager.Date Public Holiday API**
- Base URL: `https://date.nager.at/api/v3`
- 공휴일 조회: `GET /PublicHolidays/{year}/{countryCode}`
- 예: `/PublicHolidays/2025/DE`

응답 예시:
```json
{
  "date": "2025-01-01",
  "localName": "Neujahr",
  "name": "New Year's Day",
  "countryCode": "DE",
  "fixed": true,
  "global": true,
  "counties": null,
  "types": ["Public"]
}
```

## 연방주 코드 매핑

| 코드 | 연방주 (DE) | 영어 |
|------|-------------|------|
| DE-BW | Baden-Württemberg | Baden-Württemberg |
| DE-BY | Bayern | Bavaria |
| DE-BE | Berlin | Berlin |
| DE-BB | Brandenburg | Brandenburg |
| DE-HB | Bremen | Bremen |
| DE-HH | Hamburg | Hamburg |
| DE-HE | Hessen | Hesse |
| DE-MV | Mecklenburg-Vorpommern | Mecklenburg-W. Pomerania |
| DE-NI | Niedersachsen | Lower Saxony |
| DE-NW | Nordrhein-Westfalen | North Rhine-Westphalia |
| DE-RP | Rheinland-Pfalz | Rhineland-Palatinate |
| DE-SL | Saarland | Saarland |
| DE-SN | Sachsen | Saxony |
| DE-ST | Sachsen-Anhalt | Saxony-Anhalt |
| DE-SH | Schleswig-Holstein | Schleswig-Holstein |
| DE-TH | Thüringen | Thuringia |

---

1️⃣ API 연결 준비 및 데이터 모델링
목표: 앱이 바로 API에서 데이터를 가져오도록 준비
Claude에게 시킬 일:
Public Holiday API 스펙 분석 → 필요한 파라미터, 반환 JSON 구조 정의
Holiday 모델 클래스 정의 (year, date, name, Bundesland 등)
JSON → Dart 객체 파싱 로직 작성
Riverpod AsyncNotifier를 사용해서 API 호출 → 상태 업데이트 → UI 반응 흐름 설계
Tip: 로컬 JSON은 나중에 참조용으로 남겨둘 수 있음

2️⃣ Riverpod State Management 설계
목표: UI와 데이터 연결 구조를 안정화
StateNotifier / AsyncNotifier 설계
선택된 Bundesland
선택된 연도
API에서 가져온 Holiday List
에러/로딩 상태 처리
Shimmer loader or spinner UI 연동
향후 캐시/Repository를 추가할 수 있도록 확장 포인트 표시

3️⃣ 기본 UI 구조 설계
목표: API 데이터를 실제 화면에 표시
메인 캘린더 화면
table_calendar 위젯 설정
AsyncValue 구독하여 날짜 강조 / 로딩 상태 처리
Bundesland 선택 UI
연도 선택 UI
최소한의 광고 슬롯(배너 자리) 배치
Safe-Zone으로 레이아웃 확보

4️⃣ 광고/수익 구조 설계
목표: UI에 광고 넣을 자리 확보, 수익성 고려
Banner / Native Ad 위치 시뮬레이션
Premium 구독 시 광고 제거 구조 설계
광고용 컴포넌트 재사용 가능하도록 설계

5️⃣ 기능별 로직 구현
목표: 핵심 기능 단계적 구현
Regional Accuracy → Bundesland별 공휴일 필터링
Bridge Day 계산 로직
단순 MVP → 나중에 Push Notification 연동 가능
Multi-Year 지원
Offline 접근 기능 (선택적, 캐시 구현 시)

6️⃣ 확장 및 테스트 계획
목표: 코드 안정성과 확장성 확보
Unit Test / Widget Test 작성
API 호출 성공/실패
AsyncNotifier 상태 변화
Bridge Day 계산 로직
다국어 처리 (intl)
향후 다른 국가, API 교체, 외부 캘린더 연동 확장 고려