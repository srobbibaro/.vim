Overview
--------

Simple Vim configuration backup.

Setup
----

vim:

```bash
$ git clone https://github.com/srobbibaro/.vim.git
$ ln -s .vim/vimrc ~/.vimrc
$ mkdir ~/tmp
$ git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
$ vim +PluginInstall +qall
```

neovim:

```bash
$ git clone https://github.com/srobbibaro/.vim.git
$ mkdir ~/tmp
$ mkdir -p ~/.config/nvim
$ ln -s ~/github/.my-config-files/vimrc ~/.config/nvim/init.vim
$ brew install python2
$ brew install python3
$ pip2 install --user neovim
$ pip3 install --user neovim
```

Launch `nvim` and run:
* :`PluginInstall`
* : `UpdateRemotePlugins`

References
----------

* Vundle: https://github.com/gmarik/Vundle.vim
* Neovim Python: https://github.com/zchee/deoplete-jedi/wiki/Setting-up-Python-for-Neovim
