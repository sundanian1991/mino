#!/bin/bash
# memory-cleanup.sh - 记忆系统自动清理脚本
# 用法：./memory-cleanup.sh

set -e

MEMORY_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../../memory" && pwd)"
ABSTRACT_FILE="$MEMORY_DIR/.abstract"

echo "[memory-cleanup] 开始清理：$MEMORY_DIR"

# P2-daily: 删除 30 天前的文件
echo "[memory-cleanup] 清理 P2-daily (30 天前)..."
find "$MEMORY_DIR/P2-daily" -name "*.md" -mtime +30 -delete 2>/dev/null || true

# P2-observations: 删除 60 天前的文件
echo "[memory-cleanup] 清理 P2-observations (60 天前)..."
find "$MEMORY_DIR/P2-observations" -name "*.md" -mtime +60 -delete 2>/dev/null || true

# P1-active: 检查 90 天未更新的文件，生成报告
echo "[memory-cleanup] 检查 P1-active (90 天未更新)..."
ARCHIVE_CANDIDATES=$(find "$MEMORY_DIR/P1-active" -name "*.md" -mtime +90 2>/dev/null || true)
if [ -n "$ARCHIVE_CANDIDATES" ]; then
    echo "[memory-cleanup] ⚠️  以下文件 90 天未更新，建议归档："
    echo "$ARCHIVE_CANDIDATES"
else
    echo "[memory-cleanup] ✅ P1-active 无需归档"
fi

# 更新 .abstract 中的最后运行时间
if [ -f "$ABSTRACT_FILE" ]; then
    TODAY=$(date +%Y-%m-%d)
    sed -i '' "s/^\*最后运行：.*/\*最后运行：$TODAY/" "$ABSTRACT_FILE" 2>/dev/null || true
    echo "[memory-cleanup] ✅ 更新 .abstract 最后运行时间"
fi

echo "[memory-cleanup] 清理完成！"
