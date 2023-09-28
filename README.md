# NeoVim config (1.0)
Vim to Neovim migration, personal nvim cfg

# Installation
## Linux
```bash
# Backup current config
mv ~/.config/nvim ~/.config/nvim_old

# Remove plugin cache files
rm -rf ~/.local/share/nvim

# Clone repo
git clone -b 1.0 https://github.com/lipeeeee/.nvim ~/.config/nvim --depth 1
# OR
git clone -b 1.0 git@github.com:lipeeeee/.nvim.git ~/.config/nvim --depth 1

# Open
nvim
```

# Dependencies
- 0.9.2 nvim
- npm, python and a C compiler for basic dependencies

