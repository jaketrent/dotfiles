" from https://www.rockyourcode.com/vim-working-directory-autocompletion-and-file-finding-from-project-root
function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction
command! ProjectFiles execute 'Files' s:find_git_root()

nnoremap <c-p> :<c-u>ProjectFiles<cr>
