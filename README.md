Vim Stream Editing
==========

Edit text without moving your cursor!

Have you ever made a typo in a word? Do you find it annoying to move your cursor or use lengthy commands to correct it? This plug frees you from boxing with annoying cursor and complex commands!

Installation
------------

* Manual
  * Copy `plugin/vim-stream-editing.vim` to `~/.vim/plugin`
* [Pathogen](https://github.com/tpope/vim-pathogen)
  * `git clone git://github.com/lsp59862/vim-stream-editing.git ~/.vim/bundle/vim-stream-editing`
* [Vundle](https://github.com/VundleVim/Vundle.vim)
  * `Plugin 'lsp59862/vim-stream-editing'`
* [Vim-Plug](https://github.com/junegunn/vim-plug)
  * `Plug 'lsp59862/vim-stream-editing'`

Usage
--------

Hit <A-f>(Alt+f) to use the plug in normal/insert mode if you enabled. Then:

1. Enter text(pattern) to modify.
2. Hit [n/b] to choose the text.
3. Hit [i/r/a] to insert/replace/append.
4. Enter a new text.

You can exit the process by <Esc> whenever you want.

## Options

* g:vim_stream_editing_enable

      Default: 0

  Enable this plug when set it to 1.

### Attention

**g:vim_stream_editing_enable** maps <A-f> as the shortcut key to activate the process:

```
nnoremap <silent> <A-f> :call VimStreamEditingEditText()<CR>
inoremap <silent> <A-f> <Esc>:call VimStreamEditing#EditText()<CR>a      
```

If you **don't** want to use this key, please map the function directly and **set g:vim_stream_editing_enable to 0** :

    nnoremap <silent> <Key> :call VimStreamEditingEditText()<CR>
    inoremap <silent> <Key> <Esc>:call VimStreamEditingEditText()<CR>a
    let g:vim_stream_editing_enable = 0

Known Issues
------------

Contributors
------------

* [lsp59862](https://github.com/lsp59862)


License
-------

Copyright (c) 2024 Lei Shi Peng

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

