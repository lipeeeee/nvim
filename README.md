# NeoVim config (1.0)
Release 1.0... Vim to Neovim migration, personal nvim cfg

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

## CONFIG STRUCTURE
```
.
├── LICENSE
├── README.md
├── init.lua
├── lazy-lock.json
└── lua
    └── lipe
        ├── globals
        │   ├── colors.lua
        │   ├── icons.lua
        │   └── init.lua
        ├── lsp
        │   ├── handlers.lua
        │   ├── servers.lua
        │   └── settings
        │       └── rust_analyzer.lua
        ├── plugins
        │   ├── core
        │   │   ├── autopairs.lua
        │   │   ├── comment.lua
        │   │   ├── harpoon.lua
        │   │   ├── hop.lua
        │   │   ├── nvim-tree.lua
        │   │   ├── rainbow-delimiters.lua
        │   │   ├── rust.lua
        │   │   ├── telescope.lua
        │   │   ├── toggleterm.lua
        │   │   ├── treesitter.lua
        │   │   ├── undotree.lua
        │   │   └── zen-mode.lua
        │   ├── git
        │   │   ├── fugitive.lua
        │   │   ├── gitsigns.lua
        │   │   └── lazygit.lua
        │   ├── lsp
        │   │   ├── cmp.lua
        │   │   ├── lsp.lua
        │   │   ├── nvim-lint.lua
        │   │   └── trouble.lua
        │   └── ui
        │       ├── barbacue.lua
        │       ├── colorizer.lua
        │       ├── colorscheme.lua
        │       ├── dressing.lua
        │       ├── illuminate.lua
        │       └── which-key.lua
        ├── preferences
        │   ├── autoexec.lua
        │   ├── colorscheme.lua
        │   ├── keybinds.lua
        │   ├── options.lua
        │   └── remaps.lua
        └── utils
            └── time.lua
12 directories, 41 files
```
## Lines of code
```

find . -name '*.lua' | xargs wc -l
   54 ./init.lua
   45 ./lua/lipe/preferences/options.lua
    7 ./lua/lipe/preferences/colorscheme.lua
   78 ./lua/lipe/preferences/remaps.lua
   12 ./lua/lipe/preferences/autoexec.lua
   87 ./lua/lipe/preferences/keybinds.lua
    3 ./lua/lipe/lsp/settings/rust_analyzer.lua
   72 ./lua/lipe/lsp/handlers.lua
    6 ./lua/lipe/lsp/servers.lua
   10 ./lua/lipe/plugins/git/lazygit.lua
    4 ./lua/lipe/plugins/git/fugitive.lua
   49 ./lua/lipe/plugins/git/gitsigns.lua
   59 ./lua/lipe/plugins/core/treesitter.lua
  241 ./lua/lipe/plugins/core/nvim-tree.lua
    4 ./lua/lipe/plugins/core/harpoon.lua
   18 ./lua/lipe/plugins/core/hop.lua
    4 ./lua/lipe/plugins/core/undotree.lua
   66 ./lua/lipe/plugins/core/zen-mode.lua
   27 ./lua/lipe/plugins/core/rainbow-delimiters.lua
   21 ./lua/lipe/plugins/core/rust.lua
   33 ./lua/lipe/plugins/core/autopairs.lua
    8 ./lua/lipe/plugins/core/toggleterm.lua
  150 ./lua/lipe/plugins/core/telescope.lua
   54 ./lua/lipe/plugins/core/comment.lua
  174 ./lua/lipe/plugins/ui/dressing.lua
   13 ./lua/lipe/plugins/ui/barbacue.lua
   30 ./lua/lipe/plugins/ui/colorscheme.lua
  105 ./lua/lipe/plugins/ui/which-key.lua
   62 ./lua/lipe/plugins/ui/illuminate.lua
   10 ./lua/lipe/plugins/ui/colorizer.lua
  147 ./lua/lipe/plugins/lsp/cmp.lua
    8 ./lua/lipe/plugins/lsp/nvim-lint.lua
   64 ./lua/lipe/plugins/lsp/lsp.lua
   61 ./lua/lipe/plugins/lsp/trouble.lua
    3 ./lua/lipe/globals/init.lua
  160 ./lua/lipe/globals/icons.lua
   23 ./lua/lipe/globals/colors.lua
   17 ./lua/lipe/utils/time.lua
1989 total
```
# Dependencies
- 0.9.2 nvim
- npm, python and a C compiler for basic dependencies

