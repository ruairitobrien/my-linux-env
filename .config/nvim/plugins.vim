call plug#begin('~/.vim/plugged')

Plug 'dikiaap/minimalist'
Plug 'preservim/nerdtree'
Plug 'mhinz/vim-startify'
Plug 'leafgarland/typescript-vim'
Plug 'junegunn/fzf.vim'
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

let g:coc_global_extensions = ['coc-tsserver', 'coc-eslint', 'coc-prettier', 'coc-json', 'coc-jest', 'coc-emmet']

call plug#end()
