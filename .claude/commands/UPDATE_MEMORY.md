---
name: "UPDATE_MEMORY"
description: "整理记忆 - 每周定时触发"
---

# UPDATE_MEMORY

> 每周定时触发，或手动说"整理记忆"

---

## 任务

从过去一周的素材中，提炼周文档 + 判断是否进长期记忆 + 执行自动清理。

---

## 执行步骤

### 1. 收集素材
- 读取过去一周的 `memory/P2-daily/*.md`
- 读取过去一周的 `memory/P2-observations/*.md`

### 2. 提炼周文档
生成 `memory/P2-weekly/YYYY-02-Wx.md`：

```markdown
# 2026-02 Week X (MM-DD ~ MM-DD)

## 本周轨迹
- 关键词 1
- 关键词 2

## 洞察汇总
### 需求侧
- ...

### 供给侧（我）
- ...

## 模式识别
- [ ] 出现了什么趋势？

## 长期记忆待定
- [ ] 哪些值得进 04-MEMORY？

## 下周关注
- 可能的行动？
```

### 3. 判断是否进长期记忆
- 从本周的 observations 中筛选
- 有价值的 → 更新到 04-MEMORY.md
- 过时的 → 从 04-MEMORY.md 移除

### 4. 年老师特质变化
- 发现新偏好/习惯 → 更新 03-USER.md

### 5. 自动清理（调用脚本）

**运行 cleanup 脚本**：
```bash
.clause/skills/memory/scripts/memory-cleanup.sh
```

脚本自动完成：
- 删除 30 天前的 P2-daily
- 删除 60 天前的 P2-observations
- 检查 90 天未更新的 P1-active
- **自动重建 `.abstract` 索引**

### 6. 验证索引更新
- 读取 `memory/.abstract` 确认索引已更新
- 检查 P1/P2 文件列表正确

---

## 输出

1. 周文档 `memory/P2-weekly/YYYY-MM-Wx.md`
2. 更新的长期记忆（如果有）
3. 自动清理完成 + 索引重建
4. Commit + Push

---

*每周一次的记忆整理，保持长期记忆鲜活*
