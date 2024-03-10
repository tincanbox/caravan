if empty(glob(GetUserHomePath().'/.vim/autoload/plug.vim'))
  echo "Installing plug.vim ..."
  exe "!curl -fLo ".GetUserHomePath()."/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"----------------------------------------------
"  Plug
"----------------------------------------------
call plug#begin('~/.vim/plugged')

"----------------------------------------------
"  Bundle Load & Settings
"----------------------------------------------
"
" Thanks to all Vim scripters
"

"---------------------------------------------- Theme
Plug 'morhetz/gruvbox'
Plug 'chriskempson/base16-vim'
"---------------------------------------------- Visible ANSI colorings.
Plug 'vim-scripts/AnsiEsc.vim'
"---------------------------------------------- Fugtive (Enable Git commands)
Plug 'tpope/vim-fugitive'
Plug 'gregsexton/gitv'
"---------------------------------------------- Ctrl-P (Open file buffers like as SublimeText)
Plug 'kien/ctrlp.vim'
let g:ctrlp_map = '<C-p>'
"---------------------------------------------- Cool brackets manipulator.
Plug 'tpope/vim-surround'
"| Press cs"' (that's c, s, double quote, single quote) inside
"| "Hello world!"
"| to change it to
"| 'Hello world!'
"| Now press cs' to change it to
"| Hello world!
"| To go full circle, press cst" to get
"| "Hello world!"
"| To remove the delimiters entirely, press ds" .
"| Hello world!
"| Now with the cursor on "Hello", press ysiw] (iw is a text object).
"| [Hello] world!
"| Let's make that braces and add some space (use "}" instead of "{" for no space): cs]{
"| { Hello } world!
"| Now wrap the entire line in parentheses with yssb or yss) .
"| Hello world!
"| Emphasize hello: ysiw<em>
"| <em>Hello</em> world!
"| Finally, let's try out visual mode. Press a capital V (for linewise visual mode)
"| followed by S<p>. "

"---------------------------------------------- ZenCoding & Emmet
Plug 'mattn/emmet-vim'
let g:user_emmet_leader_key='<C-Y>'
"| Occured strange key confliction...I have to find out reason.
"| Bundle 'rstacruz/sparkup'
"| let g:sparkupExecuteMapping = '<c-s>o'
"---------------------------------------------- Thank you, Shougo.
Plug 'Shougo/vimproc'
Plug 'Shougo/vimshell'
Plug 'Shougo/unite.vim'
"---------------------------
Plug 'valloric/youcompleteme'
"if has('nvim')
"  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"else
"  if v:version > 800 && has('python3')
"    Plug 'Shougo/deoplete.nvim'
"    Plug 'roxma/nvim-yarp'
"    Plug 'roxma/vim-hug-neovim-rpc'
"  else
"    echo 'myvim: This vim does not support deoplete.nvim plugin.'
"  endif
"endif
"let g:deoplete#enable_at_startup = 1
"let g:deoplete#num_processes = 1
"---------------------------------------------- Superior Lisp Interaction Mode for Vim
Plug 'vim-scripts/slimv.vim'

"---------------------------------------------- Cool status bar.
Plug 'vim-airline/vim-airline'

"---------------------------------------------- Syntax
Plug 'w0rp/ale'
let g:ale_fix_on_save = 1

Plug 'pangloss/vim-javascript' , { 'for': ['javascript', 'javascript.jsx', 'html', 'vue'] }
Plug 'posva/vim-vue'
Plug 'HerringtonDarkholme/yats.vim'


"---------------------------------------------- NERD Tree [ A BEST file explorer ]
Plug 'scrooloose/nerdtree'
" Superior explorer.
let NERDTreeMapChdir='c'
let NERDTreeMapQuit=''

"---------------------------------------------- Multiple Cursors
Plug 'terryma/vim-multiple-cursors'
"| Be careful!
"| MultipleCursor make Undo/Redo histories bit complicated.
"|
"| 1. Select what you want.
"| 2. <C-n> to select next matched text.
"| (If you dont want to select next match, use <C-x> combination.)

let g:multi_cursor_use_default_mapping=0

" Default mapping
" Select word -> <C-n> -> <C-n> -> <C-n>.....
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
"let g:multi_cursor_start_key='F6'


" Cursor color for IME mode. (not work?)
if has('multi_byte_ime')
  highlight Cursor guifg=#000d18 guibg=#8faf9f gui=bold
  highlight CursorIM guifg=NONE guibg=#ecbcbc
endif

"---------------------------------------------- QuickFix refine
" Replace all matched QuickFixed texts at once!!
"
" [ How to use ]
"
" :Qfreplace
"
Plug 'thinca/vim-qfreplace'

"---------------------------------------------- Langs
Plug 'kchmck/vim-coffee-script'
Plug 'leafgarland/typescript-vim'

au BufRead,BufNewFile,BufReadPre *.coffee   set filetype=coffee
autocmd FileType coffee    setlocal sw=2 sts=2 ts=2 et
autocmd BufWritePost *.coffee silent make!
"autocmd QuickFixCmdPost * nested cwindow | redraw!
"nnoremap <silent> <C-C> :CoffeeCompile vert <CR><C-w>h

call plug#end()
