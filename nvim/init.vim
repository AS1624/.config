" Enable relative line numbering
set relativenumber

" Enable absolute line number on the current line
set number

" Map jk to exit insert mode
inoremap jk <Esc>
inoremap <Esc> <nop>

" Show a few lines of context around the cursor. Note that this makes the
set scrolloff=5

" Do incremental searching.
set incsearch

" Don't use Ex mode, use Q for formatting.
map Q gq

call plug#begin('~/.vim/plugged')

" Highlight copied text
Plug 'machakann/vim-highlightedyank'
" Commentary plugin
Plug 'tpope/vim-commentary'

" Python LSP support
Plug 'neovim/nvim-lspconfig'

" Autocompletion (optional but recommended)
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'

" Snippet support (optional but works great with LSP)
Plug 'L3MON4D3/LuaSnip'

" Colorscheme
Plug 'joshdick/onedark.vim'

" Treesitter for better syntax highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

call plug#end()

syntax on
colorscheme onedark
highlight Normal guibg=#000000
highlight NormalNC guibg=#000000
highlight SignColumn guibg=#000000
highlight VertSplit guibg=#000000
highlight LineNr guibg=#000000
highlight Folded guibg=#000000
set termguicolors

lua << EOF
require('autocomplete')
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "python" },
  highlight = {
    enable = true,
  },
}
EOF
