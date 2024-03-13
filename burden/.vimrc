"|-------------------------------------------
"| VIMRC
"|-------------------------------------------
"| !! You MUST use zsh in /usr/local/bin/zsh !!


"if !&cp | set cp | endif
"<shell>
  "set shell=/usr/local/bin/zsh
"</shell>

"<helper>"
  function! GetUserHomePath()
    return fnamemodify(expand("$HOME"), ":p:h")
  endfunction
"</helper>"

"<os_comp>"
  if has('win32') || has('win64')
    set runtimepath^=~/.vim/
  endif
"</os_comp>"

"<basis>
  " Compatible Options
  syntax on
  set nocompatible
  let s:cpo_save=&cpo
  set cpo&vim
  let &cpo=s:cpo_save
  unlet s:cpo_save
  "
  set ambiwidth=double
  set backspace=2
  set noarabicshape
"</basis>

"<cursor>
  set cursorline
  let &t_ti.="\e[1 q"
  let &t_SI.="\e[5 q"
  let &t_EI.="\e[1 q"
  let &t_te.="\e[0 q"
"</cursor>

"<mouse>
  set mouse=a
"</mouse>

"<edit>
  set magic
  set number
  set modifiable
  set history=100
  set formatoptions=lmoq
  set helplang=en
  set maxfuncdepth=1000
  set maxmapdepth=1000
  set switchbuf+=newtab
  "set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
  "set virtualedit+=block
  set backspace=2 " Set BS action mode
  set nowrap
  " Ignore case
  set ignorecase
  if has('wildignorecase')
    set wildignorecase
  endif
"</edit>

"<encoding>
  set encoding=utf-8
  set fileencodings=utf-8,sjis,iso-2022-jp,euc-jp
  set fileformats=unix,dos,mac
  set fileencoding=utf-8
"</encoding>
"
"<theme>
  autocmd vimenter * colorscheme molokai
  "set t_Co=256
  " Override base bg colors
  "hi Normal ctermbg=none
  " listchars color
  "hi SpecialKey ctermfg=8
  " ColorScheme
  "syn match specialComment #\s+\* @.*# | hi specialComment ctermfg=red guifg=red
"</theme>

"<font>
  set ambiwidth=double

  " Special chars visibility
  set list
  set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%
"</font>

"<indent>
  set tabstop=2
  set shiftwidth=2
  set softtabstop=0
  set showtabline=2
  set laststatus=2
  set smartindent
  "set autoindent
  set expandtab
  set wrap
"</indent>

"<scroll>
  set scrolloff=8
"</scroll>

"<search>
  set wrapscan
  set hlsearch
  "set incsearch
"</search>

"<auto_compl>
  set iskeyword+=-
  set iskeyword+=_
  set wildmode=list,full
  set include=^\\s*#\\s*include\ \\(<boost/\\)\\@!
  set completeopt=menuone
  set wildmenu
"</auto_compl>

"<macro>
  let mapleader="@"
"</macro>

"<include>
  " Toggle these to 'on' later...
  filetype off
  filetype plugin indent off

  for f in split(glob(GetUserHomePath().'/.vim/include/*.vim'), '\n')
    exe 'source' f
  endfor

  " Import compatibility config.
  if has("nvim")
    for f in split(glob(GetUserHomePath().'/.vim/include/cmp/nvim/*.vim'), '\n')
      exe 'source' f
    endfor
  else
    for f in split(glob(GetUserHomePath().'/.vim/include/cmp/vim/*.vim'), '\n')
      exe 'source' f
    endfor
  endif

  filetype on
  "filetype indent on
  "filetype plugin indent on
"</include>

"<autocmd>
  " Open NERDTree
  "autocmd VimEnter * if &filetype !=# 'directory' | NERDTree | endif
  " Auto change dir.
  autocmd BufEnter * silent! lcd %:p:h
  " Automatically open QuickFix window when :vimgrep ed
  autocmd QuickFixCmdPost *grep* cwindow
"</autocmd>

"<key_insert>
  " Emacs like key bindings. May be convinient in Insert mode.
  inoremap <C-n> <Down>
  inoremap <C-p> <Up>
  inoremap <C-b> <Left>
  inoremap <C-f> <Right>
  inoremap <C-h> <BS>
  inoremap <C-o> <ESC>o
  inoremap <C-u> <ESC>ui
  " Delete
  inoremap <C-d>h <Esc>lc^
  inoremap <C-d>l <Esc>lc$
  " <TAB>: completion.
  inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
  inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"
"</key_insert>

"<key_view>
  " Re-yank after paste.
  vnoremap p pgvy
  " Faster indenting
  vnoremap > >gv
  vnoremap < <gv
  " Paste from clipboard
  vnoremap <S-p> "*p
  " Copy to clipboard
  vnoremap <C-c> "*y
  " Search by yanked buffer.
  vnoremap <silent> * "vy/\V<C-r>=substitute(escape(@v,'\/'),"\n",'\\n','g')<CR><CR>
"</key_view>

"<key_console>
  cnoremap <C-b> <Left>
  cnoremap <C-f> <Right>
  " Auto escaping some special chars.
  cnoremap <expr> / (getcmdtype() == '/') ? '\/' : '/'
  cnoremap <expr> . (getcmdtype() == '/') ? '\.' : '.'
"</key_console>

"<key_normal>
  " Insert current Datetime
  nnoremap <F2> <ESC>i<C-R>=strftime("%Y/%m/%d (%a) %H:%M")<ESC>
  " Toggle line number style [abs:rlt]
  nnoremap <F3> :exec &nu==&rnu? "se nu!" : "se rnu!"<CR>
  " Quickly change to insert-after mode
  nnoremap <Space> a
  " Opens new tab like Cmd+T.
  nnoremap T :tabnew<CR>
  " Window change
  nnoremap <Tab> <C-w>w
  nnoremap <S-Tab> <C-w>W
  " Window resize
  nnoremap <S-Up> <C-w>+
  nnoremap <S-Down> <C-w>-
  nnoremap <S-Left> <C-w>>
  nnoremap <S-Right> <C-w><
  " Matched brackets
  ""nnoremap ( %
  nnoremap <S-m> v%
  " Fixed matched result position
  nnoremap n nzz
  nnoremap N Nzz
  nnoremap * *zz
  nnoremap # #zz
  nnoremap g* g*zz
  nnoremap g# g#zz
  " Open current buffer in new tab
  nnoremap <silent> tm :<C-u>call MoveToNewTab()<CR>
  " Shorthand
  nnoremap ; :
  " Move tabs
"</key_normal>

"<command>
  "" Im tired always tiping "tabnew | read !" and "q!"
  " Example:
  " :EO git diff develop new-feature
  " Abobe command shows git diff result in QF window.
  command -nargs=* EO call s:ExecuteCommandAndRedirectToQuickfix(<f-args>)
  " Bye. Maybe you can hit "qa" 1.5x faster than this. Just I want this.
  command -nargs=0 Bye :qa
  " Allow saving of files as sudo when I forgot to start vim using sudo.
  cmap w!! w !sudo tee > /dev/null %
"</command>

"<function>
  " Move current buffer to new tab.
  " I prefer to assign as <t>ab<m>ove
  function! MoveToNewTab()
    tab split
    tabprevious

    if winnr('$') > 1
      close
    elseif bufnr('$') > 1
      buffer #
    endif

    tabnext
  endfunction


  " Short hand `tabnew | read ! .....`
  " Execute a shell command and redirect outputs to QuickFix
  "
  function! ExecuteCommandAndRedirectToQuickfix(...)
    let exe_str = join(a:000)
    cexpr system(exe_str) | copen
  endfunction

  function! MakeDirRecur(p)
    let dir = expand(a:p)

    if dir =~ '://'
      return
    endif

    if !isdirectory(dir)
      call mkdir(dir, 'p')
      echo 'Created non-existing directory: '.dir
    endif
  endfunction
"</function>


