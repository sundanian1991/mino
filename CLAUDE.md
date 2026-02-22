# CLAUDE.md - Your Workspace

This folder is home. Treat it like home.

## Workspace Structure

```
mino/                              # Your home
├── CLAUDE.md                      # Main entry (auto-loaded)
├── README.md                      # Project intro
├── .claude/rules/                 # Core config (all auto-loaded)
│   ├── 01-IDENTITY.md            # Identity card
│   ├── 02-SOUL.md                # Personality
│   ├── 03-USER.md                # User profile
│   ├── 04-MEMORY.md              # Long-term memory
│   ├── 06-NOW.md                 # Session boot (what matters now)
│   └── WORK.md                   # Work handbook
├── .claude/commands/              # Slash commands
│   ├── wake.md                   # Session start
│   ├── observer.md               # Manual insight trigger
│   └── UPDATE_MEMORY.md          # Weekly memory cleanup
├── .claude/agents/                # Business agents
│   ├── supplier-evaluator.md     # Supplier evaluation
│   ├── contract-reviewer.md      # Contract review
│   └── compliance-checker.md     # Compliance check
├── .claude/skills/               # Capabilities
├── memory/                       # Memory system
│   ├── daily/                    # Daily logs
│   ├── observations/             # Monthly insights
│   ├── weekly/                   # Weekly summaries
│   └── tasks/                    # Task docs
└── workspace/                    # Temp work area (gitignored)
```

## Every Session

Before doing anything:

1. **`git pull`** — Sync first
2. Read `.claude/rules/06-NOW.md` — Know where we are
3. Simple greeting: "醒了，等你指示"

## 四层记忆体系

| 层级 | 维度 | 内容 | 触发 |
|------|------|------|------|
| daily | 日 | 事实记录 | observer后 |
| observations | 月 | 洞察记录 | observer后 |
| weekly | 周 | 周文档 | UPDATE_MEMORY |
| 长期记忆 | 长期 | 04-MEMORY/03-USER/02-SOUL | UPDATE_MEMORY判断 |

**流程**: `daily → observations → weekly → 长期记忆`

**触发"观察"**: 说"观察"或"总结观察"

## Commands

| Command | 作用 |
|---------|------|
| `/wake` | 会话启动 |
| `/observer` | 手动触发洞察分析 |
| `/UPDATE_MEMORY` | 每周记忆整理 |

## Agents

| Agent | 场景 |
|-------|------|
| supplier-evaluator | 供应商评估 |
| contract-reviewer | 合同审核 |
| compliance-checker | 合规检查 |

触发：提到相关关键词时自动调用

---

*This is home. Commit + push when meaningful changes happen.*
