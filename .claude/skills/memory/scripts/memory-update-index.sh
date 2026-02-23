#!/bin/bash
# memory-update-index.sh - 快速更新 .abstract 索引（不删除）
# 用法：./memory-update-index.sh [new_file.md]

set -e

MEMORY_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../../memory" && pwd)"
ABSTRACT_FILE="$MEMORY_DIR/.abstract"
NEW_FILE="$1"

echo "[memory-index] 更新索引：$MEMORY_DIR"

# 如果有新文件，输出提示
if [ -n "$NEW_FILE" ]; then
    echo "[memory-index] ✅ 新增：$NEW_FILE"
fi

TODAY=$(date +%Y-%m-%d)

# 快速重建索引（简化版，只更新文件列表）
cat > "$ABSTRACT_FILE" << EOF
# 记忆索引 (Memory Abstract)

> L0 层索引 - 每次启动只读这个 (~100 tokens)
> 更新时间：$TODAY

---

## P0 核心记忆（永久）

| 文件 | 内容 | 位置 |
|------|------|------|
| 04-MEMORY.md | 长期记忆规则 | .claude/rules/ |
| 03-USER.md | 年老师基本信息 | .claude/rules/ |
| 02-SOUL.md | 9 条气质 | .claude/rules/ |

**核心要点**：
- 称呼：年老师/Bro
- 风格：直接、简洁、有观点
- 充分授权

---

## P1 活跃项目（90 天）

EOF

# 扫描 P1-active
P1_FILES=$(find "$MEMORY_DIR/P1-active" -name "*.md" 2>/dev/null | sort)
if [ -n "$P1_FILES" ]; then
    echo "| 项目 | 状态 | 最后更新 |" >> "$ABSTRACT_FILE"
    echo "|------|------|----------|" >> "$ABSTRACT_FILE"
    for file in $P1_FILES; do
        bn=$(basename "$file")
        mt=$(stat -f "%Sm" -t "%Y-%m-%d" "$file" 2>/dev/null || echo "未知")
        echo "| $bn | 🔄 进行中 | $mt |" >> "$ABSTRACT_FILE"
    done
else
    echo "*暂无活跃项目*" >> "$ABSTRACT_FILE"
fi

cat >> "$ABSTRACT_FILE" << EOF

---

## P2 最近记录（30 天自动清理）

### Daily (最近 7 天)
EOF

# 扫描 P2-daily (最近 7 天)
DAILY_FILES=$(find "$MEMORY_DIR/P2-daily" -name "*.md" -mtime -7 2>/dev/null | sort -r)
if [ -n "$DAILY_FILES" ]; then
    for file in $DAILY_FILES; do
        bn=$(basename "$file")
        echo "- $bn" >> "$ABSTRACT_FILE"
    done
else
    echo "- 无最近记录" >> "$ABSTRACT_FILE"
fi

cat >> "$ABSTRACT_FILE" << EOF

### Observations (本月)
EOF

# 扫描 P2-observations
OBS_FILES=$(find "$MEMORY_DIR/P2-observations" -name "*.md" 2>/dev/null | sort -r)
if [ -n "$OBS_FILES" ]; then
    for file in $OBS_FILES; do
        bn=$(basename "$file")
        echo "- $bn" >> "$ABSTRACT_FILE"
    done
else
    echo "- 无" >> "$ABSTRACT_FILE"
fi

cat >> "$ABSTRACT_FILE" << EOF

### Weekly (本月)
EOF

# 扫描 P2-weekly
WEEKLY_FILES=$(find "$MEMORY_DIR/P2-weekly" -name "*.md" 2>/dev/null | sort -r)
if [ -n "$WEEKLY_FILES" ]; then
    for file in $WEEKLY_FILES; do
        bn=$(basename "$file")
        echo "- $bn" >> "$ABSTRACT_FILE"
    done
else
    echo "- 无" >> "$ABSTRACT_FILE"
fi

cat >> "$ABSTRACT_FILE" << EOF

---

## 加载策略

启动时 → 只读此文件 (L0)
需要时 → 加载对应 P1/P2 文件 (L1/L2)

---

## 自动清理规则

| 级别 | 清理条件 | 动作 |
|------|----------|------|
| P1 | 90 天未更新 | 归档到 weekly |
| P2-daily | 30 天未更新 | 删除 |
| P2-observations | 60 天未更新 | 合并到 weekly |

---

*最后运行：$TODAY*
EOF

echo "[memory-index] ✅ 索引更新完成"
