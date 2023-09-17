# KICKSTART NVIM config
Personal nvim kickstart config for when making new nvim configs

- Sane defaults, does not feel bloated and has the essentials while having the vim "snappiness"

- Designed and optimized to be scalable from start.

# Installation
## Linux
```bash
# Backup current config
mv ~/.config/nvim ~/.config/nvim_old

# Remove plugin cache files
rm -rf ~/.local/share/nvim

# Clone repo
git clone --branch kickstart https://github.com/lipeeeee/nvim ~/.config/nvim --depth 1
 
# OR
git clone --branch kickstart git@github.com/lipeeeee/nvim ~/.config/nvim --depth 1

# Open
nvim
```


