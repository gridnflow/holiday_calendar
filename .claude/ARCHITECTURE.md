
---

### 📁 수정된 프로젝트 아키텍처 (Drift & OpenHolidays API 통합)

```text
lib/
├── core/
│   ├── database/                  
│   │   └── app_database.dart      # [추가] Drift DB 정의 및 테이블 스키마
│   ├── network/                   
│   │   └── dio_client.dart        # Dio 설정 (Interceptor 포함)
│   └── utils/
│       └── bridge_day_helper.dart # [추가] 브릿지 데이 계산 로직 유틸
│
├── data/
│   ├── datasources/
│   │   ├── holiday_remote_datasource.dart # OpenHolidays API 호출
│   │   └── holiday_local_datasource.dart  # [추가] Drift DB를 통한 로컬 캐싱
│   ├── models/
│   │   ├── holiday_model.dart             # API 응답 DTO
│   │   └── holiday_mapper.dart            # [추가] Model <-> Entity <-> DB 변환
│   └── repositories/
│       └── holiday_repository_impl.dart   # Remote + Local 전략 (Single Source of Truth)
│
├── domain/
│   ├── entities/
│   │   ├── holiday.dart                   # 순수 비즈니스 객체
│   │   └── bridge_day.dart                # [추가] 계산된 브릿지 데이 정보
│   └── usecases/
│       ├── get_holidays_usecase.dart
│       └── calculate_bridge_days_usecase.dart # [추가] 브릿지 데이 최적화 로직
│
├── presentation/
│   ├── providers/                         # Riverpod (Generator 사용 권장)
│   │   ├── holiday_provider.dart          # AsyncNotifier 기반
│   │   ├── settings_provider.dart         # Bundesland, Year 상태 관리
│   │   └── ad_provider.dart               # [추가] 광고 로드 및 프리미엄 상태
│   └── screens/
│       ├── home/
│       │   ├── widgets/                   # 화면별 작은 위젯 분리
│       │   └── home_screen.dart
│       └── premium/                       # 수익화 관련 화면

```

---

### ⚙️ 수정된 필수 패키지 (`pubspec.yaml`)

Drift와 리버팟 코드 생성을 위해 최신 버전을 반영합니다.

```yaml
dependencies:
  flutter_riverpod: ^2.5.1
  riverpod_annotation: ^2.3.5
  dio: ^5.4.3+1
  
  # Database (Drift)
  drift: ^2.16.0
  sqlite3_flutter_libs: ^0.5.20
  path_provider: ^2.1.2
  path: ^1.9.0

  # UI & Utils
  table_calendar: ^3.1.2
  freezed_annotation: ^2.4.1
  json_annotation: ^4.9.0
  intl: ^0.19.0

dev_dependencies:
  build_runner: ^2.4.9
  riverpod_generator: ^2.4.0
  drift_dev: ^2.16.0  # Drift 코드 생성기
  freezed: ^2.5.2
  json_serializable: ^6.8.0

```

---

### 🚀 수정된 진행 순서 (Double-Check 포인트 포함)

#### **Stage 1: 데이터 모델 + API & DB 스키마 설계**

* **할 일:**
* OpenHolidays API 스펙에 맞춰 `HolidayModel` 정의.
* Drift를 사용하여 `Holidays` 테이블 정의 (id, date, name, stateCode 등).
* `DataSources`에서 API 결과를 DB에 저장하는 로직 구현.


* **✅ Double-Check:** API가 끊겼을 때 DB에서 데이터를 가져오는가? (오프라인 우선 전략 확인)

#### **Stage 2: Riverpod 상태 관리 (AsyncNotifier)**

* **할 일:**
* `HolidayProvider`: `FutureProvider`가 아닌 `AsyncNotifier`를 사용해 연도/주 변경 시 상태 재계시.
* `SettingsProvider`: 사용자가 선택한 `Bundesland`를 로컬에 저장(SharedPreferences)하고 전역 관리.


* **✅ Double-Check:** 주(State)를 변경했을 때 즉시 API/DB 호출이 트리거되는가?

#### **Stage 3: UI + AsyncValue 로더**

* **할 일:**
* `AsyncValue.when`을 사용하여 `data`, `loading`, `error` 케이스 처리.
* 독일 감성에 맞는 깔끔한 **Shimmer Effect** 적용.


* **✅ Double-Check:** 로딩 중 화면 깜빡임이 없는가? (Skeleton UI 적용 확인)

#### **Stage 4: 광고/수익 구조 통합**

* **할 일:**
* `AdProvider`를 통해 광고 로드 로직 분리.
* `CustomScrollView`를 사용하여 리스트 중간에 **Native Ads** 자연스럽게 삽입.
* 수익을 위한 **"Bridge Day 상세 분석"** 기능 유료화 레이아웃 준비.


* **✅ Double-Check:** 광고가 콘텐츠를 가리지 않는가? (Safe Area 확인)

#### **Stage 5: 핵심 로직 (Bridge Day Optimizer)**

* **할 일:**
* `calculateBridgeDaysUsecase` 구현: 공휴일 앞뒤 날짜를 계산하여 "최소 연차 조합" 산출.
* 결과값을 캘린더에 다른 색상의 마커로 표시.


* **✅ Double-Check:** 주말(토, 일)과 겹치는 공휴일은 브릿지 데이 계산에서 제외되는가?

#### **Stage 6: 테스트 및 다국어**

* **할 일:**
* 독일어(`de`)와 영어(`en`) `arb` 파일 작성.
* Drift DB 마이그레이션 테스트.


* **✅ Double-Check:** 시스템 언어 변경 시 캘린더 요일 표시가 즉시 바뀌는가?

---