# 프로젝트 계획서 – Plan Mode 프롬프트

## 프롬프트

```
@project-plan.md 를 읽고, AskUserQuestionTool을 사용해서 구현 방식, UI/UX, 우려 사항, 트레이드오프 등 모든 것에 대해 상세하게 인터뷰해줘. 단, 뻔한 질문은 하지 마.

충분히 깊이 있게, 완료될 때까지 계속 인터뷰한 다음, 최종 스펙을 project-plan.md에 작성해줘.
```

## 사용법

- 이 프롬프트는 **spec-first / plan mode** 작업 흐름을 위한 것입니다.
- Claude Code (Plan mode)는 먼저 `project-plan.md`를 읽고, 구현·설계·UX·리스크·트레이드오프 전반에 대해 **비자명한 질문**을 지속적으로 던집니다.
- 충분한 인터뷰가 완료되면, 그 결과를 반영해 **완성된 스펙을 동일한 파일에 작성**합니다.
- 실행(session)과 설계(interview) 단계를 분리하는 것이 핵심입니다.

## 출처

- Original idea & workflow credit: **@trq212 (Thariq)**
- Source: Claude Code spec-based development workflow
