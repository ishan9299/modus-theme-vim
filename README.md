Modus Color Schemes
=====================

This is a color scheme developed by *Protesilaos Stavrou* for emacs. I have attempted to port it to neovim using lua.  

There are 2 color schemes

- modus-operandi ( the light theme )
- modus-vivendi ( the dark theme )

![modus-operandi](./screenshots/Screenshot%20from%202020-09-02%2009-10-24.png)  
![modus-vivendi](./screenshots/Screenshot%20from%202020-09-02%2009-11-47.png)

Getting Started
---------------

You have to make sure you install [`tjdevries/colorbuddy.vim`](https://github.com/tjdevries/colorbuddy.vim)
Only `termguicolors` are supported and that will not change.  

### Vim Plug

```
Plug 'tjdevries/colorbuddy.vim'
Plug 'ishan9299/modus-themes-vim'
```

### Minpac

```viml
call minpac#add('tjdevries/colorbuddy.vim')
call minpac#add('ishan9299/modus-themes-vim')
```

### Vim Packages
In the terminal execute this command.
```sh
cd ~/.config/nvim && git submodule add --name modus-theme-vim pack/packages/opt/modus-theme-vim
```
In your `init.vim` add the following
```
packadd! modus-theme-vim
```

To set the current theme.

```viml
lua require('colorbuddy').colorscheme('modus-operandi')
```
or
```
colorscheme modus-vivendi
```
NOTE
----

- Vim is not supported because the theme is written in lua.
- If you use the plasticboy's markdown plug-in or vim-pandoc-syntax you can't get the different background color for markdown headings.
- I have not tested the stable release (i.e 0.4.4) if you encounter some problems open an issue.
