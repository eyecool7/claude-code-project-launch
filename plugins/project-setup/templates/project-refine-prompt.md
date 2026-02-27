# 프로젝트 계획서 고도화 방법
이 문서는 사용자가 Claude Code Plan Mode에서 바로 사용 가능한 '프로젝트 계획서 고도화 프롬프트'를 제공하고 사용 방법을 설명한다.

## 사용 방법
1. project-refine-prompt.md를 열어서 프롬프트 내용을 claude code 채팅창에 붙여넣습니다.
2. claude code와 대화하며 project-plan.md 계획서를 고도화하세요.
3. 수정된 계획서를 project-plan.md로 저장합니다.
4. /project-setup:setup 스킬을 실행하여 다음 단계로 넘어갑니다.

## 전제 조건
- 계획서 작성이 완료되어 `project-plan.md`가 루트에 있어야 한다.

---

# 프로젝트 계획서 고도화 프롬프트 (아래 전체를 Claude Code에 전달)

```
@project-plan.md 를 읽고, AskUserQuestionTool을 사용해서 구현 방식, UI/UX, 우려 사항, 트레이드오프 등 모든 것에 대해 상세하게 인터뷰해줘. 단, 뻔한 질문은 하지 마.

충분히 깊이 있게, 완료될 때까지 계속 인터뷰한 다음, 최종 스펙을 project-plan.md에 작성해줘.
```

## 출처

- Original idea & workflow credit: **@trq212 (Thariq)**
- Source: Claude Code spec-based development workflow
