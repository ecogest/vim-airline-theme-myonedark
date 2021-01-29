" [onedark.vim](https://github.com/joshdick/onedark.vim/)

" This is a [vim-airline](https://github.com/vim-airline/vim-airline) theme for use with
" the [onedark.vim](https://github.com/joshdick/onedark.vim) colorscheme.

" It is based on vim-airline's ["tomorrow" theme](https://github.com/vim-airline/vim-airline-themes/blob/master/autoload/airline/themes/tomorrow.vim).
function! airline#themes#myonedark#refresh()

" 256color term{{{
  if get(g:, 'onedark_termcolors', 256) == 16
    let s:term_red = 1
    let s:term_green = 2
    let s:term_yellow = 3
    let s:term_blue = 4
    let s:term_purple = 5
    let s:term_white = 7
    let s:term_black = 0
    let s:term_grey = 8
  else
    let s:term_red = 204
    let s:term_green = 114
    let s:term_yellow = 180
    let s:term_blue = 39
    let s:term_purple = 170
    let s:term_white = 145
    let s:term_black = 235
    let s:term_grey = 236
  endif
"}}}
  let g:airline#themes#myonedark#palette = {}
" Define a color{{{
  let g:airline#themes#myonedark#palette.accents = {
        \ 'red': [ '#E06C75', '', s:term_red, 0 ]
        \ }
"}}}
  " Normal Mode {{{
  " let s:N1 = [ '#282C34', '#98C379', s:term_black, s:term_green ]
  " Atomic style
  let s:N1 = airline#themes#get_highlight2(['LineNr', 'bg'], ['ModeMsg', 'fg'], 'none')
  let s:N2 = [ '#ABB2BF', '#3E4452', s:term_white, s:term_grey ]
  " airline default for zone C (3rd one, with the filename) is too obscure)
  " let s:N3 = [ '#98C379', '#282C34', s:term_green, s:term_grey ]
  " bg set to cursorline color but the CZONE fg is colored: it is disturbing
  " let s:N3 = [ '#98C379', '#2C323C', s:term_green, s:term_grey ]
  " exact same as before, but retrieving from theme
  " let s:N3 = airline#themes#get_highlight2(['DiffAdd', 'fg'], ['CursorLine', 'bg'], 'none')
  " Simply get cursorline colors
  let s:N3 = airline#themes#get_highlight('CursorLine')
  let g:airline#themes#myonedark#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)

  let group = airline#themes#get_highlight('vimCommand')
  let g:airline#themes#myonedark#palette.normal_modified = {
        \ 'airline_c': [ group[0], '', group[2], '', '' ]
        \ }
  "}}}
  " Interactive Mode {{{
  let s:I1 = [ '#282C34', '#61AFEF', s:term_black, s:term_blue ]
  let s:I2 = s:N2
  " let s:I3 = [ '#61AFEF', '#282C34', s:term_blue, s:term_grey ]
  " let s:I3 = [ '#61AFEF', '#2C323C', s:term_blue, s:term_grey ]
  let s:I3 = s:N3
  let g:airline#themes#myonedark#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)
  let g:airline#themes#myonedark#palette.insert_modified = g:airline#themes#myonedark#palette.normal_modified
  "}}}
  " Replace Mode{{{
  let s:R1 = [ '#282C34', '#E06C75', s:term_black, s:term_red ]
  let s:R2 = s:N2
  " let s:R3 = [ '#E06C75', '#282C34', s:term_red, s:term_grey ]
  " let s:R3 = [ '#E06C75', '#2C323C', s:term_red, s:term_grey ]
  let s:R3 = s:N3
  let g:airline#themes#myonedark#palette.replace = airline#themes#generate_color_map(s:R1, s:R2, s:R3)
  let g:airline#themes#myonedark#palette.replace_modified = g:airline#themes#myonedark#palette.normal_modified
"}}}
" Visual Mode {{{
  let s:V1 = [ '#282C34', '#C678DD', s:term_black, s:term_purple ]
  let s:V2 = s:N2
  " let s:V3 = [ '#C678DD', '#282C34', s:term_purple, '' ]
  " let s:V3 = [ '#C678DD', '#2C323C', s:term_purple, '' ]
  let s:V3 = s:N3
  let g:airline#themes#myonedark#palette.visual = airline#themes#generate_color_map(s:V1, s:V2, s:V3)
  let g:airline#themes#myonedark#palette.visual_modified = g:airline#themes#myonedark#palette.normal_modified
"}}}
" Command Mode {{{
  let s:C1 = [ '#282C34', '#98C379', s:term_black, s:term_green ]
  let s:C2 = s:N2
  let s:C3 = s:N3
  let g:airline#themes#myonedark#palette.commandline = airline#themes#generate_color_map(s:C1, s:C2, s:C3)
  let g:airline#themes#myonedark#palette.commandline_modified = g:airline#themes#myonedark#palette.normal_modified
"}}}
" Terminal Mode {{{
  let s:T1 = [ '#282C34', '#E5C07B', s:term_black, s:term_yellow ]
  let s:T2 = s:N2
  let s:T3 = s:N3
  let g:airline#themes#myonedark#palette.terminal = airline#themes#generate_color_map(s:T1, s:T2, s:T3)
  let g:airline#themes#myonedark#palette.terminal_modified = g:airline#themes#myonedark#palette.normal_modified
"}}}
" Inactive window{{{
  " let s:IA1 = [ '#282C34', '#ABB2BF', s:term_black, s:term_white ]
  " let s:IA2 = [ '#ABB2BF', '#3E4452', s:term_white, s:term_grey ]
  " let s:IA3 = s:N2
  " let g:airline#themes#myonedark#palette.inactive = airline#themes#generate_color_map(s:IA1, s:IA2, s:IA3)
  " let g:airline#themes#myonedark#palette.inactive_modified = {
  "       \ 'airline_c': [ group[0], '', group[2], '', '' ]
  "       \ }
  let s:IA = airline#themes#get_highlight2(['NonText', 'fg'], ['CursorLine', 'bg'])
  let g:airline#themes#myonedark#palette.inactive = airline#themes#generate_color_map(s:IA, s:IA, s:IA)
  let g:airline#themes#myonedark#palette.inactive_modified = {
        \ 'airline_c': [ group[0], '', group[2], '', '' ]
        \ }
"}}}
" Warnings{{{
  " Warning/Error styling code from vim-airline's ["base16" theme](https://github.com/vim-airline/vim-airline-themes/blob/master/autoload/airline/themes/base16.vim)

  " Warnings
  let s:WI = [ '#282C34', '#E5C07B', s:term_black, s:term_yellow ]
  let g:airline#themes#myonedark#palette.normal.airline_warning = [
       \ s:WI[0], s:WI[1], s:WI[2], s:WI[3]
       \ ]

  let g:airline#themes#myonedark#palette.normal_modified.airline_warning =
      \ g:airline#themes#myonedark#palette.normal.airline_warning

  let g:airline#themes#myonedark#palette.insert.airline_warning =
      \ g:airline#themes#myonedark#palette.normal.airline_warning

  let g:airline#themes#myonedark#palette.insert_modified.airline_warning =
      \ g:airline#themes#myonedark#palette.normal.airline_warning

  let g:airline#themes#myonedark#palette.visual.airline_warning =
      \ g:airline#themes#myonedark#palette.normal.airline_warning

  let g:airline#themes#myonedark#palette.visual_modified.airline_warning =
      \ g:airline#themes#myonedark#palette.normal.airline_warning

  let g:airline#themes#myonedark#palette.replace.airline_warning =
      \ g:airline#themes#myonedark#palette.normal.airline_warning

  let g:airline#themes#myonedark#palette.replace_modified.airline_warning =
      \ g:airline#themes#myonedark#palette.normal.airline_warning"}}}
  " Errors{{{
  let s:ER = [ '#282C34', '#E06C75', s:term_black, s:term_red ]
  let g:airline#themes#myonedark#palette.normal.airline_error = [
       \ s:ER[0], s:ER[1], s:ER[2], s:ER[3]
       \ ]

  let g:airline#themes#myonedark#palette.normal_modified.airline_error =
      \ g:airline#themes#myonedark#palette.normal.airline_error

  let g:airline#themes#myonedark#palette.insert.airline_error =
      \ g:airline#themes#myonedark#palette.normal.airline_error

  let g:airline#themes#myonedark#palette.insert_modified.airline_error =
      \ g:airline#themes#myonedark#palette.normal.airline_error

  let g:airline#themes#myonedark#palette.visual.airline_error =
      \ g:airline#themes#myonedark#palette.normal.airline_error

  let g:airline#themes#myonedark#palette.visual_modified.airline_error =
      \ g:airline#themes#myonedark#palette.normal.airline_error

  let g:airline#themes#myonedark#palette.replace.airline_error =
      \ g:airline#themes#myonedark#palette.normal.airline_error

  let g:airline#themes#myonedark#palette.replace_modified.airline_error =
      \ g:airline#themes#myonedark#palette.normal.airline_error
"}}}
endfunction

call airline#themes#myonedark#refresh()
