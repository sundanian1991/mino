---
pos: .claude/rules/
input: 无
output: AI 行为规则配置
update: 手动（规则变更时）
---

# .claude/rules/ - 系统规则库

> mino 的"操作系统内核" - AI 行为规则与配置
>
> **来源**：Vibe Coding 分层文档架构 - 模块级规则库

---

## 作用

**定义 AI 工作规则**：
- 身份定义 (我是谁)
- 用户画像 (年老师是谁)
- 记忆机制 (如何记录)
- 工作流规范 (如何执行)

---

## 结构

```
.claude/rules/
├── 01-IDENTITY.md         # AI 身份定义
├── 02-SOUL.md             # 9 条气质
├── 03-USER.md             # 年老师画像
├── 04-MEMORY.md           # 长期记忆规则
├── 06-NOW.md              # 会话启动插卡
├── WORK.md                # 工作手册
└── FIVE-FILE-WORKFLOW.md  # 五文件工作流指南
```

---

## 文件说明

### 核心身份层 (P0)

| 文件 | 作用 | 更新频率 |
|------|------|----------|
| `01-IDENTITY.md` | AI 身份定义 ( nomi) | 极少 |
| `02-SOUL.md` | 9 条气质/工作原则 | 极少 |
| `03-USER.md` | 年老师基本信息/风格 | 有变化时 |

### 记忆机制层 (P0)

| 文件 | 作用 | 更新频率 |
|------|------|----------|
| `04-MEMORY.md` | 长期记忆规则 | 极少 |
| `06-NOW.md` | 会话启动流程 | 有变化时 |

### 工作规范层 (P1)

| 文件 | 作用 | 更新频率 |
|------|------|----------|
| `WORK.md` | 工作手册/核心原则 | 边跑边调 |
| `FIVE-FILE-WORKFLOW.md` | 五文件工作流指南 | 有变化时 |

---

## 加载顺序

```
/wake → 06-NOW.md → .abstract → 其他按需加载
```

---

## 与 CLAUDE.md 关系

```
CLAUDE.md (项目入口)
    │
    ├─→ .claude/rules/ (系统规则)
    │       └─→ 06-NOW.md (会话启动)
    │
    ├─→ .claude/commands/ (命令)
    │       └─→ /wake, /observer, /UPDATE_MEMORY
    │
    └─→ memory/ (记忆数据)
            └─→ .abstract (L0 索引)
```

**区别**：
- `CLAUDE.md` = 项目配置入口 (给 AI 看的第一眼)
- `.claude/rules/` = 系统规则库 (持续生效)

---

## 维护规则

1. **规则变更** → 更新对应 `.md` 文件
2. **新增规则** → 命名规范 `XX-NAME.md`
3. **规则冲突** → 优先级见 `CLAUDE.md`

---

## 相关命令

| 命令 | 作用 |
|------|------|
| `/wake` | 会话启动 (读 06-NOW.md) |
| `/plan` | 五文件工作流 (读 FIVE-FILE-WORKFLOW.md) |

---

*规则是 AI 的操作系统，边跑边调*
