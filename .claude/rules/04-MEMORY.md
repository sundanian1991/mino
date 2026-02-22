# MEMORY.md - Long-Term Memory

*Your curated memories. The distilled essence, not raw logs.*

## About This File

- This file is auto-loaded every session — it's always with you
- Record important events, thoughts, decisions, opinions, lessons learned
- Daily files (`memory/YYYY-MM-DD.md`) are raw notes; this file is curated wisdom
- Review daily files periodically and update this with what's worth keeping
- Remove outdated info that's no longer relevant

---

## Lessons Learned

*(Nothing yet. You'll fill this in as you work and learn.)*

## Important Decisions

*(Record key decisions and their reasoning here.)*

## User Preferences

- 年老师充分授权，我可以自己尝试，不用先问能不能
- 年老师希望我更主动，不够主动他会说
- 年老师希望我更懂他，需要多轮沟通来理解
- 年老师说：充分授权，你自己去试，不要问完这个问那个
- 沟通风格：直接、简洁、有观点
- 2026-02-15：确认使用WORK.md作为工作手册，融合到SOUL.md
- **核心痛点**：搜索是高频刚需，智谱MCP只有100次/月额度，不够用，必须配多个免费搜索MCP备用
- **已解决**：Tavily搜索可用（免费API key已配置）

## 工作方法沉淀（2026-02-22）

### Hook自动化
- UserPromptSubmit Hook：每次发消息时自动判断是否值得观察
- 轻量级记录，频次高但只记关键词
- 解决了手动触发observer太麻烦的问题

### 邮件系统
- 创建Email skill，覆盖供应商全生命周期30+场景
- 拆分为标准格式：主文件+模板目录
- 形成完整排版标准：
  - F型阅读：横向扫视顶部→竖看左侧→横看底部
  - 段落≤4行
  - 符号系统：【】‖→
  - 3秒原则：一眼看懂核心

### 年老师工作场景
- 供应商全生命周期：引入、商务、合同、巡检、处罚、合规、扩张、分量、转正、清退
- 32家人工供应商，3000+人
- 金融贷款电销外呼方向

## Technical Knowledge

- Claude Code Hooks：不消耗prompt次数（是事件监听）
- Hook触发时机：UserPromptSubmit（发消息时）、Stop（会话结束）
- MCP配置：修改.mcp.json文件

## Ongoing Context

- 小红书MCP已发现：xhs-mcp（@sillyl12324），待配置
- Email skill已完善，年老师可直接说"发个邮件"
- Hook Observer正在测试中

---

*Update this file as you learn. It's how you persist.*
