# 项目说明 — 精简版

> 详细文档请查看 [README-COMPLETE.md](./README-COMPLETE.md)

## 这个项目能做什么？

**一句话**：帮你把"脑子里的想法"变成"AI 能精准执行的专业指令"

## 核心功能

| 功能 | 说明 |
|------|------|
| 智能优化 | 输入口语化需求 → 生成结构化专业 prompt |
| 多轮迭代 | 在已有基础上定向改进，不断打磨 |
| 多模型支持 | DeepSeek / OpenAI / Gemini / Ollama |
| 格式控制 | 输出 JSON / XML / Markdown |
| 隐私保护 | 本地存储，零数据外传 |

## 特色模板

### 1. 适老化模板 (`elderly-friendly`)
专为老年人产品设计优化：
- 大字体、高对比度要求
- 操作步骤限制（≤3 次点击）
- 语音辅助支持

### 2. 民族团结模板 (`ethnic-unity`)
多民族内容生成规范：
- 使用 56 个民族标准名称
- 避免刻板印象
- 均衡呈现各民族文化

## 使用流程

```
输入需求 → 选择模板 → 生成优化 → 迭代改进 → 复制使用
```

## 快速开始

### Docker（推荐）
```bash
docker run -d -p 8080:8080 \
  -e DEEPSEEK_API_KEY="sk-你的密钥" \
  --name prompt-opt leoezekiel/prompt-optimizer-zh
```

### 本地开发
```bash
git clone https://github.com/LeoEzekiel/prompt-optimizer-zh.git
cd prompt-optimizer-zh
npm install
npm run dev
```

## 项目地址

https://github.com/LeoEzekiel/prompt-optimizer-zh
