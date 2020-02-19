if exists("g:loaded_zen")
    finish
endif
let g:loaded_zen = 1

let g:zen_activated = 0

command! Zen call zen#toggle()
