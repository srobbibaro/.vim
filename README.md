# Overview

My simple Vim configuration backup.

## Setup

### General

Both `vim` and `neovim` configurations use Vundle for package management.

Install Vundle:

```bash
$ mkdir -p ~/.vim/bundle
$ cd ~/.vim/bundle
$ git clone https://github.com/gmarik/Vundle.vim.git
```
Setup `tmp` directory:

$ `mkdir ~/tmp`

Clone vim configuration:

$ `git clone https://github.com/srobbibaro/.vim.git vim`

### vim

Copy the vim configuration file into place:

$ `cp vim/vimrc ~/.vimrc`

Update plugins:

Launch `vim` and run:

* :`PluginInstall`

### neovim

Copy the nvim configuration file into place:

```bash
$ mkdir -p ~/.config/nvim
$ cp vim/vimrc ~/.config/nvim/init.vim
```

Ensure Python is installed:

```bash
$ brew install python2
$ brew install python3
```

Install required Python modules for neovim:

```bash
$ pip2 install --user neovim
$ pip3 install --user neovim
```

Update plugins:

Launch `nvim` and run:

* :`PluginInstall`
* : `UpdateRemotePlugins`

## References

* Vundle: https://github.com/gmarik/Vundle.vim
* Neovim Python: https://github.com/zchee/deoplete-jedi/wiki/Setting-up-Python-for-Neovim

## Notes

* Copying the files into place is preferable to using a symlink since it helps
  ensure that additions to the git repository are intentional.
