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
brew install --cask font-victor-mono
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

#### 从 --help 中生成 zsh 自动补全

```sh
# https://github.com/dim-an/cod?tab=readme-ov-file
go install github.com/dim-an/cod@latest
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

# https://github.com/search?o=desc&q=fcitx5+theme&s=stars&type=Repositories
# https://github.com/kmephistoh/dotfiles/tree/main/.config/themes
# 输入法皮肤
# pacman -S fcitx5-material-color
git clone https://github.com/catppuccin/fcitx5.git
mkdir -p ~/.local/share/fcitx5/themes/
cp -r ./fcitx5/src/* ~/.local/share/fcitx5/themes

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

直接使用 `rime` 的 `vim_mode` 完成中英文切换，非常方便，不需要使用 `im-select` 了

参考 [完善 Rime Vim Mode：支持 Linux & 自动切换回中文模式](https://github.com/lei4519/blog/issues/85)，全平台支持 `vim_mode` 模式

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
rm -rf ~/.config/code-flags.conf && ln -s ~/dotfiles/linux/code-flags.conf ~/.config/code-flags.conf
```

安装 [hyprdots](https://github.com/prasanthrangan/hyprdots)

> 也可以看看 [end-4/dots-hyprland](https://github.com/end-4/dots-hyprland)

### Linux 按键映射

使用 [kanata](https://github.com/jtroo/kanata)

```sh
yay -S kanata
# https://github.com/jtroo/kanata/discussions/130
ln -s ~/dotfiles/linux/kanata/kanata.service /etc/systemd/system/kanata.service

sudo systemctl enable kanata
sudo systemctl start kanata
```

### Clash 自启动

```sh
cp ~/dotfiles/linux/clash.service /usr/lib/systemd/system/clash.service
sudo systemctl enable clash
sudo systemctl start clash
```

### 亮度控制

```sh
# https://sr.ht/kennylevinsen/wlsunset/
# 根据时间进行伽玛调整
pacman -S wlsunset
# 亮度调节
yay -S wluma
cp ~/dotfiles/linux/90-wluma-backlight.rules /etc/udev/rules.d/90-wluma-backlight.rules
# hyprland 中配置了启动
```
