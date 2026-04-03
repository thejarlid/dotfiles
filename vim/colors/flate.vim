
" If you are distributing this theme, please replace this comment
" with the appropriate license attributing the original VS Code
" theme author.


" flate-2 - A nice dark theme

" ==========> Reset
set background=dark

hi clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = 'flate2'

" ==========> Highlight function
function! s:h(face, guibg, guifg, ctermbg, ctermfg, gui)
  let l:cmd="highlight " . a:face
  
  if a:guibg != ""
    let l:cmd = l:cmd . " guibg=" . a:guibg
  endif

  if a:guifg != ""
    let l:cmd = l:cmd . " guifg=" . a:guifg
  endif

  if a:ctermbg != ""
    let l:cmd = l:cmd . " ctermbg=" . a:ctermbg
  endif

  if a:ctermfg != ""
    let l:cmd = l:cmd . " ctermfg=" . a:ctermfg
  endif

  if a:gui != ""
    let l:cmd = l:cmd . " gui=" . a:gui
  endif

  exec l:cmd
endfun


" ==========> Colors dictionary

" GUI colors dictionary (hex)
let s:hex = {}
" Terminal colors dictionary (256)
let s:bit = {}

let s:hex.color0="#0d1117"
let s:hex.color1="#3a3e44"
let s:hex.color2="#171b21"
let s:hex.color3="#3f4349"
let s:hex.color4="#21252b"
let s:hex.color5="#53575d"
let s:hex.color6="#eeefef"
let s:hex.color7="#ffffff"
let s:hex.color8="#585c62"
let s:hex.color9="#0fbd78"
let s:hex.color10="#2b2f35"
let s:hex.color11="#30343a"
let s:hex.color12="#424B54"
let s:hex.color13="#E84855"
let s:hex.color14="#23D18C"
let s:hex.color15="#FFE066"
let s:hex.color16="#F0AA85"

let s:bit.color9="36"
let s:bit.color13="42"
let s:bit.color8="59"
let s:bit.color12="167"
let s:bit.color15="216"
let s:bit.color14="221"
let s:bit.color7="231"
let s:bit.color0="233"
let s:bit.color2="234"
let s:bit.color4="235"
let s:bit.color10="236"
let s:bit.color1="237"
let s:bit.color3="238"
let s:bit.color11="239"
let s:bit.color5="240"
let s:bit.color6="255"


" ==========> General highlights 
call s:h("Normal", s:hex.color0, "", s:bit.color0, "", "none")
call s:h("Cursor", "", s:hex.color0, "", s:bit.color0, "none")
call s:h("Visual", s:hex.color1, "", s:bit.color1, "", "none")
call s:h("ColorColumn", s:hex.color2, "", s:bit.color2, "", "none")
call s:h("LineNr", "", s:hex.color3, "", s:bit.color3, "none")
call s:h("CursorLine", s:hex.color4, "", s:bit.color4, "", "none")
call s:h("CursorLineNr", "", s:hex.color5, "", s:bit.color5, "none")
call s:h("CursorColumn", s:hex.color4, "", s:bit.color4, "", "none")
call s:h("StatusLineNC", s:hex.color4, s:hex.color6, s:bit.color4, s:bit.color6, "none")
call s:h("StatusLine", s:hex.color1, s:hex.color7, s:bit.color1, s:bit.color7, "none")
call s:h("VertSplit", "", s:hex.color8, "", s:bit.color8, "none")
call s:h("Folded", s:hex.color4, s:hex.color9, s:bit.color4, s:bit.color9, "none")
call s:h("Pmenu", s:hex.color10, "", s:bit.color10, "", "none")
call s:h("PmenuSel", s:hex.color2, "", s:bit.color2, "", "none")
call s:h("EndOfBuffer", s:hex.color0, s:hex.color11, s:bit.color0, s:bit.color10, "none")
call s:h("NonText", s:hex.color0, s:hex.color11, s:bit.color0, s:bit.color10, "none")


" ==========> Syntax highlights
call s:h("Comment", "", s:hex.color8, "", s:bit.color5, "none")
call s:h("Constant", "", s:hex.color13, "", s:bit.color12, "none")
call s:h("Special", "", s:hex.color13, "", s:bit.color12, "none")
call s:h("Identifier", "", s:hex.color13, "", s:bit.color12, "none")
call s:h("Function", "", s:hex.color14, "", s:bit.color13, "none")
call s:h("Statement", "", s:hex.color6, "", s:bit.color6, "none")
call s:h("Operator", "", s:hex.color13, "", s:bit.color12, "none")
call s:h("PreProc", "", s:hex.color6, "", s:bit.color6, "none")
call s:h("Type", "", s:hex.color6, "", s:bit.color6, "none")
call s:h("String", "", s:hex.color15, "", s:bit.color14, "none")
call s:h("Number", "", s:hex.color16, "", s:bit.color15, "none")

highlight link cStatement Statement
highlight link cSpecial Special
