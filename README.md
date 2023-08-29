# .nvim
Vim to Neovim migration,
personal nvim cfg

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
- fix illuminate in nvimtree
- Improve aesthetics of current config maybe check r/unixporn
- Add mapping for trouble to vertical split maybe not
- Check what wincmd/winconfig is
- Wtf are tabs
- Very later on: make metrics python script
- Making everything lazyload to an extent
- Add keymap to split window
- improvement: ExitPre event can be used to close toggleterm process 

# MISSING PLUGINS
- dashboard
- Noice.nvim
- Trouble.nvim
- Status bar
- Fugitive

# whichkey mapping left:
- comment.lua
- gitsigns.lua
- telescope.lua

# IN-DEPTH CONFIG DONE:
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

