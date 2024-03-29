" Forked from Zoltan Damaldi's one.vim
" (https://github.com/itchyny/lightline.vim/blob/master/autoload/lightline/colorscheme/one.vim)
" Common colors
let s:blue   = [ '#82aaff', 75 ]
let s:green  = [ '#c3e88d', 76 ]
let s:purple = [ '#c792ea', 176 ]
let s:red1   = [ '#e06c75', 168 ]
let s:red2   = [ '#be5046', 168 ]
let s:yellow = [ '#ffcb6b', 180 ]

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}, 'command': {}}

if lightline#colorscheme#background() ==# 'light'
  " Light variant{{{
  let s:fg    = [ '#494b53', 238 ]
  let s:bg    = [ '#fafafa', 255 ]
  let s:gray1 = [ '#494b53', 238 ]
  let s:gray2 = [ '#f0f0f0', 255 ]
  let s:gray3 = [ '#d0d0d0', 250 ]
  let s:green = [ '#98c379', 35 ]

  let s:p.inactive.left   = [ [ s:bg,  s:gray3 ], [ s:bg, s:gray3 ] ]
  let s:p.inactive.middle = [ [ s:gray3, s:gray2 ] ]
  let s:p.inactive.right  = [ [ s:bg, s:gray3 ] ]
"}}}
else
  " Dark variant
  let s:fg    = [ '#a6accd', 145 ]
  let s:bg    = [ '#282c34', 235 ]
  let s:gray1 = [ '#676e95', 241 ]
  let s:gray2 = [ '#222634', 235 ]
  let s:gray3 = [ '#343b51', 240 ]

  let s:p.inactive.left   = [ [ s:gray1,  s:bg ], [ s:gray1, s:bg ] ]
  let s:p.inactive.middle = [ [ s:gray1, s:gray2 ] ]
  let s:p.inactive.right  = [ [ s:gray1, s:bg ] ]
endif

" Common
let s:p.normal.left    = [ [ s:bg, s:fg, 'bold' ], [ s:fg, s:gray3 ] ]
let s:p.normal.middle  = [ [ s:fg, s:gray2 ] ]
let s:p.normal.right   = [ [ s:bg, s:fg ], [ s:fg, s:gray3 ] ]
let s:p.normal.error   = [ [ s:bg, s:red2 ] ]
let s:p.normal.warning = [ [ s:bg, s:yellow ] ]
let s:p.command.left    = [ [ s:bg, s:green, 'bold' ], [ s:fg, s:gray3 ] ]
let s:p.command.right   = [ [ s:bg, s:green ], [ s:fg, s:gray3 ] ]
let s:p.insert.left    = [ [ s:bg, s:blue, 'bold' ], [ s:fg, s:gray3 ] ]
let s:p.insert.right   = [ [ s:bg, s:blue ], [ s:fg, s:gray3 ] ]
let s:p.replace.left   = [ [ s:bg, s:red1, 'bold' ], [ s:fg, s:gray3 ] ]
let s:p.replace.right  = [ [ s:bg, s:red1 ], [ s:fg, s:gray3 ] ]
let s:p.visual.left    = [ [ s:bg, s:purple, 'bold' ], [ s:fg, s:gray3 ] ]
let s:p.visual.right   = [ [ s:bg, s:purple ], [ s:fg, s:gray3 ] ]
let s:p.tabline.left   = [ [ s:fg, s:gray3 ] ]
let s:p.tabline.tabsel = [ [ s:bg, s:purple, 'bold' ] ]
let s:p.tabline.middle = [ [ s:gray3, s:gray2 ] ]
let s:p.tabline.right  = copy(s:p.normal.right)

let g:lightline#colorscheme#mymaterial#palette = lightline#colorscheme#flatten(s:p)
