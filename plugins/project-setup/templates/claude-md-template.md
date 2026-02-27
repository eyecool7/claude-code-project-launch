# {{PROJECT_NAME}}

{{ONE_LINE_SUMMARY}}
코드 영어, 대화/설명 {{RESPONSE_LANGUAGE}}. 커밋 Conventional Commits.

## 스택

{{STACK_DETAIL}}

## 핵심 규칙

- IMPORTANT: 계획 먼저, 코드 나중. 복잡한 작업은 Plan Mode.
- IMPORTANT: 빌드/테스트 실패 시 즉시 중단. 새 기능 추가 전에 반드시 원인 해결.
- IMPORTANT: 새 기능 시작 시 project-plan.md(성공 기준 + 구현 순서)를 먼저 읽을 것.
- IMPORTANT: 기술 결정 발생 시(라이브러리 교체, 설정 변경, 계획 변경) → `.claude/decisions.md`에 즉시 기록 후 다음 작업 진행. "나중에 정리"는 실패한다.
- IMPORTANT: 빌드/테스트 실패 해결 후 → `.claude/lessons.md`에 즉시 기록. 같은 실수 반복 방지.
{{PHILOSOPHY_RULES}}
- 하나의 PR = 하나의 기능. 리팩토링과 기능 추가 동시 금지.
{{#IF_CONFLICTS}}
- ⚠️ {{CONFLICT_WARNING}}
{{/IF_CONFLICTS}}

## 검증 (코드 변경 후 반드시 실행)

```bash
{{TYPECHECK_CMD}} && {{LINT_CMD}} && {{TEST_CMD}}
```
실패 → 에러 읽기 → 수정 → 재실행. 통과할 때까지 반복.

## 핵심 경로

```
{{KEY_PATHS}}
```

## 주요 플로우

| 플로우 | 경로 | 설명 |
|--------|------|------|
{{CORE_FLOWS_TABLE}}

## 개발 명령어

```bash
{{DEV_COMMANDS}}
```

## 권한

허용: {{ALLOW_LIST}}
확인 필요: {{ASK_LIST}}
금지: rm -rf, .env 수정{{DENY_EXTRAS}}

## 세션 간 연속성

- decisions.md: 기록 트리거 → 기능 추가·삭제, API 확정, 스택 변경, 설계 변경, package.json 의존성 변경
- lessons.md: 기록 트리거 → 빌드 실패 해결, 디버깅 삽질 후 원인 발견, 예상과 다른 동작 확인
- 세션 종료 전 "계획서 대비 달라진 점" 자체 점검 → 미기록 결정 소급 기록

## 병렬 작업

기능 병렬 개발 시 `claude -w feature-name` (worktree)으로 독립 브랜치 생성.
