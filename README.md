# Neovim config

# Installation
## Linux
```bash
# Backup current config
mv ~/.config/nvim ~/.config/nvim_old

# Remove plugin cache files
rm -rf ~/.local/share/nvim

# Clone repo
git clone https://github.com/lipeeeee/.nvim ~/.config/nvim --depth 1
# OR
git clone git@github.com:lipeeeee/.nvim.git ~/.config/nvim --depth 1

# Open
nvim
```

# Dependencies
- 0.9.2+ nvim
- npm, fzf, python and a C compiler for basic dependencies

# Better workflow 
- Cleaner/More monochrome colorscheme (git@github.com:vague2k/vague.nvim.git)
- Use more SNIPE; QUICKLIST; HARPOON; SEARCH ('s' key)
- Use less NVIM-TREE
