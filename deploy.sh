#!/bin/bash
# Prompt Optimizer 快速部署脚本
# 使用前请确保已安装 Docker

set -e

echo "========================================"
echo "  AI Prompt Optimizer · 中文增强版"
echo "  快速部署脚本"
echo "========================================"
echo ""

# 检查 Docker
if ! command -v docker &> /dev/null; then
    echo "❌ 错误：未检测到 Docker，请先安装 Docker"
    echo "   下载地址：https://www.docker.com/products/docker-desktop/"
    exit 1
fi

echo "✅ Docker 已安装"

# 配置选项
echo ""
echo "请选择部署方式："
echo "1. DeepSeek API（推荐国内用户）"
echo "2. Ollama 本地部署（免费、离线）"
echo "3. OpenAI API（需梯子）"
read -p "请输入选项 (1-3): " choice

case $choice in
    1)
        read -p "请输入 DeepSeek API Key: " API_KEY
        CONTAINER_NAME="prompt-opt"
        DOCKER_RUN="docker run -d -p 8080:8080 \
            -e DEEPSEEK_API_KEY=\"$API_KEY\" \
            --name $CONTAINER_NAME \
            leoezekiel/prompt-optimizer-zh"
        ;;
    2)
        read -p "请输入 Ollama 地址 (默认 http://localhost:11434): " OLLAMA_URL
        OLLAMA_URL="${OLLAMA_URL:-http://localhost:11434}"
        read -p "请输入模型名称 (默认 deepseek-coder:6.7b): " MODEL
        MODEL="${MODEL:-deepseek-coder:6.7b}"
        
        # 检查 Ollama 是否运行
        if ! curl -s "$OLLAMA_URL/api/tags" &> /dev/null; then
            echo "❌ 无法连接到 Ollama，请先启动 Ollama 服务"
            echo "   启动命令：ollama serve"
            exit 1
        fi
        
        CONTAINER_NAME="prompt-opt"
        DOCKER_RUN="docker run -d -p 8080:8080 \
            -e OLLAMA_BASE_URL=\"$OLLAMA_URL\" \
            -e OLLAMA_MODEL=\"$MODEL\" \
            --name $CONTAINER_NAME \
            leoezekiel/prompt-optimizer-zh"
        ;;
    3)
        read -p "请输入 OpenAI API Key: " API_KEY
        CONTAINER_NAME="prompt-opt"
        DOCKER_RUN="docker run -d -p 8080:8080 \
            -e OPENAI_API_KEY=\"$API_KEY\" \
            --name $CONTAINER_NAME \
            leoezekiel/prompt-optimizer-zh"
        ;;
    *)
        echo "❌ 无效选项"
        exit 1
        ;;
esac

echo ""
echo "🚀 正在启动容器..."
eval $DOCKER_RUN

echo ""
echo "✅ 部署成功！"
echo ""
echo "📍 访问地址：http://localhost:8080"
echo ""
echo "常用命令："
echo "  查看日志：  docker logs -f $CONTAINER_NAME"
echo "  停止服务：  docker stop $CONTAINER_NAME"
echo "  删除容器：  docker rm $CONTAINER_NAME"
echo "  重启服务：  docker restart $CONTAINER_NAME"
echo ""
echo "========================================"
echo "  详细文档：docs/usage.md"
echo "  模板说明：docs/templates.md"
echo "  常见问题：docs/faq.md"
echo "========================================"
