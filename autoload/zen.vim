function! zen#toggle() "{{{
    if g:zen_activated
        call zen#deactivate()
    else
        call zen#activate()
    endif
endfunction "}}}

function! zen#activate() "{{{
    set nonumber norelativenumber laststatus=0 noruler signcolumn=yes:5
    execute "highlight SignColumn guibg=" . s:normal_bg
    if exists("$TMUX")
        silent !tmux set status off
    endif
    echo s:signcolumn_bg
    let g:zen_activated = 1
endfunction "}}}

function! zen#deactivate() "{{{
    set number relativenumber laststatus=2 ruler signcolumn&
    execute "highlight SignColumn guibg=" . s:signcolumn_bg
    if exists("$TMUX")
        silent !tmux set status on
    endif
    let g:zen_activated = 0
endfunction "}}}

function! zen#get_colors()
    let s:signcolumn_bg = s:get_hl_attr('SignColumn', 'bg')
    let s:normal_bg = s:get_hl_attr('Normal', 'bg')
endfunction

function! s:get_hl_attr(group, attribute) "{{{
    return synIDattr(synIDtrans(hlID(a:group)), a:attribute)
endfunction "}}}

" vim:set foldmethod=marker:
