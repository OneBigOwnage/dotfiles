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

Install neovim:

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
