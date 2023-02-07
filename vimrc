set relativenumber
set numberwidth=2
set cpoptions+=n
inoremap kj <esc>
vnoremap kj <esc>
syntax enable
call plug#begin('~/.vim/plugged')
Plug 'jalvesaq/Nvim-R'	
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'gaalcaras/ncm-R'
Plug 'preservim/nerdtree'
Plug 'Raimondi/delimitMate'
Plug 'patstockwell/vim-monokai-tasty'
Plug 'itchyny/lightline.vim'

" Initialize plugin system
call plug#end()
