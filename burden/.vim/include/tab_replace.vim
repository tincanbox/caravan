
" Rename tabs to show tab number.
" (Based on http://stackoverflow.com/questions/5927952/whats-implementation-of-vims-default-tabline-function)
if exists("+showtabline")

  " tab1 | tab2 | tab3 | active | tab4

  function! TabLineBuildComponent(i, active)
    let i = a:i
    let t = a:active
    let s = ''
    let l = 0
    let files = ''
    let label = ''
    let buflist = tabpagebuflist(i)
    let winnr = tabpagewinnr(i)
    " Define active buffer enclosures.
    let acto = '%#BuffNameCol#'
    let actc = '%1*'
    let c_show_tabnum_clear = 0

    let tab_open = '%' . i . 'T' " Start TabLabel
    let s .= tab_open

    if c_show_tabnum_clear
      let s .= (i == t ? '%1*' : '%2*')
      let s .= (i < 10 ? ' ' : '').'%#TabNum#'
    else
      let s .= (i == t ? '%#TabNum#' : '%#TabLine#')
    endif

    let s .= ' '
    let l += 1
    let s .= (i < 10 ? ' ' : '')
    let l += (i < 10 ? 1 : 0)
    let s .= i
    let l += len(string(i))

    let s .= ':'
    let l += 1

    let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')

    let m = 0       " &modified counter
    let bc = len(buflist)     "counter to avoid last ' '
    " loop through each buffer in a tab
    let bi = 1
    for b in buflist
      let col = ''
      let buftype=getbufvar(b, "&buftype")
      let is_active = (bi == winnr && i == t)
      " buffer types: quickfix gets a [Q], help gets [H]{base fname}
      if buftype == 'Help'
        let col = '[?:'.fnamemodify( bufname(b), ':t:s/.txt$//' ).']'
      elseif buftype == 'quickfix'
        let col = '[Q]'
      else
        let bufname = bufname(b)

        if filereadable(bufname)
          " Merge modifiable file names later.
          let fn = fnamemodify(bufname, ':p:t')
        else
          if bufname == ''
            let fn = '[No Name]'
          else
            let fn = bufname[0:24]
          endif
        endif

        if !getbufvar( b, "&modifiable" )
          let fn = '[!'.substitute(bufname, "\[^a-zA-Z0-9\]", "", "")[0:2].']'
        endif

        if getbufvar( b, "&modified" )
          let fn = fn.'*'
        endif

        let l += len(fn)

        if is_active && getbufvar(b, "&readonly") == 1
          let fn = '%#BuffNameReadOnly#'.fn
        endif

        if is_active
          let fn = tab_open.acto.fn.actc.'%T'
        else
          let fn = tab_open.fn.'%T'
        endif

        if files == ''
          let files = fn
        else
          let files = files.' | '.fn
          let l += 3
        endif
      endif

      " check and ++ tab's &modified count
      if getbufvar( b, "&modified" )
        let m += 1
      endif

      let l += len(col)

      if col != '' && bi == winnr && i == t
        let col = acto.col.actc
      endif

      let label .= col
      let bi += 1
    endfor

    if len(label) > 0
      let s .= label
      let s .= ' |'
      let l += 2
    endif

    if files == ''
      let s .= ' --- '
      let l += 5
    else
      let s .= ' '.files.' '
      let l += 2
    endif


    " add modified label [n+] where n pages in tab are modified
    if m > 0
      let s .= '[+]'
      let l += 3
    endif

    return [s, l]
  endfunction


  function! TabLineRenderer()
    let s = ''
    let i = 1
    let cur = tabpagenr()
    let bfr = []
    let aft = []
    let ww = &columns

    let c = TabLineBuildComponent(cur, cur)
    let act = c[0]
    let act_l = c[1]

    while i < cur
      let c = TabLineBuildComponent(i, cur)
      call add(bfr, c)
      let i = i + 1
    endwhile

    let i = cur + 1
    let last = tabpagenr('$')
    while i <= last
      let c = TabLineBuildComponent(i, cur)
      call add(aft, c)
      let i = i + 1
    endwhile

    let total = act_l
    let rmn = ww - act_l - 4
    let max = 0

    let l_bfr = len(bfr)
    let l_aft = len(aft)
    if l_bfr > l_aft
      let max = l_bfr
    else
      let max = l_aft
    endif

    let i = 0
    let s = act
    let b = reverse(bfr)
    let a = aft
    let overflow_b = 0
    let overflow_a = 0

    if rmn > 0
      while i < max
        let next_b = (i < l_bfr) ? b[i] : []
        let next_a = (i < l_aft) ? a[i] : []
        if len(next_b)
          if next_b[1] <= rmn
            let s = next_b[0] . s
            let rmn = rmn - next_b[1]
          elseif rmn > 0 && overflow_b == 0
            let s = '%#TabLine#<<' . s
            let overflow_b = 1
          endif
        endif
        if len(next_a)
          if next_a[1] <= rmn
            let s = s . next_a[0]
            let rmn = rmn - next_a[1]
          elseif rmn > 0 && overflow_a == 0
            let s = s . '%#TabLine#>>'
            let overflow_a = 1
          endif
        endif
        let i += 1
      endwhile
    endif

    let fill = '%T%#TabLineFill#%='
    let fill .= (tabpagenr('$') > 1 ? '%999XX' : 'X')
    let s .= fill

    return s
  endfunction

  set stal=2
  set tabline=%!TabLineRenderer()
  set showtabline=1
  set guioptions-=e

  highlight link TabNum Special
  highlight link BuffNameCol Special
  highlight BuffNameReadOnly ctermfg=red
endif
