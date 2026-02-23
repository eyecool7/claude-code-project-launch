# {{PROJECT_NAME}}

{{ONE_LINE_SUMMARY}}
코드 영어, 대화/설명 {{RESPONSE_LANGUAGE}}. 커밋 Conventional Commits.

## 스택

{{STACK_DETAIL}}

## 핵심 규칙

- IMPORTANT: 계획 먼저, 코드 나중. 복잡한 작업은 Plan Mode.
- IMPORTANT: 빌드/테스트 실패 시 즉시 중단. 새 기능 추가 전에 반드시 원인 해결.
- IMPORTANT: 새 기능 시작 시 project-plan.md(성공 기준 + 구현 순서)를 먼저 읽을 것.
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

## 교훈

실수/해결책은 `.claude/lessons.md`에 기록. 세션마다 자동 로드됨.

## 병렬 작업

기능 병렬 개발 시 `claude -w feature-name` (worktree)으로 독립 브랜치 생성.
