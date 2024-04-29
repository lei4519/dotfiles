#!/bin/zsh
# export https_proxy=http://127.0.0.1:8118
# export http_proxy=http://127.0.0.1:8118
# export all_proxy=socks5://127.0.0.1:8119


# 函数：设置 http_proxy 变量
set_http_proxy() {
  if [[ $os == "Darwin" ]]; then
    export https_proxy=http://127.0.0.1:8118
    export http_proxy=http://127.0.0.1:8118
  elif [[ $os == "Linux" ]]; then
    export https_proxy=http://127.0.0.1:7890
    export http_proxy=http://127.0.0.1:7890
  fi

  show_http_proxy
}

set_http_proxy

# 函数：取消设置 http_proxy 变量
unset_http_proxy() {
    unset http_proxy
    unset https_proxy
    show_http_proxy
}

# 函数：显示当前 http_proxy 变量
show_http_proxy() {
    echo "http_proxy=$http_proxy"
    echo "https_proxy=$https_proxy"
}

http_proxy() {
    show_http_proxy

    # 主菜单
    PS3="[HTTP PROXY] please choose: "

    # 创建一个菜单
    select option in "set" "unset" "quit"
    do
        case $option in
            "set")
                set_http_proxy
                break
                ;;
            "unset")
                unset_http_proxy
                break
                ;;
            "quit")
                echo "quit!"
                break
                ;;
            *) echo "Invalid option $REPLY";;
        esac
    done
}

alias hp=http_proxy
