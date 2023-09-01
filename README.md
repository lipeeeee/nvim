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
- YANK from lvim even tho they complicate the process 10x times more
- lualine customization
    - Block(mode) FILENAME[asis] > branch | LSP > diagn >>>> the thing about the current line diagnostics < ENCODING < asis 
    - color for block mode
    - lualine flag for paste mode 
- NvimTree H and L should open
- make preferences have a larger colleciton of icons(git staged, unstaged, commited, etc)
- Improve aesthetics of current config maybe check r/unixporn
- Add mapping for trouble to vertical split maybe not
- Check what wincmd/winconfig is
- Wtf are tabs
- improvement: ExitPre event can be used to close toggleterm process 
- Check Noice messages sometimes appear as red foreground
- Image seeeeEEEr? saw on r/unixporn https://www.reddit.com/r/unixporn/comments/164xn0p/bspwm_first_rice/
- TSInstall init fn() check trouble or smth for required
- Very later on: make metrics python script

# MISSING PLUGINS
See https://github.com/folke/dot/tree/master/nvim

- dashboard
- Fugitive
- Persitance
- TODO comments

# IN-DEPTH CONFIG DONE:
- Noice.nvim
- Trouble.nvim
- wilder
- autopairs.lua
- comment.lua
- devicons.lua
- gitsigns.lua
- nvimtree.lua
- plenary.lua
- rbdelimiters.lua
- telescope.lua
- treesitter.lua
- cmp.lua
- illuminate.lua
- lspconfig.lua
- luasnip.lua
- mason.lua
- nullls.lua
- bufferline.lua
- colorscheme.lua
- whichkey
- toggleterm

