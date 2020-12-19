Modus Color Schemes
=====================

This is a color scheme developed by *Protesilaos Stavrou* for emacs. I have attempted to port it to neovim using lua.

There are 2 color schemes

![modus-operandi](./screenshots/modus-operandi.png)
modus-operandi ( the light theme )

![modus-vivendi](./screenshots/modus-vivendi.png)
modus-vivendi ( the dark theme )

Getting Started
---------------

You have to make sure you install [`tjdevries/colorbuddy.nvim`](https://github.com/tjdevries/colorbuddy.vim)
Also make sure to enable termguicolors

### Vim Plug

```
Plug 'tjdevries/colorbuddy.nvim'
Plug 'ishan9299/modus-theme-vim', {'branch': 'stable'} -- only if you are not using nightly
```

### Minpac

```viml
call minpac#add('tjdevries/colorbuddy.nvim')
call minpac#add('ishan9299/modus-theme-vim', {'branch': 'stable'}) -- only if you are not using nightly
```

### Vim Packages

In the terminal execute this command. Read `:h packages`
```sh
cd ~/.config/nvim
mkdir -p pack/packages/{opt,start}
git submodule add --name colorbuddy https://github.com/tjdevries/colorbuddy.nvim pack/packages/opt/colorbuddy.nvim
git submodule add --name modus-theme-vim https://github.com/ishan9299/modus-theme-vim pack/packages/opt/modus-theme-vim
```
In your `init.lua` add the following
```
-- if using nightly
vim.cmd(packadd! colorbuddy)
vim.cmd(packadd! modus-theme-vim)
-- if using stable
lua vim.api.nvim_command(packadd! colorbuddy)
lua vim.api.nvim_command(packadd! modus-theme-vim)
```
If you are using stable remember to switch to the branch if you use the vim package manager.

###To set the current theme.
```lua
require('colorbuddy').colorscheme('modus-operandi')
```

Plugins Explicitly Configured
-----------------------------
- TreeSitter
- Telescope
- Startify
- gitsigns
- GalaxyLine

Please feel free to open an issue if you want other plugins to be included.

Configuration
--------------
The theme has a faint syntax options which dims the colors if you find the default distracting.
```lua
vim.g.modus_faint_syntax = 1
lua require('colorbuddy').colorscheme('modus-operandi')
```
  
![modus-faint-operandi](./screenshots/modus-operandi-faint.png)
![modus-faint-vivendi](./screenshots/modus-vivendi-faint.png)

It also provides a by default configured statusline using galaxyline plugin.
To use it
```lua
vim.g.modus_moody_enable = 1
```
or
```viml
let g:modus_moody_enable = 1
```


Syntax Highlighting Configured for these languages
--------------------------------------------------
- viml
- python
- nix
- lua

TreeSitter is supported if there is a language that isn't properly highlighted please open an issue.

## NOTE
- vim is not supported.
- It is not well tested with the stable neovim (version 0.4.4) please open an issue or consider using nightly.
- For using these colorschemes in your terminal
  + [Kitty](https://github.com/ishan9299/Nixos/tree/master/user/programs/kitty/themes)
  + [Alacritty](https://github.com/ishan9299/Nixos/tree/master/user/programs/alacritty)
