---
name: memory-system
version: "1.0.0"
description: 记忆系统自动同步 - L0/L1/L2 分层记忆 + P0/P1/P2 生命周期管理
user-invocable: false
allowed-tools:
  - Read
  - Write
  - Edit
  - Bash
hooks:
  PostToolUse:
    - matcher: "Write|Edit"
      pathPattern: "memory/.*\\.md$"
      hooks:
        - type: command
          command: |
            echo "[memory-system] 检测到记忆文件变更，触发索引更新..."
            ~/.claude/skills/memory/scripts/memory-update-index.sh
  Stop:
    - hooks:
        - type: command
          command: |
            # 会话结束时检查记忆目录状态
            if [ -d "$PWD/memory" ]; then
              echo "[memory-system] 记忆系统就绪 - 下次启动自动加载 .abstract"
            fi
---

# Memory System - 记忆系统自动同步

## 核心机制

### 自动索引更新

当检测到 `memory/` 目录下有 `.md` 文件被 Write/Edit 时：
1. 自动触发 `memory-update-index.sh`
2. 重建 `.abstract` 索引
3. 确保 L0 索引与文件同步

### 生命周期管理

| 级别 | 清理条件 | 执行时机 |
|------|----------|----------|
| P2-daily | 30 天未更新 | /UPDATE_MEMORY |
| P2-observations | 60 天未更新 | /UPDATE_MEMORY |
| P1-active | 90 天未更新 | /UPDATE_MEMORY 提示 |

---

## 相关文件

- `memory/.abstract` - L0 索引（自动更新）
- `memory/README.md` - 模块说明
- `.claude/skills/memory/scripts/` - 脚本目录

---

## 命令

| 命令 | 作用 |
|------|------|
| `/observer` | 写入记忆 + 触发索引更新 |
| `/UPDATE_MEMORY` | 每周清理 + 重建索引 |
