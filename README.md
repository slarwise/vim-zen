# Vim-zen

Removes distractions and lets you focus on the text, similarly to
[goyo.vim](https://github.com/junegunn/goyo.vim). With vim-zen you get the full
text height which you can't currently in goyo.

The current implementation removes line numbers (and relative line numbers),
ruler and only shows the statusline when two or more windows are open, i.e. sets
laststatus=0. The signcolumn is used to add some horizontal padding on the left
side of the window.

## Installation

Use your preferred installation method for Vim plugins. With vim-plug you would
write the following in your vimrc.

```
call plug#begin('~/.vim/plugged')
    Plug 'slarwise/vim-zen'
call plug#end()
```

## Improvements

Let the user decide exactly what should happen when zen is activated but provide
some sane defaults. Find something else than signcolumn to use for padding since
it can at most be 9 columns wide. Preferrably the text should be centered as in
[goyo.vim](https://github.com/junegunn/goyo.vim).
