# OneBigOwnage's dotfiles

Start by cloning the repository:

```bash
git clone https://github.com/OneBigOwnage/dotfiles.git
```

Then, create the necessary symlinks:

```bash
ln -s dotfiles/git/.gitconfig .gitconfig
ln -s dotfiles/tmux/.tmux.conf .tmux.conf
ln -s dotfiles/nvim/ nvim
```

Install Neovim:

```bash
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
./nvim.appimage

mkdir -p /opt/nvim
mv nvim.appimage /opt/nvim/nvim
```

Add the following to your `.bashrc` file:
```bash
export PATH="$PATH:/opt/nvim/"
alias vim="nvim"
```

Install lazy.nvim
```bash
cd ~/.config/nvim/lazy
git clone https://github.com/folke/lazy.nvim.git
```

You should now be ready to use Neovim by running `vim`. You may need to install additional dependencies. Use `:checkhealth` to find any missing dependencies.
