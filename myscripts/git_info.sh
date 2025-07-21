#!/bin/sh

# MYSCRIPT 颜色定义
MYSCRIPT_COLOR_RESET="\033[0m"
MYSCRIPT_COLOR_RED="\033[0;31m"
MYSCRIPT_COLOR_GREEN="\033[0;32m"
MYSCRIPT_COLOR_YELLOW="\033[0;33m"
MYSCRIPT_COLOR_BLUE="\033[0;34m"
MYSCRIPT_COLOR_PURPLE="\033[0;35m"
MYSCRIPT_COLOR_CYAN="\033[0;36m"
MYSCRIPT_COLOR_WHITE="\033[0;37m"

# myscript 检查是否在git仓库中
myscript_is_in_git_repo() {
    git rev-parse --is-inside-work-tree &>/dev/null
}

# myscript 检测当前目录是否是git仓库并显示状态
myscript_check_git_repo() {
    if myscript_is_in_git_repo; then
        echo -e "${MYSCRIPT_COLOR_GREEN}当前目录是Git仓库${MYSCRIPT_COLOR_RESET}"
    else
        echo -e "${MYSCRIPT_COLOR_RED}当前目录不是Git仓库${MYSCRIPT_COLOR_RESET}"
    fi
}

# myscript 获取Git分支信息
myscript_get_git_branch() {
    if ! myscript_is_in_git_repo; then
        return
    fi
    
    local branch=$(git symbolic-ref --short HEAD 2>/dev/null || git rev-parse --short HEAD 2>/dev/null)
    if [ -n "$branch" ]; then
        echo -e "${MYSCRIPT_COLOR_CYAN}[$branch]${MYSCRIPT_COLOR_RESET}"
    fi
}

# myscript 获取Git状态信息
myscript_get_git_status() {
    if ! myscript_is_in_git_repo; then
        return
    fi
    
    local status=$(git status --porcelain 2>/dev/null)
    local output=""
    
    # 检查是否有未提交到本地仓库的修改
    if ! git diff --quiet 2>/dev/null; then
        output+="${MYSCRIPT_COLOR_RED}*${MYSCRIPT_COLOR_RESET}"  # 有未提交的修改
    fi
    
    # 检查是否有已暂存的修改
    if ! git diff --cached --quiet 2>/dev/null; then
        output+="${MYSCRIPT_COLOR_GREEN}+${MYSCRIPT_COLOR_RESET}"  # 有已暂存的修改
    fi
    
    # 检查是否有未跟踪的文件
    if echo "$status" | grep -q '^??'; then
        output+="${MYSCRIPT_COLOR_YELLOW}?${MYSCRIPT_COLOR_RESET}"  # 有未跟踪的文件
    fi
    
    # 检查是否有冲突
    if echo "$status" | grep -q '^U'; then
        output+="${MYSCRIPT_COLOR_RED}!${MYSCRIPT_COLOR_RESET}"  # 有冲突
    fi
    
    # 检查本地与远程仓库的差异
    if git rev-parse --abbrev-ref @'{u}' 2>/dev/null >/dev/null; then
        local commits_ahead=$(git rev-list --count @'{u}..HEAD' 2>/dev/null)
        local commits_behind=$(git rev-list --count 'HEAD..@{u}' 2>/dev/null)
        
        if [ "$commits_ahead" -gt 0 ]; then
            output+="${MYSCRIPT_COLOR_GREEN}↑$commits_ahead${MYSCRIPT_COLOR_RESET}"  # 有提交待推送
        fi
        
        if [ "$commits_behind" -gt 0 ]; then
            output+="${MYSCRIPT_COLOR_RED}↓$commits_behind${MYSCRIPT_COLOR_RESET}"  # 有提交待拉取
        fi
    fi
    
    # 检查是否在rebase、merge等特殊状态
    if [ -d "$(git rev-parse --git-dir 2>/dev/null)/rebase-merge" ] || [ -d "$(git rev-parse --git-dir 2>/dev/null)/rebase-apply" ]; then
        output+="${MYSCRIPT_COLOR_PURPLE}|REBASE${MYSCRIPT_COLOR_RESET}"
    elif [ -f "$(git rev-parse --git-dir 2>/dev/null)/MERGE_HEAD" ]; then
        output+="${MYSCRIPT_COLOR_PURPLE}|MERGE${MYSCRIPT_COLOR_RESET}"
    elif [ -f "$(git rev-parse --git-dir 2>/dev/null)/CHERRY_PICK_HEAD" ]; then
        output+="${MYSCRIPT_COLOR_PURPLE}|CHERRY-PICK${MYSCRIPT_COLOR_RESET}"
    elif [ -f "$(git rev-parse --git-dir 2>/dev/null)/REVERT_HEAD" ]; then
        output+="${MYSCRIPT_COLOR_PURPLE}|REVERT${MYSCRIPT_COLOR_RESET}"
    elif [ -f "$(git rev-parse --git-dir 2>/dev/null)/BISECT_LOG" ]; then
        output+="${MYSCRIPT_COLOR_PURPLE}|BISECT${MYSCRIPT_COLOR_RESET}"
    fi
    
    if [ -n "$output" ]; then
        echo -e " $output"
    fi
}

# myscript 组合显示Git信息
myscript_show_git_info() {
    if ! myscript_is_in_git_repo; then
        return
    fi
    
    local branch=$(myscript_get_git_branch)
    if [ -n "$branch" ]; then
        local status=$(myscript_get_git_status)
        echo -e "$branch$status"
    fi
}

# myscript 设置PS1变量以显示Git信息
myscript_set_git_prompt() {
    if ! myscript_is_in_git_repo; then
        return
    fi
    
    local git_info=$(myscript_show_git_info)
    if [ -n "$git_info" ]; then
        echo -e "$git_info"
    fi
}

# 添加命令别名，方便快速检查
#alias isgit='myscript_check_git_repo'

# 自定义PS1，添加Git信息
#export PS1="\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$(myscript_set_git_prompt)\$ " 
#export PS1="\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$(myscript_set_git_prompt)\n\$ " 
# 换行且带unicode连接符
# └─▶
# └─•
# ╰─•
# └─┤
# ╰─╼
export PS1="\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$(myscript_set_git_prompt)\n╰─╼\$ " 
