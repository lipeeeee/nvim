# .nvim
Vim to Neovim migration, personal nvim cfg

# Linux Instalation
```bash
git clone https://github.com/lipeeeee/.nvim ~/.config/nvim --depth 1 && nvim
```

## Removing config cache files
```bash
mv ~/.config/nvim ~/.config/nvim_old && rm -rf ~/.local/share/nvim
```

# Dependencies
- npm, python and a C compiler for basic dependencies
- Lazy loading moves files around so might need admin/root privileges **(probably not)**

# Recomended NerdFont
**JetBrains Mono NFM**

# TODO 
- Alpha customization
- Outline in nvim tree like such : https://www.reddit.com/r/unixporn/comments/16akrbt/neovim_tevim/
- custom cursor(color)
- 80 char line
- Install script for chmod stuff when running sh scripts
- Improve aesthetics of current config maybe check r/unixporn
    - colorscheme check tokyonight from folke
    - toggleterm dividers, maybe smth with win*?
- Image seeeeEEEr? saw on r/unixporn https://www.reddit.com/r/unixporn/comments/164xn0p/bspwm_first_rice/

# REFACTOR
- Signs collection
    - Make signs library globally initialized to save a bit on processing power
- refactor alpha.lua
- refactor lualine.lua 
    - tables into their particular files or file in preferences/
    - better code.. etc

# POSTPONED
- Function to dinamically change colorscheme without having to go to config files
- spotify-tui integration with neovim (there is like a milion dependencies, not even worth it)
- lualine flag for paste mode 
- TSInstall init fn() check trouble or smth for required
- improvement: ExitPre event can be used to close toggleterm process 
- Very later on: make metrics python script

# MISSING PLUGINS
See https://github.com/folke/dot/tree/master/nvim

- neovim-session-manager
- dressing
- Fugitive
- Persitance
- TODO comments

