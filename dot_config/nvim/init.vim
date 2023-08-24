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
    set number              " show numbers on the left
    set cursorline          " add a horizontal line on cursor
    set noerrorbells        " don't trigger sounds
    set incsearch           " show all search results
    set mouse=a             " enable all mouse modes
    set scrolloff=8         " start scrolling when near 8 lines to top or bottom -> keeps cursor more in center
    set colorcolumn=80      " color the 80th column
    set nowrap              " disable text wrapping
    set nocompatible        " sadly: disables compatibility with vi mode 
    set encoding=utf-8
    set exrc                " vim/neovim loads custom .vimrc/.nvimrc inside `./`, will ask to trust the file on startup
    "nnoremap c "_c          " makes changed text not saved in registers, does not alter registers
    set wildmode=longest,list,full " Enable autocompletion:
    filetype plugin on
    syntax on

    " Clipboard
    " Enable disable copy in clipboard by yanking
        "set clipboard+=unnamedplus " Save yanked files to clipboard

    " Tabs stuff:
    " This stuff is wanky better to use a plugin if you have one 
    " but good defaults
        set tabstop=4 softtabstop=4
        set shiftwidth=4
        set expandtab
        set smartindent

" Mappings 
    " Esentials
        " Yank to end of line from cursor position
            nnoremap Y y$
        " Clear highligted search by pressing esc
            nnoremap <silent> <esc> :noh<cr><esc>
        " Replace all, is aliased to S.
            nnoremap S :%s//g<Left><Left>
        " Shortcutting split navigation, saving a keypress:
            map <C-h> <C-w>h
            map <C-j> <C-w>j
            map <C-k> <C-w>k
            map <C-l> <C-w>l
    " Helpers
        " Toggle show of invisible characters
            set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,eol:¶,precedes:«,extends:»
            nnoremap <Leader>h :set list!<CR>
        " Open ex
            nnoremap <leader>pv :Explore<CR>:let g:netrw_browse_split=0<CR>
            nnoremap <leader>E :Sex!<CR>
        " Create new Tab 
            nnoremap <C-w><C-T> :tabnew % <cr> 
        " Open search
            nnoremap <leader>f :find 
        " Scroll in quicklist
            nnoremap <leader>] :cnext <cr>
            nnoremap <leader>[ :cprev <cr>
        "Show Buffers and setup to change it
            nnoremap <leader>b :ls<cr>:b 
        " Shitty vimrc reloader
            nnoremap <silent> <Leader>V :tabdo windo source $MYVIMRC<cr>
            nnoremap <silent> <Leader>v :tabnew $MYVIMRC<cr>
    
" Disables automatic wrapping of lines/comments on newline:
    "autocmd FileType * setlocal formatoptions-=c  formatoptions-=t

" Disables automatic insert comment leader after pressing `o` or `O` in normal mode
    "autocmd FileType * setlocal formatoptions-=o 

" Netrw stuff
    " When pressing v will split on the right instead of left
        let g:netrw_altv=1 
        let g:netrw_browse_split=0


" LANGUAGE OVERRIDES
    "autocmd FileType vhdl :setlocal tabstop=2 softtabstop=2 shiftwidth=2 

" NEOVIM ONLY
    " Enable hightlight of yanked text
        autocmd TextYankPost * silent! lua vim.highlight.on_yank {higroup=(vim.fn['hlexists']('HighlightedyankRegion') > 0 and 'HighlightedyankRegion' or 'IncSearch'), timeout=140}

    " Run lua config
    lua require('init') -- will run lua/init
