#!/bin/sh

# 配置文件路径（加MYSCRIPT_前缀）
MYSCRIPT_PROXY_CONFIG_FILE="${MYSCRIPT_PROXY_CONFIG:-$HOME/.config/my_proxy_config.conf}"

# 默认配置（加MYSCRIPT_前缀）
#MYSCRIPT_DEFAULT_PROXY_HOST="127.0.0.1"
#MYSCRIPT_DEFAULT_PROXY_PORT="1087"
#MYSCRIPT_DEFAULT_PROXY_TYPE="socks5"

# 加载配置文件（加myscript_前缀）
myscript_proxy_load_config() {
    if [ ! -f $MYSCRIPT_PROXY_CONFIG_FILE ]; then
        echo "未找到配置文件：$MYSCRIPT_PROXY_CONFIG_FILE"
        return -1
    fi

    local section="$1"
    # 使用awk解析配置文件
    local MYSCRIPT_PROXY_PROTOCOL=$(awk -F'=' -v sec="$section" '! /^#/ && $0 ~ "\\[" sec "\\]" {f=1} f && ! /^#/ && $1 ~ /PROTOCOL/ {gsub("\"","",$2); print $2; exit}' "$MYSCRIPT_PROXY_CONFIG_FILE")
    local MYSCRIPT_PROXY_HOST=$(awk -F'=' -v sec="$section" '! /^#/ && $0 ~ "\\[" sec "\\]" {f=1} f && ! /^#/ && $1 ~ /HOST/ {gsub("\"","",$2); print $2; exit}' "$MYSCRIPT_PROXY_CONFIG_FILE")
    local MYSCRIPT_PROXY_PORT=$(awk -F'=' -v sec="$section" '! /^#/ && $0 ~ "\\[" sec "\\]" {f=1} f && ! /^#/ && $1 ~ /PORT/ {gsub("\"","",$2); print $2; exit}' "$MYSCRIPT_PROXY_CONFIG_FILE")
    local MYSCRIPT_PROXY_USERNAME=$(awk -F'=' -v sec="$section" '! /^#/ && $0 ~ "\\[" sec "\\]" {f=1} f && ! /^#/ && $1 ~ /USERNAME/ {gsub("\"","",$2); print $2; exit}' "$MYSCRIPT_PROXY_CONFIG_FILE")
    local MYSCRIPT_PROXY_PASSWORD=$(awk -F'=' -v sec="$section" '! /^#/ && $0 ~ "\\[" sec "\\]" {f=1} f && ! /^#/ && $1 ~ /PASSWORD/ {gsub("\"","",$2); print $2; exit}' "$MYSCRIPT_PROXY_CONFIG_FILE")
    
    # 生成代理URL（含认证）
    if [[ -n "$MYSCRIPT_PROXY_USERNAME" && -n "$MYSCRIPT_PROXY_PASSWORD" ]]; then
        #echo "${section,,}://${MYSCRIPT_PROXY_USERNAME}:${MYSCRIPT_PROXY_PASSWORD}@${MYSCRIPT_PROXY_HOST}:${MYSCRIPT_PROXY_PORT}"
        echo "${MYSCRIPT_PROXY_PROTOCOL,,}://${MYSCRIPT_PROXY_USERNAME}:${MYSCRIPT_PROXY_PASSWORD}@${MYSCRIPT_PROXY_HOST}:${MYSCRIPT_PROXY_PORT}"
    else
        #echo "${section,,}://${MYSCRIPT_PROXY_HOST}:${MYSCRIPT_PROXY_PORT}"
        echo "${MYSCRIPT_PROXY_PROTOCOL,,}://${MYSCRIPT_PROXY_HOST}:${MYSCRIPT_PROXY_PORT}"
    fi
}

# 启用代理（加myscript_前缀）
myscript_proxy_on() {
    if [ ! -f $MYSCRIPT_PROXY_CONFIG_FILE ]; then
        echo "未找到配置文件：$MYSCRIPT_PROXY_CONFIG_FILE"
        return -1
    fi

    local proxy_type="${1:-all}"
    
    case "$proxy_type" in
        socks5|SOCKS5)
            export all_proxy=$(myscript_proxy_load_config "SOCKS5")
            echo "✅ SOCKS5代理已启用: $all_proxy" ;;
        http|HTTP)
            export http_proxy=$(myscript_proxy_load_config "HTTP")
            echo "✅ HTTP代理已启用: $http_proxy" ;;
        https|HTTPS)
            export https_proxy=$(myscript_proxy_load_config "HTTPS")
            echo "✅ HTTPS代理已启用: $https_proxy" ;;
        all|ALL)
            export all_proxy=$(myscript_proxy_load_config "SOCKS5")
            export http_proxy=$(myscript_proxy_load_config "HTTP")
            export https_proxy=$(myscript_proxy_load_config "HTTPS")
            echo "✅ 全协议代理已启用" ;;
        *)
            echo "❌ 无效代理类型！支持：socks5/http/https/all" >&2
            return 1 ;;
    esac
}

# 关闭代理（加myscript_前缀）
#myscript_proxy_off() {
#    unset ALL_PROXY http_proxy https_proxy
#    echo "⛔ 代理已关闭"
#}

# 关闭代理函数（支持按类型关闭）
myscript_proxy_off() {
    local target="${1:-all}"  # 默认关闭所有代理

    case "$target" in
        http|HTTP)
            unset http_proxy
            echo "⛔ HTTP代理已关闭" ;;
        https|HTTPS)
            unset https_proxy
            echo "⛔ HTTPS代理已关闭" ;;
        socks5|SOCKS5)
            unset all_proxy
            echo "⛔ SOCKS5代理已关闭" ;;
        all|ALL)
            unset http_proxy https_proxy all_proxy
            echo "⛔ 所有代理已关闭" ;;
        *)
            echo "❌ 无效参数！支持：http/https/socks5/all"
            return 1 ;;
    esac
}

myscript_proxy_show() {
    echo "all_proxy: $all_proxy"
    echo "http_proxy: $http_proxy"
    echo "https_proxy: $https_proxy"
    echo "配置文件位置: $MYSCRIPT_PROXY_CONFIG_FILE"
    if [ -f $MYSCRIPT_PROXY_CONFIG_FILE ]; then
        while read line
        do
            echo $line
        done < $MYSCRIPT_PROXY_CONFIG_FILE
    else
        echo "配置文件未找到"
    fi
}

# 生成配置文件（加myscript_前缀）
myscript_proxy_gen_config() {
if [ -f $MYSCRIPT_PROXY_CONFIG_FILE ]; then
    echo "配置文件已存在：$MYSCRIPT_PROXY_CONFIG_FILE"
    return -1
fi

    cat > "$MYSCRIPT_PROXY_CONFIG_FILE" <<EOF
[SOCKS5]
PROTOCOL="socks5"
HOST="127.0.0.1"
PORT="1080"
USERNAME=""
PASSWORD=""

[HTTP]
PROTOCOL="http"
HOST="127.0.0.1"
PORT="8080"
USERNAME=""
PASSWORD=""

[HTTPS]
PROTOCOL="https"
HOST="127.0.0.1"
PORT="8443"
USERNAME=""
PASSWORD=""
EOF
    echo "📄 配置文件已生成: $MYSCRIPT_PROXY_CONFIG_FILE"
}

# 帮助信息（加myscript_前缀）
myscript_proxy_help() {
    echo "Usage:"
    echo "  myscript_proxy_on [类型]            启用代理（类型: socks5/http/https/all）默认all"
    echo "  myscript_proxy_off [类型]           关闭代理（类型: socks5/http/https/all）默认all"
    echo "  myscript_proxy_gen_config           生成配置文件模板"
    echo "  myscript_proxy_show                 显示当前代理信息"
    echo ""
    echo "配置文件路径: $MYSCRIPT_PROXY_CONFIG_FILE"
}
