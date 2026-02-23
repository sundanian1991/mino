---
pos: root/.scripts/check-docs-sync.sh
input: git diff 文件变更
output: 文档同步检查报告
update: 检查逻辑变更时更新
---

# check-docs-sync.sh - 分形文档同步检查

> 检查文件变更后是否同步更新了文档

---

## 使用方法

```bash
# 检查暂存区的变更
.scripts/check-docs-sync.sh

# 或直接运行
bash .scripts/check-docs-sync.sh
```

## 检查规则

1. **新增 `.md` 文件** → 检查是否在对应文件夹的 README.md 中登记
2. **删除 `.md` 文件** → 检查是否从 README.md 移除
3. **修改文件夹结构** → 检查是否更新上层文档

## 核心代码

```bash
#!/bin/bash

# 获取暂存区的变更文件
git diff --cached --name-status

# 检查新增的 md 文件
for file in $(git diff --cached --name-only | grep '\.md$'); do
    dir=$(dirname "$file")
    readme="$dir/README.md"

    if [ -f "$readme" ]; then
        if ! grep -q "$(basename "$file")" "$readme"; then
            echo "⚠️  警告：$file 未在 $readme 中登记"
        fi
    fi
done

echo "✅ 文档同步检查完成"
```

---

## 集成到 git hook

```bash
# .git/hooks/pre-commit
#!/bin/bash
.scripts/check-docs-sync.sh
```
