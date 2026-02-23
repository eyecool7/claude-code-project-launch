---
name: design-rules
description: UI 컴포넌트 생성, 스타일링, 색상/폰트/레이아웃 결정, 반응형 구현, 다크모드, 접근성 작업 시 사용. 프론트엔드 프로젝트 전용.
user-invocable: false
---

# 디자인 규칙

> ⚠️ 조건부: 프론트엔드 포함 프로젝트에서만 생성

## 디자인 시스템

### 60-30-10 Rule
- 60% 배경: 화이트/뉴트럴
- 30% 서브: 프라이머리 계열
- 10% 포인트: 액센트 (CTA, 강조)

### 색상 제한
- 원색(순수 빨강/파랑/초록) 직접 사용 금지 → 톤 조절된 팔레트 사용

### AI 디자인 키워드 사전

> AI에게 "예쁘게 해줘"는 매번 다른 결과. 키워드를 정의하면 일관성 유지.

색상 전략 (setup 시 1개 선택):
- Monochromatic → 한 색의 명도/채도 변형만
- Neutral + Accent → 무채색 배경 + 포인트 컬러 1개
- Duotone → 2컬러 조합

아이콘 스타일 (setup 시 1개 선택):
- Monoline / Outlined / Filled / Duotone / Isometric

그라데이션 키워드:
- GrainyGradient → 노이즈 텍스처 (종이 느낌)
- AuroraBackground → 블러 처리된 컬러 볼륨
- MeshGradient → 유기적 다중 색상 흐름

### 다크모드
<!-- TODO: setup 시 결정: CSS 변수 / Tailwind dark: / 미지원 -->

---

## 테마 토큰

### 색상 토큰
<!-- TODO: tailwind.config.ts / CSS 변수 / theme.ts에서 자동 추출 -->
```
colors: {
  primary: { /* TODO */ },
  secondary: { /* TODO */ },
  accent: { /* TODO */ },
}
```

### 폰트 사이즈 스케일
<!-- TODO: 프레임워크 기본 또는 커스텀 -->
- xs (12px) — 메타 정보
- sm (14px) — 보조 텍스트
- base (16px) — 본문
- lg (18px) — 카드 제목
- xl (20px) — 섹션 제목
- 2xl~ — 히어로/강조

### 브레이크포인트
```
sm: 640px    — 모바일
md: 768px    — 태블릿
lg: 1024px   — 데스크탑
xl: 1280px   — 와이드
```

### 그림자/라운딩
- 카드: rounded-lg shadow-sm hover:shadow-md
- 모달: rounded-lg shadow-xl
- 배지: rounded-full
- 버튼: rounded-md

### 스페이싱
- 아이템 간 간격: 최소 16px
- 섹션 간 간격: 최소 32px
- 카드/아이템 그리드: 반응형 (1/2/3열)

---

## 컴포넌트 구조

### 파일 구조
```
components/
├── ui/                 # 재사용 기본 (Button, Badge, Card, Modal)
├── {{DOMAIN_A}}/       # 도메인별 그룹
├── {{DOMAIN_B}}/       # 도메인별 그룹
└── shared/             # 공통 (Header, Sidebar, Loading, ErrorBoundary)
```
<!-- TODO: setup이 프로젝트 구조 분석 후 도메인 폴더 채움 -->

### Props 네이밍
- 이벤트 핸들러: `onAction` (onClick, onSubmit, onChange)
- 불리언: `is/has` 접두사 (isActive, hasError)
- 데이터: 명사 (user, items, config)

### 상태 관리
- 서버 상태: React Query / SWR / 프레임워크 기본
- 클라이언트 상태: useState / useReducer
- 전역 상태: 필요 시에만 (Zustand / Jotai 등)
- URL 상태: 필터/정렬/페이지네이션 → searchParams

### 접근성 필수
- 모든 인터랙티브 요소에 `aria-label`
- 키보드 네비게이션 지원
- 토글 → `aria-pressed`
- 색상만으로 상태 구분 금지 (아이콘 병행)

### 컴포넌트 3상태
- loading → 빈 상태 → 에러 상태 항상 처리
