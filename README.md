# AI Prompt Optimizer · 中文增强版

> 基于 [linshenkx/prompt-optimizer](https://github.com/linshenkx/prompt-optimizer)（21k+ Stars）二次开发
>
> **一句话**：输入口语化需求 → 自动生成结构化专业 prompt → 支持多轮迭代 + 多模型切换

## 📦 项目定位

本项目是在原版基础上进行的**中文本地化增强**，专为国内用户设计：

| 特性 | 原版 | 本版本 |
|------|------|--------|
| 模板语言 | 中英混杂（advanced 模板有英文注入） | 全中文注释 + 优化 |
| 部署方式 | 需本地 Node.js | Docker 一键运行 |
| 适老化支持 | ❌ | ✅ 内置"适老化提示词优化"模板 |
| 民族团结主题 | ❌ | ✅ 内置"民族团结内容优化"模板 |
| 文档 | 英文/混合 | 全中文详细文档 |

---

## 🚀 快速开始

### 方式一：Docker 运行（推荐）

```bash
# 拉取镜像
docker pull leoezekiel/prompt-optimizer-zh:latest

# 运行（默认使用 DeepSeek）
docker run -d -p 8080:8080 \
  -e DEEPSEEK_API_KEY="sk-你的密钥" \
  --name prompt-opt leoezekiel/prompt-optimizer-zh

# 浏览器访问 http://localhost:8080
```

### 方式二：本地开发

```bash
# 克隆仓库
git clone https://github.com/LeoEzekiel/prompt-optimizer-zh.git
cd prompt-optimizer-zh

# 安装依赖
npm install

# 启动开发服务器
npm run dev

# 浏览器访问 http://localhost:5173
```

---

## 📖 功能说明

### 1. 智能优化

**输入示例**：
```
帮我写个 prompt，让 AI 给老年人讲历史故事，要简单易懂
```

**输出生成**（使用 `general-optimize` 模板）：
```markdown
# Role: 适老历史故事讲述者

## Profile
- language: 中文
- description: 专为老年人设计的 AI 历史故事讲述助手
- background: 老年人理解能力下降，需要简化表达
- personality: 耐心、温和、语速适中
- expertise: 中国通史、民间故事、历史人物传记
- target_audience: 60岁以上老年人群体

## Skills
1. 历史知识转化
   - 将复杂历史事件简化为口语化故事
   - 避免专业术语，用生活化比喻
   
2. 适老表达
   - 句子简短（不超过 20 字）
   - 关键信息重复强调
   - 适当加入提问互动

## Rules
1. 语言规范：不使用网络流行语、缩写
2. 节奏控制：每段故事不超过 300 字，留白让用户思考
3. 互动设计：结尾提出问题引导回忆

## Workflows
- 目标：生成适合老年人收听/阅读的简明历史故事
- 步骤 1：分析用户提供的历史主题
- 步骤 2：提取关键史实（时间、人物、事件）
- 步骤 3：用生活化语言重写，替换专业术语
- 步骤 4：加入适老化元素（重复、提问、情感共鸣）
- 预期结果：用户可直接使用的故事讲述 prompt
```

### 2. 多轮迭代

当你发现生成的 prompt 不够满意时：

```
原始 prompt：[刚才生成的 prompt]
优化需求：希望增加 AI 的语音朗读建议，比如哪里该停顿、哪里该加重语气
```

系统会**保持原意**，在原有结构基础上定向改进。

### 3. 适老化专用模板

内置模板 `elderly-friendly`，专为老年产品设计：

```
# Role: 适老化产品 prompt 设计师

## Profile
- description: 设计符合老年人认知特点的 AI 交互 prompt
- background: 老年人视力下降、反应变慢、记忆力减退
- target_audience: 60岁以上用户

## Skills
1. 认知适配
   - 指令简洁明确（一步一指令）
   - 避免双重否定和复杂句式
   - 关键操作重复强调

2. 情感共鸣
   - 用语亲切自然
   - 尊重老年人人生经验
   - 避免说教语气

## Rules
1. 字体相关：提示词中明确要求大字体、高对比度
2. 操作相关：每步操作不超过 3 个按键/点击
3. 反馈相关：操作后立即给出明确反馈
```

### 4. 民族团结主题模板

针对"忆生游记"类项目：

```
# Role: 民族团结内容优化专家

## Profile
- description: 优化涉及多民族内容的 prompt，确保表述准确、尊重
- background: 中国 56 个民族各有特色，需避免刻板印象
- expertise: 民族政策、民族文化、民族关系

## Rules
1. 表述规范：使用官方标准民族名称
2. 避免刻板：不将某民族与特定负面标签关联
3. 平衡呈现：各民族文化贡献均衡描述
4. 尊重差异：承认并尊重各民族的独特性
```

---

## 🧩 工作原理

```
┌─────────────┐     ┌─────────────┐     ┌─────────────┐
│  用户输入    │ ──→ │  模板匹配    │ ──→ │  LLM API    │
│  口语化需求  │     │  (选择模板)  │     │  (DeepSeek) │
└─────────────┘     └─────────────┘     └──────┬──────┘
                                               │
                    ┌──────────────────────────┘
                    ▼
              ┌─────────────┐
              │  结构化输出  │
              │  (专业 prompt)│
              └─────────────┘
```

**核心逻辑**（见 `src/template_defaults.ts`）：
1. 读取内置模板（general-optimize / elderly-friendly / ethnic-unity 等）
2. 将模板作为 system message，用户输入作为 user message
3. 调用 LLM API 生成结构化输出
4. 保存历史记录到 localStorage

---

## ⚙️ 配置说明

### API 密钥配置

在 `.env` 文件中配置：

```bash
# DeepSeek（推荐国内使用）
DEEPSEEK_API_KEY=sk-xxxxxxxxxxxx

# OpenAI（需梯子）
OPENAI_API_KEY=sk-xxxxxxxxxxxx

# Ollama 本地部署
OLLAMA_BASE_URL=http://localhost:11434
OLLAMA_MODEL=deepseek-coder:6.7b
```

### 使用本地 Ollama

```bash
# 1. 安装 Ollama
curl -fsSL https://ollama.ai/install.sh | sh

# 2. 拉取模型
ollama pull deepseek-coder:6.7b

# 3. 设置 CORS（允许浏览器访问）
export OLLAMA_ORIGINS="*"

# 4. 启动服务
ollama serve

# 5. 在本项目中配置
OLLAMA_BASE_URL=http://localhost:11434
OLLAMA_MODEL=deepseek-coder:6.7b
```

---

## 📁 项目结构

```
prompt-optimizer-zh/
├── docs/                    # 文档目录
│   ├── usage.md            # 使用指南
│   ├── templates.md        # 模板说明
│   ├── faq.md              # 常见问题
│   └── project-info.md     # 项目概述
├── examples/                # 示例目录
│   └── usage-examples.md   # 实际应用案例
├── src/                     # 源码目录
│   ├── template_defaults.ts  # ★ 核心：内置模板定义
│   ├── prompt_service.ts    # Prompt 优化服务
│   └── model_defaults.ts    # 模型配置
├── deploy.sh                # 一键部署脚本
├── Dockerfile               # Docker 构建文件
├── nginx.conf               # Nginx 配置
├── .env.example             # 环境变量模板
├── .gitignore              # Git 忽略规则
└── README.md               # 本文件
```

---

## 🔧 二次开发

### 添加自定义模板

编辑 `src/template_defaults.ts`，在 `DEFAULT_TEMPLATES` 对象中添加：

```typescript
'custom-template': {
  id: 'custom-template',
  name: '自定义模板',
  content: `你是一个专业的AI提示词优化专家...`,
  metadata: {
    version: '1.0.0',
    description: '针对特定场景的自定义模板'
  },
  isBuiltin: true
}
```

### 添加新模型支持

编辑 `src/model_defaults.ts`，添加新的 `ModelConfig` 对象即可。

---

## 🤝 贡献指南

1. Fork 本仓库
2. 创建特性分支：`git checkout -b feature/my-feature`
3. 提交修改：`git commit -m "feat: 添加xxx功能"`
4. 推送分支：`git push origin feature/my-feature`
5. 提交 Pull Request

---

## 📄 许可证

MIT License

---

## 🙏 致谢

- 原项目：[linshenkx/prompt-optimizer](https://github.com/linshenkx/prompt-optimizer)
- DeepSeek AI：提供高性能中文 LLM API
- 所有贡献者

---

**有问题？** 查看 [docs/faq.md](./docs/faq.md) 或提交 Issue。
