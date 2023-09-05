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

# TODO 
- Outline in nvim tree like such : https://www.reddit.com/r/unixporn/comments/16akrbt/neovim_tevim/
- Improve aesthetics of current config maybe check r/unixporn
    - colorscheme check tokyonight from folke
    - toggleterm dividers, maybe smth with win*?
- Image seeeeEEEr? saw on r/unixporn https://www.reddit.com/r/unixporn/comments/164xn0p/bspwm_first_rice/

# REFACTOR
- Signs collection
    - Make signs library globally initialized to save a bit on processing power
- refactor lualine.lua 
    - tables into their particular files or file in preferences/
    - better code.. etc

# POSTPONED
- lualine flag for paste mode 
- TSInstall init fn() check trouble or smth for required
- improvement: ExitPre event can be used to close toggleterm process 
- Very later on: make metrics python script

# MISSING PLUGINS
See https://github.com/folke/dot/tree/master/nvim

- dashboard
- dressing
- Fugitive
- Persitance
- TODO comments

