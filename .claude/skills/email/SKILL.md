---
name: email
description: 通过SMTP发送邮件 - 供应商管理与内部汇报
---

# Email 发送

通过网易邮箱SMTP发送邮件。

## 配置

- SMTP: smtp.yeah.net:465
- 用户名: sundanian@yeah.net

## 快速开始

```
你说："发个邮件给xxx"
我答："请提供：收件人、主题、内容"
```

## 场景索引

### 供应商管理（全生命周期）

| 阶段 | 模板文件 | 说明 |
|------|----------|------|
| 引入 | `templates/supplier-intro.md` | 资质审核、准入审批、合作确认 |
| 商务 | `templates/supplier-business.md` | 报价确认、合同续签 |
| 合同 | `templates/supplier-contract.md` | 合同签署、变更、终止 |
| 巡检 | `templates/supplier-inspection.md` | 巡检通知、结果反馈 |
| 处罚 | `templates/supplier-penalty.md` | 处罚通知、申述处理 |
| 合规 | `templates/supplier-compliance.md` | 合规检查、整改要求 |
| 扩张 | `templates/supplier-expand.md` | 扩张审批、增量确认 |
| 分量 | `templates/supplier-share.md` | 分量调整 |
| 转正 | `templates/supplier-probation.md` | 转正申请、转正确认 |
| 清退 | `templates/supplier-exit.md` | 清退通知、账务结算 |

### 内部汇报

| 场景 | 模板文件 |
|------|----------|
| 周报 | `templates/weekly-report.md` |
| 月报 | `templates/monthly-report.md` |
| 专项汇报 | `templates/special-report.md` |
| 风险预警 | `templates/risk-alert.md` |

### 跨部门协作

| 场景 | 模板文件 |
|------|----------|
| 需求确认 | `templates/cross-dept-request.md` |
| 资源协调 | `templates/cross-dept-support.md` |

### 通用模板

| 场景 | 模板文件 |
|------|----------|
| 正式汇报 | `templates/formal-report.md` |
| 通知 | `templates/notification.md` |
| 协作 | `templates/collaboration.md` |
| 简洁版 | `templates/internal.md` |

---

## 发送流程

```
1. 告诉我场景
   - "供应商引入通知"
   - "周报"

2. 我调对应模板

3. 你提供具体信息
   - 收件人
   - 企业名
   - 关键数据

4. 我生成并发送
```

---

## 示例对话

```
你：帮我写个供应商引入通知
我：请提供：供应商名称、资质审核截止时间、提交邮箱
你：XXX公司，2月28日前，xxx@xxx.com
我：[生成模板，发送]
```

---

## 注意事项

- 外部邮件用正式格式
- 发送前确认收件人
- 重要邮件先发自己测试
- 附件要检查
