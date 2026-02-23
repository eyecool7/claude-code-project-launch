#!/bin/bash
# PreToolUse hook — commit 전 빌드 검증
# 실패 시 커밋 차단. Claude가 에러 수정 후 재시도.

PASS_FILE="/tmp/.pre-commit-pass-$$"

# typecheck + lint + test 실행
if {{TYPECHECK_CMD}} && {{LINT_CMD}} && {{TEST_CMD}}; then
  touch "$PASS_FILE"
  echo "✅ 검증 통과. 커밋 진행."
  exit 0
else
  rm -f "$PASS_FILE"
  echo "❌ 검증 실패. 에러를 수정하고 다시 커밋하세요."
  exit 1
fi
