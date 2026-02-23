# 프로젝트 셋업 프롬프트

## 프롬프트

```
@SKILL.md 를 읽고, @project-plan.md 를 기반으로 이 프로젝트를 세팅해줘.

SKILL.md에 정의된 워크플로우(Step 1→5)대로 진행해:

1. scripts/analyze-project.sh 실행 → 프로젝트 분석
2. references/claude-md-template.md 기반으로 CLAUDE.md 생성 (55줄 내외, 80줄 절대 초과 금지)
3. .claude/skills/ 템플릿의 TODO를 project-plan.md 기반으로 채움
4. .claude/hooks/, agents/, commands/의 {{변수}}를 실제 값으로 치환
5. scripts/validate-setup.sh 실행 → 검증

검증 통과 후:
- git init + 첫 커밋
- 세팅 전용 파일 삭제: SKILL.md, references/ 폴더, scripts/ 폴더, README.md
  (이 파일들은 세팅에만 쓰이는 스캐폴딩. 프로젝트에 남을 필요 없음.)

세팅 결과를 요약해줘:
- 생성된 CLAUDE.md 줄 수
- 채워진 skills 목록
- 치환된 변수 목록
- 검증 결과
```

## 사용법

- Claude Code에서 프로젝트 폴더를 열고 위 프롬프트를 입력한다.
- `project-plan.md`와 `SKILL.md`가 프로젝트 루트에 있어야 한다.
- 세팅 완료 후 SKILL.md, references/, scripts/, README.md는 자동 삭제된다.

## 전제 조건

- Step 1(계획서 작성) + Step 2(계획서 고도화)가 완료되어 `project-plan.md`가 루트에 있어야 한다.
- Step 3(스킬 설치)이 완료되어 `.claude/`, `references/`, `scripts/`가 루트에 있어야 한다.
