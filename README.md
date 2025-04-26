# Neovim config

*Check print-metrics job for updated metrics on every commit*

Config files: 52

Lines of code: 2625


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


snipe.nvim

MAKE FLAG FOR ESSENTIALS OR FULL PLUGINS IN INIT.LUA
    - DO NOT LOAD:
    - GIT PLUGINS
    - COLORIZER 

touch highlights, when hovering and self in python is italic
neovim-session-manager
Persitance
TODO comments

improvement: ExitPre event can be used to close toggleterm process 
treesitter textobjets
lsp (research what's needed, find null-ls alternatives)

# MISSING PLUGINS
See https://github.com/folke/dot/tree/master/nvim
