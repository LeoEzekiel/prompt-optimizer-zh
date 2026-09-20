# AI Prompt Optimizer · 中文增强版 — 完整项目说明

> **项目定位**：帮助你把"脑子里的想法"变成"AI 能精准执行的专业指令"
>
> **一句话**：输入口语化需求 → 选择场景模板 → 获取结构化专业 prompt → 多轮迭代优化 → 最终可用

---

## 📋 目录

1. [项目能做什么](#1-项目能做什么)
2. [核心功能详解](#2-核心功能详解)
3. [内置模板说明](#3-内置模板说明)
4. [使用流程](#4-使用流程)
5. [应用场景案例](#5-应用场景案例)
6. [技术架构](#6-技术架构)
7. [配置说明](#7-配置说明)
8. [常见问题](#8-常见问题)
9. [二次开发指南](#9-二次开发指南)
10. [项目路线图](#10-项目路线图)

---

## 1. 项目能做什么

### 1.1 核心价值

**问题**：很多人知道要写"好的 prompt"，但不知道怎么写。

**解决**：这个项目帮你：
- 把"口语化的需求"翻译成"结构化的专业 prompt"
- 基于不同场景（适老化、民族团结、技术文档等）自动适配
- 支持多轮迭代，不断打磨直到满意

### 1.2 五大核心能力

| 能力 | 说明 | 示例 |
|------|------|------|
| **智能优化** | 一键生成结构化 prompt | "帮我写个 prompt 让 AI 给老人讲故事" → 专业角色定义 |
| **多轮迭代** | 在已有基础上定向改进 | "增加语音朗读提示" → 更新后的 prompt |
| **多模型支持** | 切换不同 LLM 提供商 | DeepSeek / OpenAI / Gemini / Ollama |
| **格式控制** | 输出 JSON / XML / Markdown | 不同场景选择不同输出格式 |
| **隐私保护** | 本地存储，零数据外传 | API Key 和记录都在浏览器本地 |

### 1.3 典型用户画像

**你可能是**：
- 🎓 高校教师：写教案、课程提示词
- 📱 产品经理：设计 AI 产品功能
- 💻 开发者：快速生成 API 调用 prompt
- 👵 适老化产品设计师：为老年人设计 AI 交互
- 🌏 民族文化工作者：生成多民族内容

---

## 2. 核心功能详解

### 2.1 智能优化（Optimize）

**功能**：输入口语化需求，自动生成结构化专业 prompt。

**工作原理**：
```
┌─────────────────┐
│  你输入的需求    │
│  "帮我写个 prompt │
│   让 AI 讲历史故事" │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│  模板加工       │
│  (选择模板类型)  │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│  LLM 生成       │
│  (DeepSeek/GPT)  │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│  输出专业 prompt │
│  # Role: ...    │
│  ## Profile: ...│
│  ## Rules: ...  │
└─────────────────┘
```

**输出示例**：
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

### 2.2 多轮迭代（Iterate）

**功能**：在已有 prompt 基础上，针对特定方向进行改进。

**适用场景**：
- 生成的 prompt 大体满意，但某些部分需要调整
- 发现了新的需求约束需要加入
- 想让 prompt 更聚焦某个特定场景

**迭代示例**：
```
原始 prompt：[刚才生成的 prompt]
优化需求：增加语音朗读建议，标注哪里该停顿、哪里该加重语气
```

**处理逻辑**：
- ✅ 保持核心意图不变
- ✅ 只修改用户指定的部分
- ✅ 避免过度修改导致偏离原意

### 2.3 格式转换（Structured Format）

**功能**：将 prompt 转换为 XML 标签格式，适合程序化处理。

**输出格式**：
```xml
<optimized_prompt>
<task>为老年人生成历史故事讲述 prompt</task>

<context>
帮我写个 prompt，让 AI 给老年人讲历史故事，要简单易懂
</context>

<instructions>
1. 分析用户提供的历史主题
2. 提取关键史实（时间、人物、事件）
3. 用生活化语言重写
4. 加入适老化元素
5. 输出可直接使用的 prompt
</instructions>

<output_format>
- 使用 Markdown 格式
- 包含 Role、Profile、Skills、Rules、Workflows 五个部分
- 每个部分至少包含 3 条具体内容
</output_format>
</optimized_prompt>
```

**适用场景**：
- API 自动化流水线
- 批量 prompt 生成
- 程序化处理

### 2.4 流式输出（Streaming）

**功能**：实时显示 LLM 生成过程，无需等待。

**优势**：
- 用户体验更好（实时反馈）
- 可以中途取消（节省 token）
- 适合大段落内容

---

## 3. 内置模板说明

### 3.1 模板一览

| 模板 ID | 名称 | 适用场景 | 版本 |
|---------|------|----------|------|
| `general-optimize` | 通用优化 | 大多数场景的默认选择 | 1.3.0 |
| `output-format-optimize` | 带格式优化 | 需要 JSON/表格等严格格式 | 1.3.0 |
| `advanced-optimize` | 深度思考版 | 复杂任务，需要 LLM 深度推理 | 2.1.0 |
| `iterate` | 迭代优化 | 在已有 prompt 基础上改进 | 1.0.0 |
| `structured-format` | XML 标签版 | 程序化处理、API 自动化 | 1.0.3 |
| `elderly-friendly` | 适老化专用 | ⭐ 老年人产品设计 | 1.0.0 |
| `ethnic-unity` | 民族团结 | ⭐ 多民族内容生成 | 1.0.0 |

### 3.2 模板详细对比

#### general-optimize（通用优化）

**核心特点**：
- 结构清晰：Role → Profile → Skills → Rules → Workflows
- 通用性强：适合大多数场景
- 输出稳定：质量波动小

**输出结构**：
```
# Role: [角色名称]
## Profile
  - language, description, background, personality, expertise, target_audience
## Skills
  1. [核心技能类别]
     - [具体技能]: [说明]
  2. [辅助技能类别]
     - [具体技能]: [说明]
## Rules
  1. [基本原则]
  2. [行为准则]
  3. [限制条件]
## Workflows
  - 目标 → 步骤 → 预期结果
## Initialization
```

---

#### output-format-optimize（带格式优化）

**核心特点**：
- 在通用基础上增加 OutputFormat 段落
- 支持指定输出格式（JSON、Markdown、表格等）
- 适合需要严格格式的场景

**新增内容**：
```
## OutputFormat
1. [输出格式类型]
   - format: text/markdown/json
   - structure: 输出结构说明
   - style: 风格要求
2. [格式规范]
   - indentation: 缩进要求
   - sections: 分节要求
3. [验证规则]
   - validation: 格式验证规则
   - error_handling: 错误处理方式
4. [示例说明]
   - 示例内容展示
```

---

#### advanced-optimize（深度思考版）

**核心特点**：
- **共情激励**：利用"避免失业"的心理暗示提升 LLM 投入度
- **多维度分析**：从 10 个角度全面分析 prompt
- **5 条建议**：每个结构必须输出 5 条具体建议
- **深度推理**：适合复杂任务

**输出维度**：
```
1. Role - 角色定位
2. Background - 背景分析
3. Attention - 注意力要点（心理激励）
4. Profile - 画像定义
5. Skills - 技能清单
6. Goals - 目标拆解
7. Constrains - 约束规则
8. OutputFormat - 输出格式
9. Workflow - 工作流程
10. Suggestions - 优化建议（5条）
```

**注意事项**：
- Token 消耗较大（输出长）
- 需要较强 LLM 模型支撑（推荐 GPT-4 / DeepSeek-V3）

---

#### iterate（迭代优化）

**核心特点**：
- 保持核心意图不变
- 定向改进指定部分
- 避免过度修改

**使用流程**：
```
第 1 轮：用 general-optimize 生成初稿
第 2 轮：用 iterate 针对不满意的地方改进
第 3 轮：继续迭代直到满意
```

**迭代示例**：
```
原始 prompt：[第 1 轮生成的 prompt]
优化需求：增加语音朗读提示，标注停顿和重音位置
```

---

#### structured-format（XML 标签版）

**核心特点**：
- 输出 XML 标签格式
- 保留原始输入原文
- 适合程序化处理

**输出格式**：
```xml
<optimized_prompt>
<task>一句话核心任务</task>
<context>原始 prompt 全文（不改写）</context>
<instructions>
1. 步骤一
2. 步骤二
3. 步骤三...
</instructions>
<output_format>期望输出格式描述</output_format>
</optimized_prompt>
```

---

#### elderly-friendly（适老化专用）⭐ 新增

**核心特点**：
- 专为老年人产品设计优化
- 强调认知适配和情感共鸣
- 包含适老化专项约束

**特殊约束**：
```
## Rules（适老化专项）
1. 字体规范：明确要求大字体（不小于 18px）、高对比度
2. 操作简化：每步操作不超过 3 次点击
3. 反馈及时：操作后 2 秒内给出明确反馈
4. 语音辅助：关键信息支持语音朗读
5. 情感共鸣：用语亲切自然，尊重老年人人生经验
```

**适用场景**：
- 老年人健康助手
- 适老产品 prompt 设计
- 助老类应用开发

---

#### ethnic-unity（民族团结）⭐ 新增

**核心特点**：
- 针对多民族内容生成优化
- 符合中国民族政策规范
- 避免刻板印象和不当关联

**核心原则**：
```
## Rules（民族相关专项）
1. 表述规范：使用官方标准民族名称（56 个民族全称）
2. 避免刻板：不将某民族与特定负面标签关联
3. 均衡呈现：各民族文化贡献均衡描述
4. 尊重差异：承认并尊重各民族的独特性
5. 历史准确：涉及民族历史事件需核实史实
```

**禁止事项**：
- ❌ "少数民族往往..."（刻板印象）
- ❌ 将特定民族与贫穷、落后关联
- ❌ 忽视各民族的历史贡献
- ✅ "中国 56 个民族共同创造了灿烂文明"

**适用场景**：
- "忆生游记"等民族文化项目
- 民族团结宣传教育
- 多民族内容生成

---

## 4. 使用流程

### 4.1 标准使用流程

```
┌─────────────┐
│  Step 1     │  输入口语化需求
│  输入需求   │  "帮我写个 prompt..."
└──────┬──────┘
       │
       ▼
┌─────────────┐
│  Step 2     │  选择模板
│  选模板     │  (通用/适老化/民族团结/...)
└──────┬──────┘
       │
       ▼
┌─────────────┐
│  Step 3     │  点击"优化"按钮
│  生成结果   │  LLM 生成结构化 prompt
└──────┬──────┘
       │
       ▼
┌─────────────┐
│  Step 4     │  不满意？继续迭代
│  迭代优化   │  指定修改方向
└──────┬──────┘
       │
       ▼
┌─────────────┐
│  Step 5     │  复制使用
│  获得最终   │  专业 prompt
│  结果       │
└─────────────┘
```

### 4.2 快捷操作

| 操作 | 快捷键 | 说明 |
|------|--------|------|
| 优化 | Ctrl + Enter | 快速执行优化 |
| 复制结果 | Ctrl + C | 复制到剪贴板 |
| 清空输入 | Esc | 清空输入框 |
| 历史记录 | Ctrl + H | 打开历史记录抽屉 |
| 设置 | Ctrl + S | 打开设置面板 |

---

## 5. 应用场景案例

### 5.1 案例一：AI 回忆录助手（忆生游记项目）

**场景**：为"忆生游记"小程序设计 AI 访谈助手 prompt

**输入**：
```
我想做一个 AI 帮助老年人记录人生故事的助手，
需要问哪些问题才能激发详细回忆，
最后整理成故事格式
```

**输出结构**：
```markdown
# Role: 老年人生平访谈专家

## Profile
- description: 专业访谈长者人生经历的助手
- expertise: 口述历史采集、老年心理学、叙事整理
- target_audience: 60岁以上长者及其家属

## Skills
1. 引导回忆
   - 用具体场景提问（"那年的中秋节怎么过的？"）
   - 从工作场景延伸到生活细节
   
2. 叙事整理
   - 将碎片化回忆组织成时间线
   - 保留原汁原味的口语表达

## Rules
1. 访谈节奏：每次不超过 30 分钟，中间休息
2. 语言风格：口语化，不用书面语和专业术语
3. 记忆核对：涉及历史事件时温和确认时间/地点
4. 隐私尊重：不追问不愿分享的内容
5. 真实性：保留方言和口头禅，不"雅化"

## Workflows
- 目标：采集长者人生经历并整理成完整故事
- 步骤 1：热身闲聊，建立信任
- 步骤 2：聚焦时间段（如"1960-1980年工厂岁月"）
- 步骤 3：从具体事件切入（"第一次上班是什么感觉？"）
- 步骤 4：引导细节（人物、场景、对话、感受）
- 步骤 5：阶段性回顾总结
- 步骤 6：整理成叙事文稿
- 预期结果：一份完整、真实、有温度的人生故事
```

**后续迭代**：
```
优化需求：增加语音朗读提示，标注哪些地方该停顿、加重语气
```

---

### 5.2 案例二：民族团结内容生成

**场景**：为民族文化节设计 AI 内容生成 prompt

**输入**：
```
帮我写个 prompt 让 AI 生成介绍中国各民族传统节日的内容，
要体现各民族文化特色，同时强调民族团结
```

**输出特点**：
- 使用 56 个民族标准名称
- 各民族文化贡献均衡描述
- 避免刻板印象
- 强调"多元一体"理念

---

### 5.3 案例三：适老化产品prompt设计

**场景**：为老年人健康助手设计交互 prompt

**输入**：
```
我想做一个健康助手，帮老年人提醒吃药、测量血压，
界面要特别适合 70 岁以上老人使用
```

**输出特点**：
- 明确大字体要求（≥18px）
- 操作步骤限制（≤3 次点击）
- 语音辅助说明
- 紧急联系人提示

---

## 6. 技术架构

### 6.1 整体架构

```
┌─────────────────────────────────────────────────────┐
│                    前端 (Vue 3)                      │
│  ┌──────────┐  ┌──────────┐  ┌──────────┐         │
│  │ UI 组件  │  │ 状态管理 │  │ 国际化   │         │
│  └──────────┘  └──────────┘  └──────────┘         │
└─────────────────────────────────────────────────────┘
                          │
                          ▼
┌─────────────────────────────────────────────────────┐
│                   Core 层                            │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────┐  │
│  │ PromptService│  │ TemplateMgr  │  │ModelMgr  │  │
│  └──────────────┘  └──────────────┘  └──────────┘  │
│  ┌──────────────┐  ┌──────────────┐                │
│  │ LLMService   │  │ HistoryMgr   │                │
│  └──────────────┘  └──────────────┘                │
└─────────────────────────────────────────────────────┘
                          │
                          ▼
┌─────────────────────────────────────────────────────┐
│                 后端服务 (无)                         │
│              纯前端架构，直接调 LLM API              │
└─────────────────────────────────────────────────────┘
                          │
                          ▼
┌─────────────────────────────────────────────────────┐
│                   LLM API                            │
│  ┌──────────┐  ┌──────────┐  ┌──────────┐        │
│  │ DeepSeek │  │ OpenAI   │  │ Ollama   │        │
│  │ Gemini   │  │ Silicon  │  │  本地    │        │
│  └──────────┘  └──────────┘  └──────────┘        │
└─────────────────────────────────────────────────────┘
                          │
                          ▼
┌─────────────────────────────────────────────────────┐
│                 浏览器本地存储                       │
│  ┌──────────────┐  ┌──────────────┐                │
│  │ localStorage │  │ API Keys     │                │
│  └──────────────┘  └──────────────┘                │
└─────────────────────────────────────────────────────┘
```

### 6.2 核心模块说明

| 模块 | 文件 | 职责 |
|------|------|------|
| **PromptService** | `src/prompt_service.ts` | 核心优化逻辑：optimize / iterate / test |
| **TemplateManager** | 内置模板 | 管理所有内置模板，支持自定义 |
| **ModelManager** | `src/model_defaults.ts` | 管理 LLM 模型配置和密钥 |
| **LLMService** | 外部依赖 | 封装 OpenAI / Gemini SDK |
| **HistoryManager** | 外部依赖 | 管理历史记录（localStorage） |

### 6.3 数据流

```
用户输入 → PromptService → TemplateManager → LLMService → LLM API
                                              ↓
                                          HistoryManager
                                              ↓
                                           localStorage
```

---

## 7. 配置说明

### 7.1 API 密钥配置

#### DeepSeek（推荐国内用户）

1. 访问 https://platform.deepseek.com
2. 注册账号并实名认证
3. 进入"API Keys"页面
4. 创建新密钥，复制保存

**Docker 配置**：
```bash
docker run -d -p 8080:8080 \
  -e DEEPSEEK_API_KEY="sk-xxxxxxxxxxxx" \
  --name prompt-opt leoezekiel/prompt-optimizer-zh
```

**本地开发配置**：
```bash
# 复制 .env.example 为 .env
cp .env.example .env

# 编辑 .env 文件
echo "VITE_DEEPSEEK_API_KEY=sk-xxxxxxxxxxxx" > .env
```

---

#### Ollama 本地部署

**优势**：免费、离线、隐私安全

**安装步骤**：
```bash
# 1. 安装 Ollama（Linux/macOS）
curl -fsSL https://ollama.ai/install.sh | sh

# Windows: 下载 https://ollama.ai/download

# 2. 拉取模型
ollama pull deepseek-coder:6.7b

# 3. 设置 CORS（允许浏览器访问）
export OLLAMA_ORIGINS="*"

# 4. 启动服务
ollama serve

# 5. 验证
curl http://localhost:11434/api/tags
```

**项目配置**：
```bash
OLLAMA_BASE_URL=http://localhost:11434
OLLAMA_MODEL=deepseek-coder:6.7b
```

---

#### OpenAI

**注意**：需要梯子访问

```bash
OPENAI_API_KEY=sk-xxxxxxxxxxxx
```

---

### 7.2 环境变量说明

| 变量名 | 说明 | 必填 | 示例 |
|--------|------|------|------|
| `DEEPSEEK_API_KEY` | DeepSeek API Key | 否 | sk-xxxxxxxxxxxx |
| `OPENAI_API_KEY` | OpenAI API Key | 否 | sk-xxxxxxxxxxxx |
| `GEMINI_API_KEY` | Google Gemini API Key | 否 | AIzaxxxxxxxxxxxx |
| `SILICONFLOW_API_KEY` | SiliconFlow API Key | 否 | sk-xxxxxxxxxxxx |
| `CUSTOM_API_KEY` | 自定义 API Key | 否 | sk-xxxxxxxxxxxx |
| `CUSTOM_API_BASE_URL` | 自定义 API Base URL | 否 | https://api.example.com/v1 |
| `CUSTOM_API_MODEL` | 自定义模型名称 | 否 | model-name |
| `OLLAMA_BASE_URL` | Ollama 地址 | 否 | http://localhost:11434 |
| `OLLAMA_MODEL` | Ollama 模型 | 否 | deepseek-coder:6.7b |

---

## 8. 常见问题

### 8.1 基础问题

**Q1: 这个项目是免费的吗？**

A: 项目本身免费开源，但使用 LLM API 需要付费：
- DeepSeek：约 1 元/万次优化
- Ollama 本地：完全免费
- OpenAI：约 50 元/万次优化

---

**Q2: 数据安全吗？**

A: 非常安全。
- API Key 存储在浏览器 localStorage（本地加密）
- 所有数据不出你的机器
- 没有后端服务器中转

---

**Q3: 可以离线使用吗？**

A: 可以，使用 Ollama 本地部署即可完全离线运行。

---

### 8.2 使用问题

**Q4: 为什么优化结果有时候不够好？**

A: 优化质量取决于：
1. **输入清晰度**：描述越具体，输出越好
2. **模板匹配**：复杂任务用"深度思考版"效果更好
3. **模型能力**：GPT-4 > DeepSeek-V3 > 本地模型

**解决方案**：
```
第一次：用 general-optimize 生成初稿
第二次：用 iterate 针对不满意的地方定向改进
第三次：继续迭代直到满意
```

---

**Q5: 如何添加自定义模板？**

编辑 `src/template_defaults.ts`：

```typescript
'my-template': {
  id: 'my-template',
  name: '我的模板',
  content: `你是一个专业的AI提示词优化专家...`,
  metadata: {
    version: '1.0.0',
    description: '针对特定场景的自定义模板'
  },
  isBuiltin: true
}
```

---

**Q6: 如何添加新模型？**

编辑 `src/model_defaults.ts`：

```typescript
'my-model': {
  name: '我的模型',
  baseURL: 'https://api.example.com/v1',
  models: ['model-name'],
  defaultModel: 'model-name',
  apiKey: getEnvVar('VITE_MY_API_KEY'),
  enabled: true,
  provider: 'openai'  // 或 'gemini'
}
```

---

### 8.3 技术问题

**Q7: Docker 部署后无法访问？**

检查端口是否被占用：
```bash
# Linux/Mac
lsof -i :8080

# Windows
netstat -ano | findstr :8080
```

更换端口：
```bash
docker run -d -p 9090:8080 ...
```

---

**Q8: 浏览器控制台报错 CORS？**

**方案一：Ollama 设置 CORS**
```bash
export OLLAMA_ORIGINS="*"
ollama serve
```

**方案二：配置代理**
在项目根目录创建 `vite.config.ts`：
```typescript
export default {
  server: {
    proxy: {
      '/api': 'http://localhost:11434'
    }
  }
}
```

---

**Q9: 如何导出历史记录？**

在浏览器开发者工具中运行：
```javascript
const records = JSON.parse(localStorage.getItem('prompt_history') || '[]');
const blob = new Blob([JSON.stringify(records, null, 2)], { type: 'application/json' });
const url = URL.createObjectURL(blob);
const a = document.createElement('a');
a.href = url;
a.download = 'prompt-history.json';
a.click();
```

---

## 9. 二次开发指南

### 9.1 添加自定义模板

**步骤**：
1. 打开 `src/template_defaults.ts`
2. 在 `DEFAULT_TEMPLATES` 对象中添加新条目
3. 重启开发服务器

**模板结构**：
```typescript
'my-template': {
  id: 'my-template',           // 唯一标识
  name: '我的模板',             // 显示名称
  content: `模板内容...`,       // 模板正文
  metadata: {
    version: '1.0.0',          // 版本号
    lastModified: Date.now(),  // 最后修改时间
    author: 'YourName',        // 作者
    description: '模板描述',    // 描述
    templateType: 'optimize'   // 类型：optimize / iterate
  },
  isBuiltin: true              // 是否为内置模板
}
```

---

### 9.2 添加新模型

**步骤**：
1. 打开 `src/model_defaults.ts`
2. 在 `defaultModels` 对象中添加新配置
3. 添加对应环境变量
4. 重启开发服务器

**模型配置结构**：
```typescript
'my-model': {
  name: '我的模型',
  baseURL: 'https://api.example.com/v1',
  models: ['model-name-1', 'model-name-2'],
  defaultModel: 'model-name-1',
  apiKey: getEnvVar('VITE_MY_API_KEY'),
  enabled: true,
  provider: 'openai'  // 或 'gemini'
}
```

---

### 9.3 项目构建

```bash
# 安装依赖
npm install

# 开发模式
npm run dev

# 生产构建
npm run build

# 预览构建结果
npm run preview
```

---

## 10. 项目路线图

### 已完成
- [x] 基础优化功能
- [x] 多轮迭代功能
- [x] 多模型支持
- [x] 适老化模板
- [x] 民族团结模板
- [x] 全中文文档
- [x] Docker 部署支持
- [x] 一键部署脚本

### 计划中
- [ ] 批量优化功能
- [ ] Prompt 版本管理
- [ ] 导出为 Markdown/PDF
- [ ] 移动端适配
- [ ] 多语言支持（简繁中文、英文）
- [ ] Prompt 分享功能
- [ ] 社区模板市场

---

## 📄 许可证

MIT License

---

## 🙏 致谢

- 原项目：[linshenkx/prompt-optimizer](https://github.com/linshenkx/prompt-optimizer)
- DeepSeek AI：提供高性能中文 LLM API
- 所有贡献者

---

**更新时间**：2026-09-21
**项目地址**：https://github.com/LeoEzekiel/prompt-optimizer-zh
