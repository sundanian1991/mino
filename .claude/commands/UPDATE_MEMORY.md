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

### 5. 自动清理（新增）

**P2-daily 清理**：
- 删除 30 天前的 daily 文件

**P2-observations 清理**：
- 60 天前的 observations 合并到 weekly 后删除

**P1-active 归档检查**：
- 检查 90 天未更新的项目
- 提示是否归档到 P2-weekly

### 6. 更新 .abstract 索引
- 更新 `memory/.abstract` 中的文件列表
- 更新"最后运行"时间

---

## 输出

1. 周文档 `memory/P2-weekly/YYYY-MM-Wx.md`
2. 更新的长期记忆（如果有）
3. 更新 `.abstract` 索引
4. Commit + Push

---

*每周一次的记忆整理，保持长期记忆鲜活*
