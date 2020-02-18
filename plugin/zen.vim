if exists("g:loaded_zen")
    finish
endif
let g:loaded_zen = 1

let g:zen_activated = 0

call zen#get_colors()

command! Zen call zen#toggle()
