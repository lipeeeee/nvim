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
- npm, python and a C compiler for basic dependencies

# TODO
https://preview.redd.it/eioqznqvdnpb1.png?width=1920&f

https://www.youtube.com/watch?v=5RKl6-CdoqQ

MAKE FLAG FOR ESSENTIALS OR FULL PLUGINS IN INIT.LUA
    - DO NOT LOAD:
    - GIT PLUGINS
    - COLORIZER 

treesitter textobjets

colorschme> git@github.com:vague2k/vague.nvim.git

# Refactoring
- Cleaner/More monochrome colorscheme
- Refactoring tools (like grep and fzf)
- Use more SNIPE; QUICKLIST; HARPOON; SEARCH ('s' key)
- Use less NVIM-TREE
- Snipe config (ctrl+vimbinds; l to open; d to close buffer)
- More minimal gitsigns and lsp notifications?
