" -- shortcut   -- ~/.vim/shortcut.vim
" -- information -- ~/.vim/information.vim
" » » » » » » » » » » » » » » » » » » » » »

" ===
" === *
" ===
augroup mine | autocmd FileType * nnoremap K 8k
augroup mine | autocmd FileType * nnoremap J 8j
augroup mine | autocmd FileType * nnoremap H 3b
augroup mine | autocmd FileType * nnoremap L 3w
augroup mine | autocmd FileType * nnoremap ( 0
augroup mine | autocmd FileType * nnoremap ) $
augroup mine | autocmd FileType * nnoremap ` ~
augroup mine | autocmd FileType * nnoremap ;v S<Esc>
augroup mine | autocmd FileType * inoremap ;v <Esc>S<Esc>
augroup mine | autocmd FileType * nnoremap ;r S
augroup mine | autocmd FileType * inoremap ;r <Esc>S
augroup mine | autocmd FileType * nnoremap <leader>c :!
augroup mine | autocmd FileType * nnoremap <leader>e :e<Space>~/
augroup mine | autocmd FileType * nnoremap ;f /<++><CR>:nohlsearch<CR>c4l<Esc>
augroup mine | autocmd FileType * vnoremap Y :w !xclip -i -sel c<CR><CR>
augroup mine | autocmd FileType * inoremap <c-h> <BS><BS><BS><BS><BS>
augroup mine | autocmd FileType * nnoremap . @a


" ===
" === Condition Filetype
" ===

"== SwapCompletionKey()
function! SwapCompletionKey()
    " It's so pity that <Tab> can't change it's function for vimwiki in terms of mapping, so we need a strange mapping for vimwiki
    if &filetype ==# 'vimwiki'
      inoremap ` <c-n>
      inoremap <c-n> `

    else
      inoremap ` <c-n>
      inoremap <Tab> <c-p>
      inoremap <c-n> `
      inoremap <c-p> <Tab>
    endif
endfunction
autocmd BufEnter * :call SwapCompletionKey()

"== SmartSemicolonF()
function! SmartSemicolonF()
    " Actually, ';f' is not necessary and even inconvenient for vim files
    if &filetype ==# 'vim'
      inoremap ;f ;f
    else
      inoremap ;f <Esc>/<++><CR>:nohlsearch <CR>c4l
    endif
endfunction
autocmd BufEnter * :call SmartSemicolonF()


" ===
" === vim
" ===
augroup mine | autocmd FileType vim nnoremap ;c ^i"<Esc>
augroup mine | autocmd FIleType vim nnoremap ;p /plug#begin<CR>:nohlsearch<CR>
augroup mine | autocmd FileType vim nnoremap ;s /shortcut.vim<CR>:nohlsearch<CR>
augroup mine | autocmd FileType vim nnoremap ;i /information.vim<CR>:nohlsearch<CR>
augroup mine | autocmd FileType vim nnoremap ;m /Mapping<Space>Note<CR>:nohlsearch<CR>
augroup mine | autocmd FileType vim nnoremap { ^w
augroup mine | autocmd FileType vim nnoremap } $h
cnoreabbrev l ls
cnoreabbrev h hide
cnoreabbrev q quit!
cnoreabbrev b buffer
cnoreabbrev pi PlugInstall
cnoreabbrev pc PlugClean


" ===
" === markdown
" ===
" 1. These shortcuts are suitable for vimwiki
" 2. ;q & ;w & ;e (applied in UltiSnips) are not available in INSERT mode
"== Code-block shortcut
augroup mine | autocmd FileType markdown inoremap ;k ()<++><Esc>F(a
augroup mine | autocmd FileType markdown inoremap ;i __<++><Esc>F_i
augroup mine | autocmd FileType markdown inoremap ;s `` <++><Esc>F`i
augroup mine | autocmd FileType markdown inoremap ;b **** <++><Esc>F*hi
augroup mine | autocmd FileType markdown inoremap ;d ~~~~ <++><Esc>F~hi
augroup mine | autocmd FileType markdown inoremap ;l [](<++>) <++><Esc>F[a
augroup mine | autocmd FileType markdown inoremap ;u <u><++></u><++><Esc>i
augroup mine | autocmd FileType markdown inoremap ;p ![](<++>) <++><Esc>F[a
augroup mine | autocmd FileType markdown inoremap ;c ```<Enter><++><Enter>```<Enter><++><Esc>3kA
augroup mine | autocmd FileType markdown inoremap ;1 #<Space><Enter><++><Esc>kA
augroup mine | autocmd FileType markdown inoremap ;2 ##<Space><Enter><++><Esc>kA
augroup mine | autocmd FileType markdown inoremap ;3 ###<Space><Enter><++><Esc>kA
augroup mine | autocmd FileType markdown inoremap ;4 ####<Space><Enter><++><Esc>kA
augroup mine | autocmd FileType markdown inoremap ;5 #####<Space><Enter><++><Esc>kA
augroup mine | autocmd FileType markdown inoremap ;t <Esc>:w<CR>F[l


" ===
" === python
" ===
augroup mine | autocmd FileType python inoremap ;m <++><Esc>i
augroup mine | autocmd FileType python inoremap ;k ()<++><Esc>F(a
augroup mine | autocmd Filetype python nnoremap ;p ^iprint(<Esc>A)<Esc>:w<CR>
augroup mine | autocmd Filetype python nnoremap ;s ^iprint("<Esc>A")<Esc>:w<CR>
augroup mine | autocmd FileType python noremap ;c ^i#<Esc>


" ===
" === c
" ===
augroup mine | autocmd FileType c inoremap ;m <++><Esc>i
augroup mine | autocmd FileType c inoremap ;k ()<++><Esc>F(a
augroup mine | autocmd FileType c inoremap ;; ;<CR>
augroup mine | autocmd FileType c noremap ;b $a;<ESC>
augroup mine | autocmd FileType c noremap ;c ^i//<Esc>


" ===
" === sh
" ===
augroup mine | autocmd FileType sh inoremap ;a ${}<++><Esc>F{a
augroup mine | autocmd FileType sh nnoremap ;c ^i#<Space><Esc>
