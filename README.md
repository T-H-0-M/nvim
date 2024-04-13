# Neovim-Config

## Introduction

This is my personal neovim configuration. It uses
[lazyvim](https://www.lazyvim.org/) as a plugin manager. My configuration is
largely targeted towards web development, machine learning, and latex.

## Features

### Plugin Manager:

- [lazyvim](https://www.lazyvim.org/)

### Plugins:

- [alpha](https://github.com/goolord/alpha-nvim): Neovim greeter.
- [auto-session](https://github.com/rmagatti/auto-session): Simple session
  manager.
- [autopairs](https://github.com/windwp/nvim-autopairs): Auto pairs for
  brackets.
- [colourscheme](https://github.com/rose-pine/neovim)
- [comment](https://github.com/numToStr/Comment.nvim): Commenting plugin.
- [copilot](https://github.com/github/copilot.vim): Github copilot.
- [dressing](https://github.com/stevearc/dressing.nvim)
- [formatting](https://github.com/stevearc/conform.nvim): Formatting plugin.
- [gitsigns](https://github.com/lewis6991/gitsigns.nvim)
- [harpoon](https://github.com/ThePrimeagen/harpoon/tree/harpoon2)
- [indent-blankline](https://github.com/lukas-reineke/indent-blankline.nvim)
- [lazygit](https://github.com/kdheepak/lazygit.nvim)
- [linting](https://github.com/mfussenegger/nvim-lint)
- [lualine](https://github.com/nvim-lualine/lualine.nvim)
- [markdown-preview](https://github.com/iamcco/markdown-preview.nvim)
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- [nvim-tree](https://github.com/nvim-tree/nvim-tree.lua)
- [substitute](https://github.com/gbprod/substitute.nvim)
- [surround](https://github.com/kylechui/nvim-surround)
- [telescope](https://github.com/nvim-telescope/telescope.nvim)
- [todo-comments](https://github.com/folke/todo-comments.nvim)
- [treesitter](https://github.com/tree-sitter/tree-sitter)
- [trouble](https://github.com/folke/trouble.nvim)
- [undotree](https://github.com/mbbill/undotree)
- [vim-maximizer](https://github.com/szw/vim-maximizer)
- [vimtex](https://github.com/lervag/vimtex)
- [which-key](https://github.com/folke/which-key.nvim)

## Setup

### UNIX

1. Ensure that a terminal compatible with nerd fonts is installed. I personally
   use [iTerm2](https://iterm2.com/).
   - Install using `homebrew` - `brew install --cask iterm2` (Mac).
   - Install using `apt` - `sudo apt-get install iterm2` (Ubuntu).
2. Ensure that a nerd font is installed. I personally use
   [Meslo Nerd Font](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Meslo)
   - Install using `homebrew` -
     `brew tap homebrew/cask-fonts && brew install --cask font-meslo-nerd-font`
     (Mac)
   - Install using `apt` - `sudo apt-get install fonts-meslo` (Ubuntu)
3. Ensure that [neovim](https://neovim.io/) is installed
   - `brew install neovim`(Mac)
   - `sudo apt-get install neovim`(Ubuntu)
4. Naviagate to your `.config` directory
   - `cd ~/.config/`
5. Clone the git repository
   - `git clone https://github.com/T-H-0-M/nvim.git`
6. Open neovim
   - `nvim`

All packages should automatically install.

### Windows

1. Ensure that a terminal compatible with nerd fonts is installed. A popular one
   is [Windows Terminal](https://github.com/microsoft/terminal/).
2. Ensure that a nerd font is installed. I personally use
   [Meslo Nerd Font](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Meslo)
   - `choco install nerd-fonts-meslo`(using
     [chocolatey](https://chocolatey.org/)).
3. Ensure that neovim is installed - `choco install neovim`
4. Ensure that Neovim is in your PATH - restart your terminal and run `nvim`.
   - If Neovim is not in your path, you can add it by going to your environment
     variables and add a new item to your `path` variable under
     `User variables`.
   - The path should be to the `bin` directory of your neovim installation (it
     should look something like `C:\Program Files\neovim\nvim-win64\bin`).
   - Restart your terminal and run `nvim`.
5. Navigate to your `AppData\Roaming\Local` directory -
   `cd $env:APPDATA\Roaming\Local`
   - This is where nvim will look for your nvim configuration files.
6. Clone the git repository
   - `git clone https://github.com/T-H-0-M/nvim.git`
   - This will create a new directory called `nvim` in your `Local` directory.
     It will contain all of the configuration files for nvim.
7. Open neovim
   - `nvim`

All packages should automatically install.
