" -- shortcut   -- ~/.vim/shortcut.vim
" -- dictionary -- ~/.vim/dictionary.vim
" --information -- ~/.vim/information.vim
" » » » » » » » » » » » » » » » » » » » » »


"===
"=== functions call
"===
autocmd FileType c              call AddCDict()
autocmd FileType go             call AddGoDict()
autocmd FileType cpp            call AddCPPDict()
autocmd FileType css            call AddCSSDict()
autocmd FileType lua            call AddLuaDict()
autocmd FileType php            call AddPHPDict()
autocmd FileType tex            call AddTexDict()
autocmd FileType html           call AddHTMLDict()
autocmd FileType java           call AddJavaDict()
autocmd FileType perl           call AddPerlDict()
autocmd FileType rust           call AddRustDict()
autocmd FileType text           call AddTextDict()
autocmd FileType mysql          call AddMySQLDict()
autocmd FileType python         call AddPythonDict()
autocmd FileType markdown       call AddMarkdownDict()
autocmd FileType javascript     call AddJavaScriptDict()
autocmd FileType Dockerfile     call AddDockerfileDict()
autocmd FileType docker-compose call AddDockerComposeDict()


"===
"=== fucntions definition
"===
function AddCDict()
    if g:IsUni
        set dictionary+=~/.vim/dict/c.txt
    endif
    set complete+=k
endfunction

function AddGoDict()
    if g:IsUni
        set dictionary+=~/.vim/dict/go.txt
    endif
    set complete+=k
endfunction

function AddCPPDict()
    if g:IsUni
        set dictionary+=~/.vim/dict/c.txt
        set dictionary+=~/.vim/dict/cpp.txt
    endif
    set complete+=k
endfunction

function AddCSSDict()
    if g:IsUni
        set dictionary+=~/.vim/dict/css.txt
    endif
    set complete+=k
endfunction

function AddLuaDict()
    if g:IsUni
        set dictionary+=~/.vim/dict/lua.txt
    endif
    set complete+=k
endfunction

function AddPHPDict()
    if g:IsUni
        set dictionary+=~/.vim/dict/php.txt
    endif
    set complete+=k
endfunction

function AddTexDict()
    if g:IsUni
        set dictionary+=~/.vim/dict/tex.txt
    endif
    set complete+=k
endfunction

function AddHTMLDict()
    if g:IsUni
        set dictionary+=~/.vim/dict/html.txt
    endif
    set complete+=k
endfunction

function AddJavaDict()
    if g:IsUni
        set dictionary+=~/.vim/dict/java.txt
    endif
    set complete+=k
endfunction

function AddPerlDict()
    if g:IsUni
        set dictionary+=~/.vim/dict/perl.txt
    endif
    set complete+=k
endfunction

function AddRustDict()
    if g:IsUni
        set dictionary+=~/.vim/dict/rust.txt
    endif
    set complete+=k
endfunction

function AddTextDict()
    if g:IsUni
        set dictionary+=~/.vim/dict/text.txt
    endif
    set complete+=k
endfunction

function AddMySQLDict()
    if g:IsUni
        set dictionary+=~/.vim/dict/mysql.txt
    endif
    set complete+=k
endfunction

function AddPythonDict()
    if g:IsUni
        set dictionary+=~/.vim/dict/python.txt
    endif
    set complete+=k
endfunction

function AddMarkdownDict()
    if g:IsUni
        set dictionary+=~/.vim/dict/markdown.txt
    endif
    set complete+=k
endfunction

function AddJavaScriptDict()
    if g:IsUni
        set dictionary+=~/.vim/dict/javascript.txt
    endif
    set complete+=k
endfunction

function AddDockerfileDict()
    if g:IsUni
        set dictionary+=~/.vim/dict/Dockerfile.txt
    endif
    set complete+=k
endfunction

function AddDockerComposeDict()
    if g:IsUni
        set dictionary+=~/.vim/dict/docker-compose.txt
    endif
    set complete+=k
endfunction
