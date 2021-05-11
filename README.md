Modus Color Schemes
=====================

This is a color scheme developed by *Protesilaos Stavrou* for emacs. This theme conforms to the highest color contrast between background and foreground values (WCAG AAA). I have attempted to port it to neovim using lua.

NOTICE
------
+ The master branch of the theme no longer depends on colorbuddy.
+ The theme also support 256 colors now(In the master branch).


Getting Started
---------------

If you are using the stable neovim (version 0.4.4 at the time) install  [`tjdevries/colorbuddy.nvim`](https://github.com/tjdevries/colorbuddy.vim)
and use the stable branch of this theme.

Also make sure to enable termguicolors.

### Installation

#### Vim Plug

```viml
Plug 'ishan9299/modus-theme-vim'  -- if using nightly neovim
Plug 'ishan9299/modus-theme-vim', {'branch': 'stable'} -- only if you are not using nightly
```

#### Minpac

```viml
call minpac#add('ishan9299/modus-theme-vim') -- if using nightly neovim
call minpac#add('ishan9299/modus-theme-vim', {'branch': 'stable'}) -- only if you are not using nightly
```

#### Vim Packages

In the terminal execute this command. Read `:h packages`
```sh
cd ~/.config/nvim
mkdir -p pack/packages/{opt,start}
git submodule add --name modus-theme-vim https://github.com/ishan9299/modus-theme-vim pack/packages/start/modus-theme-vim
# also remember to check out to stable if using neovim 0.4.4
```

#### Packer.nvim
``` lua
  use 'ishan9299/modus-theme-vim'
```

### To set the current theme.
In lua
```lua
vim.cmd('colorscheme modus-vivendi') -- Dark
-- or
vim.cmd('colorscheme modus-operandi') -- Light
```

In vimscript
```viml
colorscheme modus-vivendi -- Dark
" or
colorscheme modus-operandi -- Light
```

### Configuration
The theme has multiple configuration options.
- `vim.g.modus_moody_enable`
- `vim.g.modus_yellow_comments`
- `vim.g.modus_green_strings`
- `vim.g.modus_faint_syntax`

To do the same in viml.
- `let g:modus_moody_enable`
- `let g:modus_yellow_comments`
- `let g:modus_green_strings`
- `let g:modus_faint_syntax`

All these options are disabled by default. To enable them set the value 1.

### Screenshots
![Screenshot from 2021-05-11 12-43-02](https://user-images.githubusercontent.com/47824004/117776670-71710d80-b259-11eb-9241-bf9dad56a35c.png)

The right side has all the options enabled.
The statusbar on the left is expressline.
The font is Victor Mono.

Plugins Explicitly Configured
-----------------------------
- TreeSitter
- Telescope
- Startify
- gitsigns
- GalaxyLine
- nvim-ts-rainbow

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
- For using these colorschemes in your terminal
  + Kitty
    + [modus-operandi](https://github.com/ishan9299/Nixos/blob/d4bbb7536be95b59466bb9cca4d671be46e04e81/user/kitty/themes/modus-operandi.conf#L1-L47)
    + [modus-vivendi](https://github.com/ishan9299/Nixos/blob/d4bbb7536be95b59466bb9cca4d671be46e04e81/user/kitty/themes/modus-vivendi.conf#L1-L48)
  + [Alacritty](https://github.com/ishan9299/Nixos/blob/d4bbb7536be95b59466bb9cca4d671be46e04e81/user/alacritty/alacritty.yml#L30-L118)
- To covert the hexcolor codes to the nearest 256 color I used this javascript [code](https://gist.github.com/ishan9299/d87713b43dc04d49fa060711fdc7dd6d).
