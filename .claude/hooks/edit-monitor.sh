#!/bin/bash
# PostToolUse hook — 수정 패턴 모니터링 (백그라운드)

EDIT_LOG=".claude/cache/edit-log.jsonl"
CURRENT_FILE="$1"
TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

# 기록
echo "{\"file\":\"$CURRENT_FILE\",\"time\":\"$TIMESTAMP\"}" >> "$EDIT_LOG"

# 10분 내 같은 파일 4회 이상 수정 → 재검토 제안
TEN_MIN_AGO=$(date -u -d '10 minutes ago' +"%Y-%m-%dT%H:%M:%SZ" 2>/dev/null || date -u -v-10M +"%Y-%m-%dT%H:%M:%SZ" 2>/dev/null)
if [ -n "$TEN_MIN_AGO" ]; then
  RECENT_COUNT=$(grep "$CURRENT_FILE" "$EDIT_LOG" | awk -F'"time":"' '{print $2}' | cut -d'"' -f1 | awk -v cutoff="$TEN_MIN_AGO" '$1 >= cutoff' | wc -l)
  if [ "$RECENT_COUNT" -ge 4 ]; then
    echo "💡 이 파일을 10분 내 ${RECENT_COUNT}회 수정했습니다. 접근 방식을 재검토해볼까요?"
  fi
fi
