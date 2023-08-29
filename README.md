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
- Improve aesthetics of current config maybe check r/unixporn
- Add mapping for trouble to vertical split maybe not
- Check what wincmd/winconfig is
- Wtf are tabs
- Very later on: make metrics python script
- improvement: ExitPre event can be used to close toggleterm process 
- TSInstall init fn() check trouble or smth for required
- Check Noice messages sometimes appear as red foreground
- lualine customization
    - Block(mode) FILENAME[asis] > branch | LSP > diagn >>>> the thing about the current line diagnostics < ENCODING < asis 
    - color for block mode
- Image seeeeEEEr? saw on r/unixporn https://www.reddit.com/r/unixporn/comments/164xn0p/bspwm_first_rice/

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

