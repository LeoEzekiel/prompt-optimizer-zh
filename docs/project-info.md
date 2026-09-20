# 项目说明

## 项目概述

**AI Prompt Optimizer · 中文增强版** 是基于 [linshenkx/prompt-optimizer](https://github.com/linshenkx/prompt-optimizer)（21k+ Stars）的二次开发项目。

### 为什么做这个版本？

原版项目虽然优秀，但存在以下问题：
1. **模板语言混杂**：`advanced-optimize` 模板中夹杂英文指令，中文用户理解困难
2. **缺少本土化**：未针对国内用户习惯和场景优化
3. **文档不足**：缺乏详细的中文使用说明
4. **特定场景缺失**：没有适老化、民族团结等中文特色场景的模板

### 本版本改进

| 改进项 | 说明 |
|--------|------|
| 全中文模板 | 所有内置模板均有详细中文注释 |
| 新增适老化模板 | 专门针对老年人产品设计优化 |
| 新增民族团结模板 | 符合中国民族政策的内容生成规范 |
| 完整中文文档 | README、使用指南、模板说明、FAQ 全覆盖 |
| 一键部署脚本 | Bash 脚本自动化配置和启动 |
| Docker 支持 | 无需 Node.js 环境，一条命令运行 |

---

## 核心功能

### 1. 智能 Prompt 优化

输入口语化需求，自动生成结构化专业 prompt。

**示例**：
```
输入：帮我写个 prompt，让 AI 给老年人讲历史故事
输出：# Role: 适老历史故事讲述者\n\n## Profile\n- language: 中文\n...
```

### 2. 多轮迭代优化

在已有 prompt 基础上定向改进。

**示例**：
```
原始：[刚才生成的 prompt]
需求：增加语音朗读停顿提示
输出：[改进版 prompt，含朗读指导]
```

### 3. 多模型支持

- DeepSeek（推荐国内用户）
- OpenAI
- Gemini
- Ollama 本地部署

### 4. 隐私保护

- API 密钥存储在浏览器本地
- 所有数据不出本机
- 无第三方服务器中转

---

## 快速开始

### Docker 方式（推荐）

```bash
# 一键启动（DeepSeek）
docker run -d -p 8080:8080 \
  -e DEEPSEEK_API_KEY="sk-你的密钥" \
  --name prompt-opt leoezekiel/prompt-optimizer-zh

# 浏览器访问 http://localhost:8080
```

### 本地开发方式

```bash
git clone https://github.com/LeoEzekiel/prompt-optimizer-zh.git
cd prompt-optimizer-zh
npm install
npm run dev
# 访问 http://localhost:5173
```

---

## 文件结构

```
prompt-optimizer-zh/
├── src/                      # 核心源码
│   ├── template_defaults.ts  # ★ 内置模板定义
│   ├── prompt_service.ts     # Prompt 优化服务
│   └── model_defaults.ts     # 模型配置
├── docs/                     # 文档
│   ├── usage.md             # 使用指南
│   ├── templates.md         # 模板说明
│   └── faq.md               # 常见问题
├── examples/                 # 示例
│   └── usage-examples.md    # 实际应用案例
├── deploy.sh                 # 一键部署脚本
├── Dockerfile               # Docker 构建文件
├── nginx.conf               # Nginx 配置
├── .env.example             # 环境变量模板
└── README.md                # 本文件（项目总览）
```

---

## 内置模板说明

### 1. general-optimize（通用优化）
适用于大多数场景的标准模板。

### 2. output-format-optimize（带格式优化）
需要严格输出格式时使用，如 JSON、表格等。

### 3. advanced-optimize（深度思考版）
复杂任务，需要 LLM 深度推理时选用。

### 4. iterate（迭代优化）
在已有 prompt 基础上定向改进。

### 5. structured-format（XML 标签版）
输出 XML 格式，适合程序化处理。

### 6. elderly-friendly（适老化专用）⭐ 新增
专为老年人产品设计优化。

### 7. ethnic-unity（民族团结）⭐ 新增
多民族内容表述规范。

---

## 配置 API 密钥

### DeepSeek（推荐）
1. 访问 https://platform.deepseek.com
2. 注册并获取 API Key
3. 配置到环境变量或 Docker 参数

### Ollama 本地部署
```bash
# 安装 Ollama
curl -fsSL https://ollama.ai/install.sh | sh

# 拉取模型
ollama pull deepseek-coder:6.7b

# 设置 CORS
export OLLAMA_ORIGINS="*"

# 启动服务
ollama serve
```

---

## 常见问题

详见 [docs/faq.md](./docs/faq.md)

---

## 开发计划

- [ ] 添加更多场景化模板
- [ ] 支持 Prompt 版本管理
- [ ] 导出为 Markdown/PDF
- [ ] 移动端适配
- [ ] 多语言支持（简繁中文、英文）

---

## 贡献指南

欢迎提交 Issue 和 Pull Request！

1. Fork 本仓库
2. 创建特性分支：`git checkout -b feature/xxx`
3. 提交修改：`git commit -m "feat: 添加xxx"`
4. 推送：`git push origin feature/xxx`
5. 提交 Pull Request

---

## 许可证

MIT License

---

## 致谢

- 原项目：[linshenkx/prompt-optimizer](https://github.com/linshenkx/prompt-optimizer)
- DeepSeek AI：提供高性能中文 LLM API
- 所有贡献者

---

更新时间：2026-09-21
