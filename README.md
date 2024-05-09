# dotfiles

## Clone

```sh
# 必须放在 ~/dotfiles，保证下面软连接的命令路径正确
git clone git@github.com:lei4519/dotfiles.git ~/dotfiles
```

> Tips
> 使用 yazi 可以快速批量的进行软连接操作 - 使用空格进行多选，使用 `y` 复制，使用 `-` 进行软连接

具体的安装命令根据自己的包管理工具去装，比如 arch linux 使用 `yay or pacman`

## 通用

### Terminal

三选一

#### Wezterm

功能齐全，支持图片查看，支持字体 ligature，跨平台 windows 可用

```sh
brew install wezterm
rm -rf ~/.config/wezterm && ln -s ~/dotfiles/terminal/wezterm ~/.config/wezterm
```

#### Kitty

同上但是不支持 windows

```sh
brew install kitty
rm -rf ~/.config/kitty && ln -s ~/dotfiles/terminal/kitty ~/.config/kitty
```

##### Kitty 图片查看

```sh
brew install imagemagick
brew install ghostscript
```

#### Alacritty

快。但是不支持图片查看，且功能很少（主打一个简洁

```sh
brew install --cask alacritty
rm -rf ~/.config/alacritty && ln -s ~/dotfiles/terminal/alacritty ~/.config/alacritty
```

#### ~~Tmux~~

没什么必要，kitty 和 wezterm 都自带，alacritty 可以使用平铺式窗口管理

```sh
brew install tmux
```

tmux 粘贴到系统剪切板

```sh
brew install reattach-to-user-namespace
rm ~/.tmux.conf && ln -s ~/dotfiles/terminal/tmux/.tmux.conf ~/.tmux.conf
rm ~/.tmux.conf.local && ln -s ~/dotfiles/terminal/tmux/.tmux.conf.local ~/.tmux.conf.local
```

### Shell

#### Zsh Config

```sh
rm -rf ~/.zshrc && ln -s ~/dotfiles/shell/.zshrc ~/.zshrc
```

##### antigen

zsh 包管理器

```sh
curl -L git.io/antigen > $HOME/dotfiles/antigen.zsh
```

#### shell 美化

```sh
brew install starship
# 二选一即可
rm -rf ~/.config/starship.toml && ln -s ~/dotfiles/shell/starship.toml ~/.config/starship.toml
rm -rf ~/.config/starship.toml && ln -s ~/dotfiles/shell/starship_end4.toml ~/.config/starship.toml
```

#### Font

```sh
# 字体试用: https://www.programmingfonts.org/#oxproto

# https://github.com/Homebrew/homebrew-cask-fonts
brew tap homebrew/cask-fonts
# 根据自己的喜好选择其一
brew install --cask fira-code-nerd-font
brew install --cask font-jetbrains-mono
```

#### 快速跳转

```sh
# brew install autojump
brew install zoxide
```

#### Fzf 模糊查找

```sh
brew install fzf
brew install fd
brew install ripgrep
```

#### ~~fig~~

自动完成、提示（最后还是直接用 zsh-auto-completion 了，这个有点卡

```sh
brew install --cask fig
```

#### 漂亮的输出

```sh
# brew install lolcat
brew install bat

# preview markdown
brew install pandoc

# preview json
brew install jq
```

### TUI

#### Lazy Git

```sh
brew install lazygit
# git pager styles, lazygit need
brew install git-delta
brew install tig
# mac
rm -rf ~/Library/Application\ Support/lazygit/config.yml && ln -s ~/dotfiles/git/lazygit/config.yml ~/Library/Application\ Support/lazygit/config.yml
# linux
rm -rf ~/.config/lazygit/config.yml &&  ln -s ~/dotfiles/git/lazygit/config.yml ~/.config/lazygit/config.yml
rm -rf ~/.gitconfig && ln -s ~/dotfiles/git/.gitconfig ~/.gitconfig
rm -rf ~/.gitignore && ln -s ~/dotfiles/.gitignore ~/.gitignore
```

#### [yazi](https://yazi-rs.github.io/docs/installation)

文件管理器，同类的有 `ranger/joshuto`

```sh
# arch linux unar -> unarchiver
brew install yazi ffmpegthumbnailer unar jq poppler fd ripgrep fzf zoxide xclip
```

#### ~~Ranger~~

```sh
pip3 install ranger-fm pynvim

# ranger code highlight
brew install highlight
rm -rf ~/.config/ranger && ln -s ~/dotfiles/terminal/file-manager/ranger ~/.config/ranger
```

#### ~~Joshuto~~

```sh
brew install joshuto
rm -rf ~/.config/joshuto && ln -s ~/dotfiles/terminal/file-manager/joshuto ~/.config/joshuto
```

### 软件

#### Rime 输入法

下载配置文件

```sh
git clone git@github.com:lei4519/rime-ice.git ~/dotfiles/rime --depth 1
```

安装 [plum](https://github.com/rime/plum)

```sh
curl -fsSL https://raw.githubusercontent.com/rime/plum/master/rime-install | bash
```

##### Mac 鼠须管

```sh
brew install --cask squirrel
rm -rf ~/Library/Rime && ln -s ~/dotfiles/rime ~/Library/Rime

# 雾凇拼音
# 安装或更新全部文件
bash rime-install iDvel/rime-ice:others/recipes/full
# 双拼
bash rime-install iDvel/rime-ice:others/recipes/config:schema=flypy

# 主题配色：https://pdog18.github.io/rime-soak/#/result
```

##### Linux 中州韵

我用的是 Fcitx5

参考：

- https://fcitx-im.org/wiki/Using_Fcitx_5_on_Wayland
- https://wiki.archlinux.org/title/Rime
- https://wiki.archlinux.org/title/Fcitx5

```sh
nvim /etc/profile
# 在最后加入
export XMODIFIERS=@im=fcitx
```

```sh
# pacman 会自动安装所需依赖
pacman -S fcitx5-rime fcitx5-config-qt
# 配置输入法
fcitx5-configtool
# fcitx5 开机自启动，我用的是 hypyland 的 exec-once
# 输入法皮肤
pacman -S fcitx5-material-color

# 雾凇拼音
yay -S rime-ice-git

# 配置文件
rm -rf ~/.local/share/fcitx5/rime && ln -s ~/dotfiles/rime ~/.local/share/fcitx5/rime
ln -s ~/dotfiles/linux/fcitx5/conf/classicui.conf ~/.config/fcitx5/conf/classicui.conf

#!/bin/bash
rime_deployer --build ~/.local/share/fcitx5/rime/ /usr/share/rime-data ~/.local/share/fcitx5/rime/build

# 同步
rime_dict_manager --sync
```

##### vim 中英文切换

Mac 可以直接使用 `rime` 的 `vim_mode` 完成中英文切换，非常方便，不需要使用 `im-select` 了

具体参考 `./im/rime/squirrel.custom.yaml`

Linux 可以使用 fcitx5.nvim

##### 三端数据同步

1. iPhone 仓输入法
2. Mac Squirrel
3. ibus-rime

限制在于 iPhone 只能同步到 iCloud，所以要想三端同步，只能靠 Mac 做中转，由 Mac 做集散中心 `iPhone <-> Mac <-> Linux`

1. iPhone 和 Mac 都放在 iCloud 中

iPhone 的 `installation.yaml` 配置

```
installation_id: "iPhone"
# 仓的iOS中iCloud前缀路径固定为：/private/var/mobile/Library/Mobile Documents/iCloud~dev~fuxiao~app~hamsterapp/Documents
sync_dir: "/private/var/mobile/Library/Mobile Documents/iCloud~dev~fuxiao~app~hamsterapp/Documents/sync"
```

Mac 的 `installation.yaml` 配置

```
installation_id: "Mac"
sync_dir: "/Users/lay/Library/Mobile Documents/iCloud~dev~fuxiao~app~hamsterapp/Documents/sync"

```

2. 在 Mac 中将 iCloud 的中的 Mac 文件 **硬链接** 到 git 仓库目录，通过 git 仓库同步至 Linux

```
ln /Users/lay/Library/Mobile Documents/iCloud~dev~fuxiao~app~hamsterapp/Documents/sync/rime_ice.userdb.txt ~/dotfiles/im/Rime/sync/Mac/rime_ice.userdb.txt
```

3. Linux 将同步文件放在 git 仓库中即可

Linux 的 `installation.yaml` 配置

```
installation_id: "Linux"
```

配置好之后，完整的操作步骤如下

1. iPhone 先同步一下：会同步 iPhone 和 Mac 的数据
2. Mac 提交 git 变更
3. Linux 拉取变更，进行同步：会同步 Mac 和 Linux 的数据
4. Linux 提交 git 变更
5. Mac 拉取 git 变更
6. iPhone 再同步一下：会同步 iPhone 和 Linux 的数据

完整操作很复杂，但实际上这些步骤都是分开做的，可能今天同步了 iPhone <-> Mac，明天同步了 Mac <-> Linux，后面再同步 iPhone <-> Mac 的时候顺便就同步 Linux 了

#### 笔记

```sh
brew install --cask obsidian

# 图床上传
brew install picgo --cask
```

## Neovim

```sh
# 清理现有配置
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.cache/nvim

brew install neovim
```

### Lazyvim

最方便的，开箱即用，内置了各种预设配置、lsp 配置，这个是最吸引我的（配置各种 lsp、dap 要搞疯了都

```sh
rm -rf ~/.config/nvim && ln -s ~/dotfiles/nvim/lazy-vim ~/.config/nvim
```

### Neovide

Neovim GUI，丝滑的光标移动

```sh
brew install --cask neovide  # optional rust 编写的 neovim ui
rm -rf ~/.config/neovide && ln -s ~/dotfiles/nvim/neovide ~/.config/neovide
```

### ~~[Lunarvim](https://www.lunarvim.org/)~~

#### Install

```sh
bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)
rm -rf ~/.config/lvim && ln -s ~/dotfiles/nvim/lunar-vim ~/.config/lvim
ln -s ~/.local/bin/lvim /usr/local/bin/lvim
```

#### Uninstall

```sh
bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/uninstall.sh)
rm ~/.config/lvim
rm /usr/local/bin/lvim
```

### ~~原生 Nvim~~

```sh
rm -rf ~/.config/nvim && ln -s ~/dotfiles/nvim/native-nvim ~/.config/nvim
```

## Mac

### Mac 按键映射

```sh
brew install --cask karabiner-elements
rm -rf ~/.config/karabiner/karabiner.json && mkdir ~/.config/karabiner && ln -s ~/dotfiles/mac/karabiner/karabiner.json ~/.config/karabiner/karabiner.json
```

### 窗口管理

#### Yabai

平铺式窗口管理，全局统一的切换、关闭操作，不会因为不同软件的不同快捷键而产生操作的割裂和心智负担

```sh
brew install koekeishiya/formulae/yabai
rm -rf ~/.config/yabai && ln -s ~/dotfiles/mac/yabai ~/.config/yabai

# yabai --start-service
# brew install cmacrae/formulae/spacebar
# mkdir -p ~/.config/spacebar && ln -s ~/dotfiles/yabai/spacebarrc ~/.config/spacebar/spacebarrc
# brew services start spacebar

brew tap FelixKratz/formulae
brew install sketchybar
brew install --cask sf-symbols
curl -L https://github.com/kvndrsslr/sketchybar-app-font/releases/download/v1.0.4/sketchybar-app-font.ttf -o $HOME/Library/Fonts/sketchybar-app-font.ttf
rm -rf ~/.config/sketchybar && ln -s ~/dotfiles/mac/sketchybar ~/.config/sketchybar
# brew services start sketchybar
```

#### ~~amethyst~~

用 yabai 就不需要用它了

```sh
brew install --cask amethyst
rm -rf ~/.config/amethyst && ln -s ~/dotfiles/mac/amethyst ~/.config/amethyst
```

### 截图

```sh
brew install --cask snipaste
rm -rf ~/.snipaste/config.ini && ln -s ~/dotfiles/mac/snipaste/config.ini ~/.snipaste/config.ini
```

## Arch Linux

```sh
# 字体配置
rm -rf ~/.config/fontconfig && ln -s ~/dotfiles/linux/fontconfig ~/.config/fontconfig
```

### Hypyland

#### Hypyland 配置

```sh
# hypyland 配置
# 先把配置文件夹软链接过去，这样下面的配置更改会自动同步到 dotfiles 目录中
rm -rf ~/.config/hypr && ln -s ~/dotfiles/linux/hypr ~/.config/hypr

# wayland 配置
rm -rf ~/.config/chrome-flags.conf && ln -s ~/dotfiles/linux/chrome-flags.conf ~/.config/chrome-flags.conf
rm -rf ~/.config/electron-flags.conf && ln -s ~/dotfiles/linux/electron-flags.conf ~/.config/electron-flags.conf

# https://github.com/end-4/dots-hyprland
bash <(curl -s "https://end-4.github.io/dots-hyprland-wiki/setup.sh")
# 还可以看看这个 https://github.com/prasanthrangan/hyprdots
```

### Linux 按键映射

使用 [kanata](https://github.com/jtroo/kanata)

```sh
# https://github.com/jtroo/kanata/discussions/130
sudo ln -s ~/dotfiles/linux/kanata/kanata.service /lib/systemd/system/kanata.service
# sudo systemctl daemon-reload
# maybe this will be required when changing the service file
sudo systemctl daemon-reload
sudo systemctl start kanata
sudo systemctl enable kanata
```
