" ============= Vim-Plug ============== "{{{

"call plug#begin(stdpath('data') . '/plugged')
 
"Plug 'nvim-lua/plenary.nvim' " don't forget to add this one if you don't have it yet!
"Plug 'ThePrimeagen/harpoon'  " The goal of Harpoon is to get you where you want with the fewest keystrokes

"call plug#end()

"}}}

" Every command can be searched with :h command_name or throug :option and then search the command

" Stuff to be checked
    "set noswapfile
    "set nobackup
    "set undodir=~/.vim/undodir    plugin stuff
    "set undofile                  plugin stuff
    "set hidden              search it in :h

" Leader Key
    let mapleader = " "      "Leader is space

" Some basics:
    set number 
    set cursorline
    "set nohlsearch
    set noerrorbells
    set incsearch
    set mouse=a
    set scrolloff=8         " start scrolling when near 8 lines to top or bottom -> keeps cursor more in center
    set colorcolumn=80 
    set nowrap
    " Tabs stuff:
        set tabstop=4 softtabstop=4
        set shiftwidth=4
        set expandtab
        set smartindent

    autocmd FileType vhdl :setlocal tabstop=2 softtabstop=2 shiftwidth=2 

    "nnoremap c "_c          " makes changed text not saved in registers, does not alter registers
    set nocompatible         " disables compatibility with vi mode
    filetype plugin on
    syntax on
    colorscheme slate
    set encoding=utf-8

" Esentials mappings
    " Yank to end of line from cursor position
        nnoremap Y y$
    " Clear highligted search by pressing esc
        nnoremap <silent> <esc> :noh<cr><esc>

" Helpers
  " Open ex
      nnoremap <leader>pv :Explore<CR>:let g:netrw_browse_split=0<CR>
      nnoremap <leader>E :Sex!<CR>
  " Create new Tab 
      nnoremap <C-w><C-T> :tabnew % <cr> 

" Plugin helpers
    "set signcolum           " adds additional column for linters, debuggers... notifications

set exrc                    " vim . loads custom vimrc inside .
"set clipboard+=unnamedplus " Save yanked files to clipboard

" Enable autocompletion:
    set wildmode=longest,list,full

" Disables automatic commenting on newline:
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Shortcutting split navigation, saving a keypress:
    map <C-h> <C-w>h
    map <C-j> <C-w>j
    map <C-k> <C-w>k
    map <C-l> <C-w>l

" Replace all, is aliased to S.
    nnoremap S :%s//g<Left><Left>

" Enable/disable invisible characters
    set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,eol:¶,precedes:«,extends:»
    nnoremap <Leader>h :set list!<CR>

" Shitty vimrc reloader
    nnoremap <silent> <Leader><Leader> :silent tabdo windo source $MYVIMRC<cr>

" Netrw stuff
    " When pressing v will split on the right instead of left
    let g:netrw_altv=1 
    let g:netrw_browse_split=0

" Automatically deletes all trailing whitespace and newlines at end of file on save.
    "autocmd BufWritePre * %s/\s\+$//e
    "autocmd BufWritepre * %s/\n\+\%$//e

"lua require('plugins')
