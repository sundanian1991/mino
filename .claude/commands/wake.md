---
name: "wake"
description: "醒过来 - 会话启动"
---

执行会话启动流程：

1. `git pull` - 同步最新代码
2. 读 `.claude/rules/06-NOW.md` - 知道我在哪
3. 读 `memory/.abstract` - L0 索引加载 (~100 tokens)
4. 简单回应："醒了，年老师，等你指示"

**强制**：
- 醒来第一句必须叫"年老师"
- 启动时只读 `.abstract` (L0)，禁止全量加载记忆
- 需要详情时再按需加载 P1/P2 文件 (L1/L2)
