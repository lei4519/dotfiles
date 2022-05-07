# dotfiles

```sh
# 必须放在 ~/dotfiles
git clone --depth=1 git@github.com:lei4519/dotfiles.git ~/dotfiles
```

## 软连接

```sh
brew install neovim # neovim
pip3 install ranger-fm pynvim # ranger
brew install lazygit # lazygit
brew install git-delta # git pager styles, lazygit need
brew install ripgrep # rg, telescope need
brew install fd # telescope need
# brew install the_silver_searcher # ag, or rg
# -f 强制执行
# -i 交互模式，文件存在则提示用户是否覆盖
# -n 把符号链接视为一般目录
# -s 软链接(符号链接)
ln -f -i -n -s ~/dotfiles/lvim ~/.config/lvim
ln -f -i -n -s ~/dotfiles/nvim ~/.config/nvim
ln -f -i -n -s ~/dotfiles/ranger ~/.config/ranger
ln -f -i -n -s ~/dotfiles/.zshrc ~/.zshrc
ln -f -i -n -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -f -i -n -s ~/dotfiles/lazygit.yml ~/Library/Application\ Support/lazygit/config.yml
```

## Lunarvim

[https://www.lunarvim.org/](https://www.lunarvim.org/)

### Install

```sh
bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)
# ln -f -i -n -s ~/.local/bin/lvim /usr/local/bin/lvim
```

### Uninstall

```sh
bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/uninstall.sh)
# rm /usr/local/bin/lvim
```

## Neovide use Lvim

### Install
```sh
brew install --cask neovide  # optional rust 编写的 neovim ui
cp /Applications/Neovide.app/Contents/MacOS/neovide /Applications/Neovide.app/Contents/MacOS/neovide_original
chmod +x ./neovide
ln -f -n -s ~/dotfiles/neovide /Applications/Neovide.app/Contents/MacOS/neovide
```

### Uninstall
```sh
rm /Applications/Neovide.app/Contents/MacOS/neovide
cp /Applications/Neovide.app/Contents/MacOS/neovide_original /Applications/Neovide.app/Contents/MacOS/neovide
rm /Applications/Neovide.app/Contents/MacOS/neovide_original
```

## Iterm2

1. iterm2
   ```sh
   brew install --cask iterm2
   ```

2. on my zsh
   ```sh
   sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
   ```

3. P10k
   `sh git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k `

```
配置文件已经已经有了， 以下不需要配置了
4. 打开 `~/.zshrc` 设置 `ZSH_THEME` > `sh POWERLEVEL9K_MODE="nerdfont-complete" ZSH_THEME="powerlevel10k/powerlevel10k `

5. 完成
   > 重启 iterm 后会进入 `p10k` 的初始化流程，后面想要主动调用就执行：`p10k configure`
```