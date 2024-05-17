# Neovim-Config

## Introduction

This is my personal neovim configuration. It uses
[lazyvim](https://www.lazyvim.org/) as a plugin manager. My configuration is
largely targeted towards web development, machine learning, and latex.

## Features

### Plugin Manager:

- [lazyvim](https://www.lazyvim.org/)

### Plugins:

- [auto-session](https://github.com/rmagatti/auto-session): Simple session
  manager that automatically saves and restores sessions
- [autopairs](https://github.com/windwp/nvim-autopairs): Auto pairs for
  brackets, parentheses, and quotes.
- [colourscheme](https://github.com/rose-pine/neovim): Colour Scheme.
- [comment](https://github.com/numToStr/Comment.nvim): Commenting plugin.
- [copilot](https://github.com/github/copilot.vim): Github copilot.
- [dressing](https://github.com/stevearc/dressing.nvim): Improves the default
  vim.ui interfaces.
- [formatting](https://github.com/stevearc/conform.nvim): Code formatting using
  external formatting tools.
- [gitsigns](https://github.com/lewis6991/gitsigns.nvim): Git integration for
  buffers in Neovim.
- [harpoon](https://github.com/ThePrimeagen/harpoon/tree/harpoon2): For quick
  navigation between files.
- [indent-blankline](https://github.com/lukas-reineke/indent-blankline.nvim):
  Adds indentation guides to all lines.
- [lazygit](https://github.com/kdheepak/lazygit.nvim): Git integration with UI.
- [linting](https://github.com/mfussenegger/nvim-lint): Linting plugin.
- [lualine](https://github.com/nvim-lualine/lualine.nvim): Status line.
- [markdown-preview](https://github.com/iamcco/markdown-preview.nvim): Browser
  preview for markdown documents.
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp): Autocompletion plugin.
- [nvim-tree](https://github.com/nvim-tree/nvim-tree.lua): File explorer.
- [substitute](https://github.com/gbprod/substitute.nvim): Substitution plugin.
- [surround](https://github.com/kylechui/nvim-surround): Add/change/delete
  surrounding delimiter pairs.
- [telescope](https://github.com/nvim-telescope/telescope.nvim): Fuzzy finder.
- [todo-comments](https://github.com/folke/todo-comments.nvim): Highlight, list
  and search todo comments.
- [treesitter](https://github.com/tree-sitter/tree-sitter): Syntax highlighting.
- [trouble](https://github.com/folke/trouble.nvim): Diagnostics, references,
  telescope results, quickfix and location list.
- [undotree](https://github.com/mbbill/undotree): Visualize and manage undo
  history.
- [vim-maximizer](https://github.com/szw/vim-maximizer): Maximizes the current
  window.
- [vimtex](https://github.com/lervag/vimtex): Latex plugin.
- [which-key](https://github.com/folke/which-key.nvim): Displays keybindings for
  the command currently being typed.

<!--TODO: Add LSP Pulgins-->

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
4. Ensure that all required packages are installed
   - `brew install ripgrep`(Mac)
   - `sudo apt-get install ripgrep`(Ubuntu)
   - `brew install node`(Mac)
   - `sudo apt-get install node`(Ubuntu)
5. Naviagate to your `.config` directory
   - `cd ~/.config/`
6. Clone the git repository
   - `git clone https://github.com/T-H-0-M/nvim.git`
7. Open neovim
   - `nvim`

All packages should automatically install.

### Windows

1. Ensure that a terminal compatible with nerd fonts is installed. A popular one
   is [Windows Terminal](https://github.com/microsoft/terminal/).
2. Ensure that a nerd font is installed. I use
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

## Notes

- This configuration is best used in conjunction with tmux.
- This configuration is tried and tested on MacOS, it should also run on Linux
  with no issues, but you may run into issues running it on Windows.

## References

- [Josean's Neovim Configuration](https://www.josean.com/posts/how-to-setup-neovim-2024)
- [ChatGPT](https://www.openai.com/)
