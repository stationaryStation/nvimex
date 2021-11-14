<p align="center">
  <img src="https://github.com/stationaryStation/nvimex/blob/nvimex-screenshots/NvimEX.png" />
</p>

<h1 align="center">NvimEX</h1>
<p align="center">Another neovim config.</p>


---
<p align="center"> [Instalation](#Instalation) - [Plugins](#Plugins) - [Screenshots](#Screenshots) </p>
# What is the purpose of this?

To make neovim more like a full-on IDE for general purpose by adding a N00B friendly interface, more keybinds, a cheatsheet and other useful features.

# Instalation 

Linux (Script comming soon):

```bash 
cd ~/.config 
mkdir nvim 
cd nvim 
git clone https://github.com/stationaryStation/nvimex ./
nvim 
```
Then run :PlugInstall by pressing `;+p+i` or by typing `:PlugInstall`

Windows (Script comming soon): 

```powershell
cd %appdata\..\Local 
New-Item -Path '.\nvim' -ItemType Directory
cd nvim 
git clone https://github.com/stationaryStation/nvimex .\
nvim 
```

Then run :PlugInstall by pressing `;+p+i` or by typing `:PlugInstall`

# Plugins

staline.lua 

tabnine-cmp

nvim-cmp

lspconfig

lspkind

autosave.nvim

neoscroll.nvim

dashboard.nvim 

nvim-notify

nvim-colorizer

nvim-web-devicons

vsnip 

which-key 

nvim-tree

better-escape

FTerm 

Telescope.nvim 

and more! (i am too lazy to type all of the plugins ;p )


# Requirements 

Linux (I haven't tested windows nor macOS since i don't have a mac and i don't want to use a vm)
grep
cat
A terminal (I recomend [Kitty](https://github.com/kovidgoyal/kitty) and [Alacritty](https://github.com/alacritty/alacritty))

# Screenshots
![Dashboard](https://github.com/stationaryStation/nvimex/blob/nvimex-screenshots/Screenshot_2021-11-12-07-41-26_1920x1080.png?raw=true)

![Inside the editor](https://github.com/stationaryStation/nvimex/blob/nvimex-screenshots/Screenshot_2021-11-12-07-41-54_1920x1080.png?raw=true)

![NvimTree in action](https://github.com/stationaryStation/nvimex/blob/nvimex-screenshots/Screenshot_2021-11-12-07-42-54_1920x1080.png?raw=true)

![Which-key with leader key](https://github.com/stationaryStation/nvimex/blob/nvimex-screenshots/Screenshot_2021-11-12-07-43-13_1920x1080.png?raw=true)

## What NvimEX stands for?
It stands for Neovim Extended. (Very original, I know)
