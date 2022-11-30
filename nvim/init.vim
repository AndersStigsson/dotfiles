let mapleader = " " " map leader to Space
let g:instant_username = "bananjanne"
let g:gitblame_date_format = '%r'
nmap <leader>/ :let @/ = ""<CR>
map <leader>ew :e <C-R>=expand("%:p:h") . "/" <CR>
set nu
set history=1000
set undolevels=1000
set encoding=utf-8
set autoindent
set smartindent
set shiftwidth=4
set expandtab
set tabstop=4
set softtabstop=4
set nowrap
set linebreak

set backspace=2 
set synmaxcol=200
set colorcolumn=80,120

"map arrow keys..
noremap <down> :m+<CR>
noremap <up> :m-2<CR>
inoremap <down> <esc>:m+<CR>
inoremap <up> <esc>:m-2<CR>
vnoremap <down> :m'>+<CR>gv
vnoremap <up> :m-2<CR>gv

imap <left> <esc><<
imap <right> <esc><<
nnoremap <left> <<
nnoremap <right> >>
vnoremap <left> <<
vnoremap <right> >>

" better indent and outdent {{{1
nnoremap < <<
nnoremap > >>
" 1}}}
" reselect visual block after indent/outdent {{{1
vnoremap < <gv
vnoremap > >gv
" 1}}}
" " Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" " Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" nnoremap <leader>e vim.diagnostic.open_float

" ignore case in search
set ignorecase
set smartcase

" Search stuff
set hlsearch
set showmatch
set incsearch

" source $HOME/.config/nvim/coc.nvim
source $HOME/.config/nvim/functions.vim
source $HOME/.config/nvim/starlite.vim
"highlight  FgCocErrorFloatBgCocFloating ctermfg=0 guifg=black
call plug#begin("$HOME/.config/nvim/plugged")
Plug 'jbyuki/instant.nvim'
"Plug 'ibhagwan/fzf-lua'
"Plug 'EdenEast/nightfox.nvim'
"Plug 'neoclide/coc-denite'
"Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'mhinz/vim-startify'
Plug 'google/vim-jsonnet'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'ironhouzi/starlite-nvim'
Plug 'tpope/vim-repeat'
Plug 'editorconfig/editorconfig-vim'
"Plug 'itchyny/lightline.vim'
Plug 'jwalton512/vim-blade'
Plug 'duggiefresh/vim-easydir'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'wuelnerdotexe/vim-enfocado'
"Plug 'romgrk/nvim-treesitter-context'
Plug 'ellisonleao/glow.nvim'
"Plug 'pacokwon/onedarkhc.vim'
"Plug 'SirVer/ultisnips'
Plug 'williamboman/nvim-lsp-installer'
Plug 'neovim/nvim-lspconfig'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'golang/vscode-go'
Plug 'hrsh7th/nvim-cmp'
" Plug 'josa42/nvim-lightline-lsp'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'f-person/git-blame.nvim'
Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'
Plug 'kristijanhusak/vim-dadbod-completion'
Plug 'jreybert/vimagit'
call plug#end()
source $HOME/.config/nvim/telescope.vim
source $HOME/.config/nvim/treesitter.nvim
"source $HOME/.config/nvim/lightline.nvim
"source $HOME/.config/nvim/denite.vim
source $HOME/.config/nvim/vim-go.nvim
source $HOME/.config/nvim/dadbod.nvim
"source $HOME/.config/nvim/colors/onedarkhc.vim
"source $HOME/.config/nvim/autoloads/onedarkhc.vim
"colorscheme onedarkhc
"source $HOME/.config/nvim/nightfox.nvim
set termguicolors
autocmd VimEnter * ++nested colorscheme enfocado
hi link TSConstructor TSType
lua <<EOF
require('plugins')
require('lsp')
require('cmp-config')
require('git-blame-lualine')
EOF
