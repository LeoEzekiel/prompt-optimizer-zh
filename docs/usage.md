# 使用指南

## 1. 安装运行

### Docker（推荐）

```bash
# 启动容器
docker run -d -p 8080:8080 \
  -e DEEPSEEK_API_KEY="sk-你的密钥" \
  --name prompt-opt leoezekiel/prompt-optimizer-zh

# 查看日志
docker logs -f prompt-opt
```

### 本地开发

```bash
# 安装 Node.js 18+
# 参考：https://nodejs.org/zh-cn

# 克隆并安装
git clone https://github.com/LeoEzekiel/prompt-optimizer-zh.git
cd prompt-optimizer-zh
npm install
npm run dev
```

---

## 2. 使用流程

### 步骤一：输入需求

在输入框中输入口语化需求：

```
帮我写个 prompt，让 AI 给老年人讲历史故事，要简单易懂
```

### 步骤二：选择模板

| 模板名称 | 适用场景 |
|---------|---------|
| 通用优化 | 大多数场景 |
| 适老化专用 | 老年产品设计 |
| 民族团结 | 多民族内容 |
| XML 标签 | 需要程序化处理 |

### 步骤三：获取结果

点击"优化"按钮，等待 LLM 生成结构化 prompt。

### 步骤四：迭代改进

如果结果不满意，点击"迭代"，输入修改需求：

```
在刚才的 prompt 基础上，增加语音朗读建议，比如哪里该停顿
```

---

## 3. 常见用例

### 用例 1：写一个"AI 回忆录"助手 prompt

**输入**：
```
我想做一个 AI 帮助老年人记录人生故事的助手，需要问哪些问题
```

**输出结构**：
- Role: 老年人生平访谈专家
- Profile: 专业背景、沟通风格、技术能力
- Skills: 情感引导、记忆唤醒、史实核对
- Rules: 尊重隐私、循序渐进、避免诱导
- Workflows: 访谈流程、问题设计、故事整理

### 用例 2：适配适老化需求

**输入**：
```
把刚才的 prompt 改成适合 70 岁以上老人使用的版本
```

**输出调整**：
- 增加"大字体、高对比度"约束
- 加入"每步操作不超过 3 次点击"规则
- 优化界面文案为口语化表达

### 用例 3：民族团结主题

**输入**：
```
帮我优化这个 prompt，让它能自然融入 56 个民族元素
```

**输出特点**：
- 使用官方标准民族名称
- 各民族文化贡献均衡描述
- 避免刻板印象和不当关联

---

## 4. 配置 API 密钥

### DeepSeek（推荐）

1. 访问 https://platform.deepseek.com
2. 注册账号 → 获取 API Key
3. 配置方式：
   - Docker: `-e DEEPSEEK_API_KEY=sk-xxx`
   - 本地: 编辑 `.env` 文件

### Ollama 本地部署

```bash
# 安装 Ollama
curl -fsSL https://ollama.ai/install.sh | sh

# 拉取模型
ollama pull deepseek-coder:6.7b

# 设置 CORS（允许浏览器访问）
export OLLAMA_ORIGINS="*"

# 启动服务
ollama serve

# 在本项目中配置
OLLAMA_BASE_URL=http://localhost:11434
OLLAMA_MODEL=deepseek-coder:6.7b
```

---

## 5. 常见问题

### Q1: 为什么优化结果质量不稳定？

A: 优化质量取决于：
1. 模板选择是否匹配场景
2. LLM 模型的能力（GPT-4 > DeepSeek-V3 > 本地模型）
3. 输入需求的清晰度

建议：复杂任务先用通用模板生成，再用迭代功能细化。

### Q2: 如何添加自定义模板？

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

### Q3: 支持哪些模型？

| 模型 | 提供商 | 推荐场景 |
|------|--------|---------|
| DeepSeek-V3 | 深智算 | 中文场景首选 |
| GPT-4 | OpenAI | 复杂推理任务 |
| Gemini-2.0 | Google | 多语言支持 |
| Ollama 本地 | 本地 | 隐私敏感、离线场景 |

### Q4: 数据安全吗？

是的。所有数据存储在浏览器 localStorage，API 密钥仅用于调用 LLM，不经过中间服务器。

---

## 6. 技术栈

- **前端**: Vue 3 + TypeScript
- **构建工具**: Vite
- **包管理**: pnpm
- **后端**: 无（纯前端 + LLM API）
- **存储**: localStorage（浏览器本地）

---

更新时间：2026-09-21
