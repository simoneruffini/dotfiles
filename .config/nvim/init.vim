" Every command can be searched with :h command_name or throug :option and then search the command

" Stuff to be checked
    "set noswapfile
    "set nobackup
    "set undodir=~/.vim/undodir    plugin stuff
    "set undofile                  plugin stuff
    "set hidden              search it in :h

" Leader Key
    "let mapleader = " "      Leader is space

" Some basics:
    set number relativenumber
    set cursorline
    set nohlsearch
    set noerrorbells
    set incsearch
    set scrolloff=8         " start scrolling when near 8 lines to top or bottom -> keeps cursor more in center
    " Tabs stuff:
        set tabstop=4 softtabstop=4
        set shiftwidth=4
        set expandtab
        set smartindent
	"nnoremap c "_c          " makes changed text not saved in registers, does not alter registers
	set nocompatible         " disables compatibility with vi mode
	filetype plugin on
	syntax on
	colorscheme slate
	set encoding=utf-8

" Helpers
    nnoremap J :m .+1<CR>==         " Move line down in normal mode
    nnoremap K :m .-2<CR>==         " Move line up in normal mode
    vnoremap J :m '>+1<CR>gv=gv     " Move line/s down in visual mode (looses indent)
    vnoremap K :m '<-2<CR>gv=gv     " Move line/s up in visual mode (looses indent)

    nnoremap <leader>pv :Sex!<CR>

" Plugin helpers
    "set signcolum           " adds additional column for linters, debuggers... notifications

set exrc                    " vim . loads custom vimrc inside .
set clipboard+=unnamedplus	" Save yanked files to clipboard

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

" Automatically deletes all trailing whitespace and newlines at end of file on save.
	"autocmd BufWritePre * %s/\s\+$//e
	"autocmd BufWritepre * %s/\n\+\%$//e
