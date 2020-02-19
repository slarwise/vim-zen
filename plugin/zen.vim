if exists("g:loaded_zen")
    finish
endif
let g:loaded_zen = 1

let g:zen_activated = 0

augroup ZenVimLeave
    autocmd!
    autocmd VimLeave * if g:zen_activated | call zen#deactivate() | endif
augroup END

augroup ZenColorsChanged
    autocmd!
    autocmd ColorScheme * call zen#reset()
augroup END

command! Zen call zen#toggle()
