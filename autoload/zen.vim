function! zen#toggle() "{{{
    if g:zen_activated
        call zen#deactivate()
    else
        call zen#activate()
    endif
endfunction "}}}

function! zen#activate() "{{{
    if !exists("s:setup_done")
        call s:setup()
    endif
    windo set nonumber norelativenumber laststatus=0 noruler signcolumn=yes:5
    windo execute "highlight SignColumn guibg=" . s:normal_bg
    if exists("$TMUX")
        silent !tmux set status off
    endif
    let g:zen_activated = 1
endfunction "}}}

function! zen#deactivate() "{{{
    windo set number relativenumber laststatus=2 ruler signcolumn&
    windo execute "highlight SignColumn guibg=" . s:signcolumn_bg
    if exists("$TMUX")
        silent !tmux set status on
    endif
    let g:zen_activated = 0
endfunction "}}}

function! s:setup() "{{{
    call s:get_colors()

    augroup ZenVimLeave
        autocmd!
        autocmd VimLeave * if g:zen_activated | call zen#deactivate() | endif
    augroup END

    augroup ZenColorsChanged
        autocmd!
        autocmd ColorScheme * call zen#reset()
    augroup END

    let s:setup_done = 1
endfunction "}}}

function! s:get_colors() "{{{
    let s:signcolumn_bg = s:get_hl_attr('SignColumn', 'bg')
    let s:normal_bg = s:get_hl_attr('Normal', 'bg')
endfunction "}}}

function! s:get_hl_attr(group, attribute) "{{{
    let hl_attr = synIDattr(synIDtrans(hlID(a:group)), a:attribute)
    return (len(hl_attr) ? hl_attr : 'none')
endfunction "}}}

function! zen#reset() "{{{
    let l:zen_activated = g:zen_activated
    if l:zen_activated
        call zen#deactivate()
    endif
    call s:get_colors()
    if l:zen_activated
        call zen#activate()
    endif
endfunction "}}}

" vim:set foldmethod=marker:
