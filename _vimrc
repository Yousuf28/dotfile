set relativenumber
set numberwidth=2
set cpoptions+=n
syntax on
set clipboard=unnamed
set laststatus=2
let &t_SI="\e[5 q"
let &t_EI="\e[1 q"
set backspace=2
inoremap kj <esc>
vnoremap kj <esc>
set mouse=a
" set nonvompatible
filetype on
set incsearch
set ignorecase
set smartcase
set hlsearch
set termguicolors
set history=1000
set wildmenu
noremap <Space> <Nop>
map <Space> <Leader>
" to close terminal
" C-w :q!
let g:netrw_altv = 1

"set the width of directory explorer
let g:netrw_winsize = 25
let g:netrw_altv = 1
let g:netrw_banner = 0

set splitbelow
set splitright
set lines=55
set columns=200
" Clear status line when vimrc is reloaded.
" set statusline=
" gitgutter setting
set updatetime =100
" doomemacs window keybinding
" go to right window
nnoremap <leader>wl <c-w>l
" go to left window
nnoremap <leader>wh <c-w>h
nnoremap <leader>wj <c-w>j
nnoremap <leader>wk <c-w>k
" save and close window space w c
nnoremap <leader>wc :wq<cr>
"vertical split
nnoremap <leader>wv :vsp<cr>
"horizontal split
nnoremap <leader>ws :sp<cr>
map <leader>h :noh<CR>
call plug#begin('~/.vim/plugged')
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'gaalcaras/ncm-R'
Plug 'jalvesaq/Nvim-R' 
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'https://github.com/joshdick/onedark.vim.git'
Plug 'jpalardy/vim-slime'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-python/python-syntax'
Plug 'ErichDonGubler/vim-sublime-monokai'
Plug 'frazrepo/vim-rainbow'
Plug 'mhinz/vim-startify'
" dependency for startify for getting git branch
Plug 'itchyny/vim-gitbranch'
Plug 'easymotion/vim-easymotion'
Plug 'vim-ctrlspace/vim-ctrlspace'
Plug 'airblade/vim-rooter'
" Plug 'vim-scripts/indentpython.vim'
" Plug 'Valloric/YouCompleteMe'
" Plug 'autozimu/LanguageClient-neovim', {
"     \ 'branch': 'next',
"     \ 'do': 'bash install.sh',
"     \ }
call plug#end()
set cursorline
" You can split a window into sections by typing `:split` or `:vsplit`.
" Display cursorline and cursorcolumn ONLY in active window.
augroup cursor_off
    autocmd!
    autocmd WinLeave * set nocursorline nocursorcolumn
    autocmd WinEnter * set cursorline 
augroup END

" R related
let R_assign = 0
let R_path = 'C:/Program Files/R/R-4.1.2/bin/x64'
" python
let g:python_highlight_all = 1
colorscheme onedark
"airline setting
let g:airline_theme='wombat'
let g:airline_extensions = ['branch']
let g:airline_section_y = ''
let g:airline_section_z = '%3p%% %3l/%L:%3v'
let g:airline#extensions#ctrlspace#enabled = 1
let g:CtrlSpaceStatuslineFunction =
   \  "airline#extensions#ctrlspace#statusline()"
let g:slime_target = "vimterminal"
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#branch#enabled = 1
" let g:airline_powerline_fonts = 1
" vim-rainbow setting
let g:rainbow_active = 1
" ctrl space 
set hidden
" let g:CtrlSpaceDefaultMappingKey = "<C-Space>"
let g:CtrlSpaceDefaultMappingKey = "<leader>,"

"fzf 
function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

command! ProjectFiles execute 'Files' s:find_git_root()
nnoremap <silent> <Leader>f :Files<CR>
nnoremap <silent> <C-f> :Rg<CR>
nnoremap <silent> <Leader>b :Buffers<CR>


" " startify 
" function! GetUniqueSessionName()
"   let path = fnamemodify(getcwd(), ':~:t')
"   let path = empty(path) ? 'no-project' : path
"   let branch = gitbranch#name()
"   let branch = empty(branch) ? '' : '-' . branch
"   return substitute(path . branch, '/', '-', 'g')
" endfunction

" autocmd User        StartifyReady silent execute 'SLoad '  . GetUniqueSessionName()
" autocmd VimLeavePre *             silent execute 'SSave! ' . GetUniqueSessionName()

let g:startify_lists = [
        \ { 'type': 'files',     'header': ['   Files']            },
        \ { 'type': 'dir',       'header': ['   Directory '. getcwd()] },
        \ { 'type': 'sessions',  'header': ['   Sessions']       },
        \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
        \ { 'type': 'commands',  'header': ['   Commands']       },
        \ ]

" vim rooter
let g:rooter_patterns = ['.git', 'Makefile', '*.sln', 'build/env.sh']

let g:CtrlSpaceProjectRootMarkers = [
         \ ".git"
         \ ]
set showtabline=0
let g:airline_exclude_preview = 1

" " follow symlinked file
" function! FollowSymlink()
"   let current_file = expand('%:p')
"   " check if file type is a symlink
"   if getftype(current_file) == 'link'
"     " if it is a symlink resolve to the actual file path
"     "   and open the actual file
"     let actual_file = resolve(current_file)
"     silent! execute 'file ' . actual_file
"   end
" endfunction


" " set working directory to git project root
" " or directory of current file if not git project
" function! SetProjectRoot()
"   " default to the current file's directory
"   lcd %:p:h
"   let git_dir = system("git rev-parse --show-toplevel")
"   " See if the command output starts with 'fatal' (if it does, not in a git repo)
"   let is_not_git_dir = matchstr(git_dir, '^fatal:.*')
"   " if git project, change local directory to git project root
"   if empty(is_not_git_dir)
"     lcd `=git_dir`
"   endif
" endfunction

" " netrw: follow symlink and set working directory
" autocmd CursorMoved silent *
"   " short circuit for non-netrw files
"   \ if &filetype == 'netrw' |
"   \   call FollowSymlink() |
"   \   call SetProjectRoot() |
"   \ endif

" cocvim

" May need for Vim (not Neovim) since coc.nvim calculates byte offset by count
" utf-8 byte sequence
set encoding=utf-8
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s)
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> to scroll float windows/popups
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges
" Requires 'textDocument/selectionRange' support of language server
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
let g:startify_custom_header = [
					\'                                                                                FFFFFFFFFFFFFFFFFFFFFF DDDDDDDDDDDDD                  AAA',               
					\'                                                                                F::::::::::::::::::::F D::::::::::::DDD              A:::A',              
					\'                                                                                F::::::::::::::::::::F D:::::::::::::::DD           A:::::A',             
					\'                                                                                FF::::::FFFFFFFFF::::F DDD:::::DDDDD:::::D         A:::::::A',            
					\'                                                                                  F:::::F       FFFFFF  D:::::D    D:::::D       A:::::::::A',           
					\'                                                                                  F:::::F               D:::::D     D:::::D     A:::::A:::::A',          
					\'                                                                                  F::::::FFFFFFFFFF     D:::::D     D:::::D    A:::::A A:::::A',         
					\'                                                                                  F:::::::::::::::F     D:::::D     D:::::D   A:::::A   A:::::A',        
					\'                                                                                  F:::::::::::::::F     D:::::D     D:::::D  A:::::A     A:::::A',       
					\'                                                                                  F::::::FFFFFFFFFF     D:::::D     D:::::D A:::::AAAAAAAAA:::::A',      
					\'                                                                                  F:::::F               D:::::D     D:::::DA:::::::::::::::::::::A',     
					\'                                                                                  F:::::F               D:::::D    D:::::DA:::::AAAAAAAAAAAAA:::::A',    
					\'                                                                                FF:::::::FF           DDD:::::DDDDD:::::DA:::::A             A:::::A',   
					\'                                                                                F::::::::FF           D:::::::::::::::DDA:::::A               A:::::A',  
					\'                                                                                F::::::::FF           D::::::::::::DDD A:::::A                 A:::::A', 
					\'                                                                                FFFFFFFFFFF           DDDDDDDDDDDDD   AAAAAAA                   AAAAAAA',
					\]                                                                                
