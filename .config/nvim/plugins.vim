call plug#begin('~/.vim/plugged')

Plug 'dikiaap/minimalist'
Plug 'preservim/nerdtree'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'leafgarland/typescript-vim'

let g:coc_global_extensions = ['coc-tsserver', 'coc-eslint', 'coc-prettier', 'coc-json', 'coc-jest', 'coc-emmet']

call plug#end()
