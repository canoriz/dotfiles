syntax on
filetype plugin indent on
set nocompatible

if has("termguicolors")
	" magic
	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
	set termguicolors
endif

call plug#begin()
Plug 'easymotion/vim-easymotion'
Plug 'preservim/tagbar'
Plug 'vim-syntastic/syntastic'
Plug 'rust-lang/rust.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'sainnhe/everforest'
Plug 'NLKNguyen/papercolor-theme'
Plug 'sainnhe/sonokai'
Plug 'dense-analysis/ale'
Plug 'mbbill/undotree'
Plug 'tpope/vim-commentary'
call plug#end()

" theme
colorscheme everforest

colorscheme PaperColor
set background=dark
highlight ALEVirtualTextError guifg=red
highlight ALEVirtualTextWarning guifg=yellow
highlight ALEError guifg=cyan cterm=underline

" cursorline highlight
set cursorline

" leader
let mapleader = " "

" set system clipboard and primary board
set clipboard^=unnamedplus
set clipboard^=unnamed

" quickfix
nnoremap <leader>cn :cnext<CR>
nnoremap <leader>cp :cN<CR>
nnoremap <leader>ln :lne<CR>
nnoremap <leader>lp :lN<CR>

" fast esc
inoremap kj <ESC>

" fast save
nnoremap <leader>w :w<CR>
inoremap ,w <ESC>:w<CR>a

" fast quit
nnoremap <leader>q :q<CR>

" numbers
set number
set relativenumber

" search
set incsearch
set ignorecase
set smartcase

" bells
set noerrorbells novisualbell

" mouse
set mouse+=a

" cursor
" set cursorline
" highlight CursorLine ctermbg=237 cterm=none
" highlight CursorLineNr ctermfg=11 ctermbg=237 cterm=none

" help
nnoremap <leader>h :h 

" command mode
cnoremap <leader>[ <ESC>:

" upper case word
inoremap ,up <ESC>gUiw`]a
nnoremap <leader>up gUiw`]
inoremap <C-F>u <Esc>gUiw`]a

" system clipboard
nnoremap <leader>,. "+

" new tab
nnoremap <leader><C-t> :tabnew 

" reload vimrc
nnoremap <leader><C-r><C-r> :so ~/.vimrc<CR>

" unprintable
set list          " Display unprintable characters f12 - switches
set listchars=tab:•\ ,trail:•,extends:»,precedes:« " Unprintable chars mapping

" Plugins
" Nerd tree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Tagbar
nmap <F8> :TagbarToggle<CR>

" Airline
" let g:airline_powerline_fonts = 1

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
autocmd FileType python let g:syntastic_quiet_messages = {
\"type": "style",
\"!level": "errors" }


" ale
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:ale_close_preview_on_insert = 1
let g:ale_cursor_detail = 1
" let g:ale_virtualtext_cursor = 'current'
let g:ale_lint_on_text_changed = 'always'
let g:ale_floating_preview = 1
" let g:ale_set_balloons = 1
let g:ale_linters = {'rust': ['cargo', 'analyzer']}
let g:ale_completion_enabled = 1
let g:ale_fixers = {
\   'rust': [
\     'rustfmt',
\     'trim_whitespace',
\     'remove_trailing_lines'],
\}
let g:ale_rust_cargo_use_clippy = 1

nnoremap <C-[> :ALEFindReferences<cr>
nnoremap <C-h> :ALEHover<cr>}
" nnoremap <C-]> :ALEGoToDefinition<cr>
nnoremap <C-[> :ALEFindReferences<cr>
nnoremap <C-h> :ALEHover<cr>
