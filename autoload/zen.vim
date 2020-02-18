function! zen#toggle_zen()
    if g:zen_activated
        call zen#deactivate()
    else
        call zen#activate()
    endif
endfunction

function! zen#activate() "{{{
    set nonumber norelativenumber laststatus=0 noruler signcolumn=yes:5
    hi SignColumn guibg=#f2e5bc
    if exists("$TMUX")
        silent !tmux set status off
    endif
    let g:zen_activated = 1
endfunction "}}}

function! zen#deactivate() "{{{
    set number relativenumber laststatus=2 ruler signcolumn&
    hi SignColumn guibg=#ebdbb2
    if exists("$TMUX")
        silent !tmux set status on
    endif
    let g:zen_activated = 0
endfunction "}}}

" vim:set foldmethod=marker:
