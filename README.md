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
Plug 'ishan9299/modus-theme-vim'
```

### Minpac

```viml
call minpac#add('tjdevries/colorbuddy.nvim')
call minpac#add('ishan9299/modus-theme-vim')
```

### Vim Packages

In the terminal execute this command. Read `:h packages`
```sh
cd ~/.config/nvim
mkdir -p pack/packages/{opt,start}
git submodule add --name colorbuddy https://github.com/tjdevries/colorbuddy.nvim pack/packages/opt/colorbuddy.nvim
git submodule add --name modus-theme-vim https://github.com/ishan9299/modus-theme-vim pack/packages/opt/modus-theme-vim
```
In your `init.vim` add the following
```
packadd! modus-theme-vim
```

To set the current theme.

```viml
lua require('colorbuddy').colorscheme('modus-operandi')
```

Configuration
--------------
The theme has a faint syntax options which dims the colors if you find the default distracting.
```lua
vim.g.modus_faint_syntax = 1
lua require('colorbuddy').colorscheme('modus-operandi')
```
  
![modus-faint-operandi](./screenshots/modus-operandi-faint.png)
![modus-faint-vivendi](./screenshots/modus-vivendi-faint.png)

Plugins Explicitly Configured
-----------------------------
- TreeSitter

Please feel free to open an issue if you want other plugins to be included.

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

