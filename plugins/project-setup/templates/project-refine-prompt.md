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
@project-plan.md 를 읽고, 다음 두 단계를 순서대로 진행해줘.

## 1단계: 인터뷰

AskUserQuestionTool을 사용해서 구현 방식, UI/UX, 우려 사항, 트레이드오프 등 모든 것에 대해 상세하게 인터뷰해줘. 단, 뻔한 질문은 하지 마.
충분히 깊이 있게, 완료될 때까지 계속 인터뷰한다.

## 2단계: 스킬 & MCP 검색

인터뷰가 끝나면, `.claude/skills/skill-discovery/SKILL.md`의 검색 절차를 실행해서
계획서 섹션 3 "툴 & 워크플로우 설계"의 검색 키워드 테이블을 실제 검색 결과로 채워줘.

구체적으로:
1. vive-md 리포를 클론 (`git clone --depth 1 https://github.com/johunsang/vive-md.git /tmp/vive-md`)
2. 계획서의 검색 키워드로 스킬 카탈로그 + MCP 카탈로그 검색
3. 검색 결과 테이블을 사용자에게 보여주고 확인받기
4. 확인된 결과를 계획서 섹션 3에 반영

검색 소스·절차·규칙은 모두 skill-discovery SKILL.md에 정의되어 있으니 그대로 따른다.

## 최종

두 단계가 완료되면 최종 스펙을 project-plan.md에 저장해줘.
```

## 출처

- Original idea & workflow credit: **@trq212 (Thariq)**
- Source: Claude Code spec-based development workflow
