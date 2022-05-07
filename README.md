# dotfiles

## Config Soft Link

```sh
git clone --depth=1 git@github.com:lei4519/dotfiles.git ~/dotfiles
chmod +x ./install.sh && ./install.sh
```

## Deps

```sh
brew install neovim
pip3 install ranger-fm pynvim # ranger
brew install lazygit #
brew install git-delta # lazygit pager styles
brew install ripgrep # rg coc and telescope need
brew install fd # telescope
# brew install the_silver_searcher # ag
# brew install --cask neovide  # optional rust 编写的 neovim ui
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
   > 配置文件已经已经有了 4. 打开 `~/.zshrc` 设置 `ZSH_THEME` > `sh POWERLEVEL9K_MODE="nerdfont-complete" ZSH_THEME="powerlevel10k/powerlevel10k ` 5. 完成
   > 重启 iterm 后会进入 `p10k` 的初始化流程，后面想要主动调用就执行：`p10k configure`

## Lunarvim
[https://www.lunarvim.org/](https://www.lunarvim.org/)

### Install
```
bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)
ln -f -i -n -s ~/.local/bin/lvim /usr/local/bin/lvim
```

### Uninstall
```
bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/uninstall.sh)
rm /usr/local/bin/lvim
```
