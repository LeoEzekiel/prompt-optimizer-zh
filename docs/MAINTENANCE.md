# 项目维护手册

## 更新记录

### v1.0.0 (2026-09-21)
- 初始版本发布
- 基于 linshenkx/prompt-optimizer 二次开发
- 新增适老化模板
- 新增民族团结模板
- 全中文文档

## 代码规范

### 命名规范
- 模板 ID：小写字母 + 连字符（如 `elderly-friendly`）
- 组件名：大驼峰（如 `PromptPanel`）
- 函数名：小驼峰（如 `optimizePrompt`）
- 文件名：小写字母 + 连字符（如 `prompt-service.ts`）

### 注释规范
- 所有注释使用中文
- 关键逻辑添加注释说明
- 复杂算法添加原理说明

### 提交规范
```
feat: 添加 xxx 功能
fix: 修复 xxx 问题
docs: 更新 xxx 文档
refactor: 重构 xxx 代码
test: 添加 xxx 测试
chore: 构建/工具/依赖更新
```

## 版本发布流程

1. 更新版本号（package.json）
2. 更新 CHANGELOG.md
3. 提交代码
4. 打 tag：`git tag v1.0.0`
5. 推送：`git push origin v1.0.0`
6. 发布 GitHub Release

## 常见问题排查

### 构建失败
```bash
# 清除缓存重试
rm -rf node_modules
npm install
npm run build
```

### 依赖冲突
```bash
# 使用 pnpm 替代 npm
pnpm install
```

### 运行时错误
```bash
# 检查环境变量
echo $DEEPSEEK_API_KEY

# 检查日志
docker logs prompt-opt
```

## 贡献指南

1. Fork 本仓库
2. 创建特性分支：`git checkout -b feature/xxx`
3. 提交修改：`git commit -m "feat: 添加xxx"`
4. 推送：`git push origin feature/xxx`
5. 提交 Pull Request

---

更新时间：2026-09-21
