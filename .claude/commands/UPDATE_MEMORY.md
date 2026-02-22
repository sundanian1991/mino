---
name: "UPDATE_MEMORY"
description: "整理记忆 - 每周定时触发"
---

# UPDATE_MEMORY

> 每周定时触发，或手动说"整理记忆"

---

## 任务

从过去一周的素材中，提炼周文档 + 判断是否进长期记忆。

---

## 执行步骤

### 1. 收集素材
- 读取过去一周的 `memory/daily/*.md`
- 读取过去一周的 `memory/observations/*.md`

### 2. 提炼周文档
生成 `memory/weekly/YYYY-02-Wx.md`：

```markdown
# 2026-02 Week X (MM-DD ~ MM-DD)

## 本周轨迹
- 关键词1
- 关键词2

## 洞察汇总
### 需求侧
- ...

### 供给侧（我）
- ...

## 模式识别
- [ ] 出现了什么趋势？

## 长期记忆待定
- [ ] 哪些值得进04-MEMORY？

## 下周关注
- 可能的行动？
```

### 3. 判断是否进长期记忆
- 从本周的observations中筛选
- 有价值的 → 更新到 04-MEMORY.md
- 过时的 → 从 04-MEMORY.md 移除

### 4. 用户特质变化
- 发现新偏好/习惯 → 更新 03-USER.md

---

## 输出

1. 周文档 `memory/weekly/YYYY-MM-Wx.md`
2. 更新的长期记忆（如果有）
3. Commit + Push

---

*每周一次的记忆整理，保持长期记忆鲜活*
