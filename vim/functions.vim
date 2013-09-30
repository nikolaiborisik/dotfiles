function DeleteHiddenBuffers()
    let tpbl=[]
    call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
    for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1')
        silent execute 'bwipeout' buf
    endfor
endfunction


function! Replace()
    let s:word = input("Replace " . expand('<cword>') . " with:")
    :exe 'bufdo! %s/\<' . expand('<cword>') . '\>/' . s:word . '/gce'
    :unlet! s:word
endfunction


function! ToggleGUINoise()
    if &go==''
        exec('se go=mTrL')
        echo "Show GUI elements"
    else
        exec('se go=')
        echo "Show no GUI elements"
    endif
endfunction


let g:relativenumber = 0
function! ToogleRelativeNumber()
    if g:relativenumber == 0
        let g:relativenumber = 1
        set number
        echo "Show line numbers"
    else
        let g:relativenumber = 0
        set nonumber
        echo "Show no line numbers"
    endif
endfunction


let g:statuslinestate = 0
function! ToggleStatusLine()
    if g:statuslinestate == 0
        let g:statuslinestate = 1
        set laststatus=0
    else
        let g:statuslinestate = 0
        set laststatus=2
    endif
endfunction
