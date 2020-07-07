scriptencoding utf-8

let NERDTreeShowHidden=1
let g:NERDTreeHijackNetrw = 0
let g:ranger_replace_netrw = 1

let cfg_path="~/.config/nvim/"

set wildignore+=**/node_modules/** 
let g:coc_node_path = "$HOME/.nvm/versions/node/v12.18.2/bin/node"

if empty(glob('~/.vim/autoload/plug.vim'))
        silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" load plugins
execute "source" cfg_path . "plugins.vim"
" load custom commands
execute "source" cfg_path . "commands.vim"
" load theme config
execute "source" cfg_path . "theme.vim"
" load terminal config
execute "source" cfg_path . "terminal.vim"

autocmd StdinReadPre * let s:std_in=1

au BufNewFile,BufRead *.tsx set filetype=typescript.tsx

