if exists("g:loaded_zen")
    finish
endif
let g:loaded_zen = 1

let g:zen_activated = 0

call zen#get_colors()

augroup ZenVimLeave
    autocmd!
    autocmd VimLeave * call zen#deactivate()
augroup END

command! Zen call zen#toggle()
