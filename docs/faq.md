# 常见问答（FAQ）

## 基础问题

### Q1: 这个项目是什么？

A: 这是一个 AI Prompt 优化工具，帮助你把口语化的需求描述转化为结构清晰的专业 prompt。

**原理**：
```
用户输入（口语化）→ 模板加工 → LLM 生成 → 结构化专业 prompt
```

### Q2: 需要付费吗？

A: 项目本身免费开源，但需要你自己的 LLM API 密钥：

| 方案 | 费用 | 推荐度 |
|------|------|--------|
| DeepSeek API | 约 1 元/万次优化 | ⭐⭐⭐⭐⭐ 推荐国内使用 |
| Ollama 本地 | 免费 | ⭐⭐⭐⭐ 适合隐私敏感场景 |
| OpenAI API | 约 50 元/万次优化 | ⭐⭐⭐ 需要梯子 |

### Q3: 数据安全吗？

A: 非常安全。
- API 密钥存储在浏览器 localStorage（本地加密）
- 所有数据不出你的机器
- 没有任何数据上传到第三方服务器

---

## 使用问题

### Q4: 为什么优化结果有时候不够好？

**可能原因**：
1. **输入太模糊**：描述越具体，输出越好
2. **模板不匹配**：复杂任务用"通用优化"效果有限，换"深度思考版"
3. **模型能力**：DeepSeek-V3 > GPT-3.5，GPT-4 最好

**解决方案**：
```
第一次：用 general-optimize 生成初稿
第二次：用 iterate 针对不满意的地方定向改进
第三次：多次迭代直到满意
```

### Q5: 可以离线使用吗？

A: 可以，使用 Ollama 本地部署：
```bash
# 安装 Ollama
curl -fsSL https://ollama.ai/install.sh | sh

# 拉取模型
ollama pull deepseek-coder:6.7b

# 设置 CORS
export OLLAMA_ORIGINS="*"

# 启动
ollama serve
```
然后在项目中配置：
```bash
OLLAMA_BASE_URL=http://localhost:11434
OLLAMA_MODEL=deepseek-coder:6.7b
```

### Q6: 支持哪些模型？

| 模型 | 提供商 | 特点 |
|------|--------|------|
| DeepSeek-V3 | 深智算 | 中文最强，性价比高 |
| GPT-4 | OpenAI | 综合能力最强 |
| GPT-3.5 | OpenAI | 速度快，成本低 |
| Gemini-2.0 | Google | 多语言支持 |
| Ollama 本地 | 本地 | 隐私安全，离线可用 |

### Q7: 如何切换模型？

**方法一：界面配置**
1. 点击右上角 ⚙️ 设置
2. 选择"模型管理"
3. 点击要配置的模型
4. 填入 API Key
5. 保存

**方法二：环境变量**
```bash
# Docker 运行
docker run -e DEEPSEEK_API_KEY=sk-xxx leoezekiel/prompt-optimizer-zh
```

---

## 技术问题

### Q8: 如何添加自定义模板？

编辑 `src/template_defaults.ts`：

```typescript
'my-template': {
  id: 'my-template',
  name: '我的模板',
  content: `你是一个专业的...`,
  metadata: {
    version: '1.0.0',
    description: '针对特定场景'
  },
  isBuiltin: true
}
```

### Q9: 如何添加新模型？

编辑 `src/model_defaults.ts`：

```typescript
new-model: {
  name: '新模型',
  baseURL: 'https://api.example.com/v1',
  models: ['model-name'],
  defaultModel: 'model-name',
  apiKey: getEnvVar('VITE_NEW_API_KEY'),
  enabled: true,
  provider: 'openai'  // 或 'gemini'
}
```

### Q10: Docker 部署后无法访问？

**检查端口映射**：
```bash
# 确认 8080 端口未被占用
netstat -tlnp | grep 8080

# 重新运行
docker run -d -p 8080:8080 leoezekiel/prompt-optimizer-zh
```

**检查防火墙**：
```bash
# Ubuntu
sudo ufw allow 8080/tcp

# Windows
netsh advfirewall firewall add rule name="PromptOptimizer" dir=in action=allow protocol=tcp localport=8080
```

### Q11: 浏览器控制台报错 "CORS policy"？

这是跨域问题。解决方案：

**方案一：配置代理**
在项目根目录创建 `vite.config.ts`：
```typescript
export default {
  server: {
    proxy: {
      '/api': 'http://localhost:11434'  // Ollama 地址
    }
  }
}
```

**方案二：Ollama 设置 CORS**
```bash
export OLLAMA_ORIGINS="*"
ollama serve
```

---

## 高级问题

### Q12: 如何批量优化 prompt？

目前版本不支持批量，但可以脚本实现：

```bash
# 准备 prompt 列表
cat prompts.txt | while read prompt; do
  curl -X POST http://localhost:8080/api/optimize \
    -H "Content-Type: application/json" \
    -d "{\"prompt\": \"$prompt\", \"template\": \"general-optimize\"}"
done
```

### Q13: 如何导出历史记录？

在浏览器开发者工具中运行：
```javascript
// 导出所有记录
const records = JSON.parse(localStorage.getItem('prompt_history') || '[]');
const blob = new Blob([JSON.stringify(records, null, 2)], { type: 'application/json' });
const url = URL.createObjectURL(blob);
const a = document.createElement('a');
a.href = url;
a.download = 'prompt-history.json';
a.click();
```

### Q14: 如何备份和恢复配置？

**备份**：
```bash
# Docker
docker exec prompt-opt cat /app/.env > backup.env

# 本地
cp .env.backup .env
```

**恢复**：
```bash
# Docker
docker cp backup.env prompt-opt:/app/.env
docker restart prompt-opt
```

---

## 贡献问题

### Q15: 如何参与开发？

1. Fork 本仓库
2. 创建分支：`git checkout -b feature/xxx`
3. 提交修改：`git commit -m "feat: 添加xxx"`
4. 推送：`git push origin feature/xxx`
5. 提交 Pull Request

### Q16: 遇到 Bug 怎么办？

1. 先检查是否最新版本
2. 查看 Issue 是否已有人提
3. 新建 Issue，附上：
   - 系统信息（OS、浏览器）
   - 复现步骤
   - 错误截图
   - 控制台日志

---

## 快速命令参考

```bash
# Docker 运行
docker run -d -p 8080:8080 \
  -e DEEPSEEK_API_KEY="sk-xxx" \
  --name prompt-opt leoezekiel/prompt-optimizer-zh

# 查看日志
docker logs -f prompt-opt

# 停止
docker stop prompt-opt

# 删除
docker rm prompt-opt

# 重启服务
docker restart prompt-opt
```

---

更新时间：2026-09-21
