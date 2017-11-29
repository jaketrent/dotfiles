" Visual Mode Orange Background, Black Text
hi Visual          guifg=#000000 guibg=#FD971F

" Default Colors for CursorLine
highlight CursorLine guibg=#3E3D32
highlight Cursor guibg=#A6E22E

" Change Color when entering Insert Mode
autocmd InsertEnter * highlight  CursorLine guibg=#323D3E
autocmd InsertEnter * highlight  Cursor guibg=#00AAFF

" Revert Color to default when leaving Insert Mode
autocmd InsertLeave * highlight  CursorLine guibg=#3E3D32
autocmd InsertLeave * highlight  Cursor guibg=#A6E22E




" LINES
set number
set scrolloff=5



" cursorline highlight
set cursorline

" cursor block for normal, viz, or selection modes
" set guicursor=n-v-c:block-Cursor

" Default Colors for CursorLine
" highlight CursorLine ctermbg=Yellow ctermfg=None

" Change Color when entering Insert Mode
" autocmd InsertEnter * highlight  CursorLine ctermbg=Orange ctermfg=White

" Revert Color to default when leaving Insert Mode
" autocmd InsertLeave * highlight  CursorLine ctermbg=Yellow ctermfg=None

" TABS
set backspace=indent,eol,start
set smarttab
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
set smartindent
set indentkeys+=O,o


" COMMAND-LINE COMPLETION
set wildmenu

" PATTERN IGNORING
set wildignore+=*/.git/*,*/node_modules/*,*/build/*,*/.next/*,*/__snapshots__/*,*/flow-typed/*,*/priv/*,*/deps/*,package-lock.json,*.zip,*.png,*.jpg,*.gif,*.pdf,*DS_Store*
set grepprg=grep\ -In\ --exclude-dir={.git,node_modules,build,.next,__snapshots__,flow-typed,priv,deps}\ --exclude=package-lock.json





" --- syntax highlighting ----------------------------

" always syntax highlight
syntax on

" enable flow in vim-javascript
let g:javascript_plugin_flow = 1


" syntax highlight for vim-jsx in .js files
let g:jsx_ext_required = 0


" --- ctrlp/fuzzy finder setup -------------------------------

" exclude gitignored directories/files
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

