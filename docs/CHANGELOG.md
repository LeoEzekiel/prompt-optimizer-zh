# 变更日志

## v1.0.0 (2026-09-21)

### 新增
- 基于 linshenkx/prompt-optimizer（21k+ Stars）二次开发
- 新增适老化模板 (`elderly-friendly`)
- 新增民族团结模板 (`ethnic-unity`)
- 全中文 README、使用指南、模板说明、FAQ
- Docker 一键部署支持
- 一键部署脚本 `deploy.sh`
- 完整示例：适老历史故事、民族团结内容

### 改进
- 模板全部添加中文注释
- 移除 advanced-optimize 模板中的英文注入
- 增加详细的配置说明
- 优化项目文档结构

### 技术栈
- Vue 3 + TypeScript
- Vite 构建
- pnpm 包管理
- Docker 部署

### 文件清单
- README.md（项目总览）
- docs/README-COMPLETE.md（完整项目说明）
- docs/SUMMARY.md（精简版说明）
- docs/usage.md（使用指南）
- docs/templates.md（模板说明）
- docs/faq.md（常见问题）
- docs/project-info.md（项目概述）
- docs/MAINTENANCE.md（维护手册）
- examples/usage-examples.md（使用示例）
- src/template_defaults.ts（核心模板代码）
- src/prompt_service.ts（优化服务）
- src/model_defaults.ts（模型配置）
- deploy.sh（部署脚本）
- Dockerfile（Docker 构建）
- nginx.conf（Nginx 配置）

---

## 未来计划

### v1.1.0
- [ ] 批量优化功能
- [ ] Prompt 版本管理
- [ ] 导出为 Markdown/PDF

### v1.2.0
- [ ] 移动端适配
- [ ] 多语言支持
- [ ] Prompt 分享功能

### v2.0.0
- [ ] 社区模板市场
- [ ] AI 模板推荐
- [ ] 团队协作功能
