" LEADER
let mapleader=" "
nnoremap <leader>! :!clear &&<SPACE>
nnoremap <leader>s :%s//g<LEFT><LEFT>
nnoremap <leader>e :e **/*
" nnoremap <leader>g :silent grep -r '' . \| :redraw!<LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT>
" nnoremap <leader>c :cfdo %s//g \| :w<LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT>

" --- vim-spacemacs ---
" show discovery popups
nnoremap <silent> <LEADER> :<C-U>LeaderGuide '<SPACE>'<CR>
vnoremap <silent> <LEADER> :<C-U>LeaderGuideVisual '<SPACE>'<CR>

" auto change the cwd to current file
set autochdir

" --- prettier
" format on save
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md Prettier

" prettier config overrides
let g:prettier#config#semi = 'false'
let g:prettier#config#single_quote = 'true'
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#trailing_comma = 'none'



" LINES
set number
set scrolloff=5



" cursorline highlight
set cursorline

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

