"----------------------------------------------
"  Bundle & NeoBundle
"----------------------------------------------
set rtp+=$HOME/.vim/bundle/Vundle.vim/
call vundle#rc('$HOME/.vim/bundle/')
" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'


"----------------------------------------------
"  Bundle Load & Settings
"----------------------------------------------
"
" Thanks to all Vim scripters
"

"---------------------------------------------- Visible ANSI colorings.
Bundle 'vim-scripts/AnsiEsc.vim'
"---------------------------------------------- Fugtive (Enable Git commands)
Bundle 'tpope/vim-fugitive'
Bundle 'gregsexton/gitv'
"---------------------------------------------- Ctrl-P (Open file buffers like as SublimeText)
Bundle 'kien/ctrlp.vim'
let g:ctrlp_map = '<C-p>'
"---------------------------------------------- Cool brackets manipulator.
Bundle 'tpope/vim-surround'
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

"---------------------------------------------- Lua
Bundle 'L9'
"---------------------------------------------- FuzzyFinder (Find buffers)
Bundle 'FuzzyFinder'
nnoremap mf :FufFile <cr>
nnoremap mb :FufBuffer <cr>

"---------------------------------------------- ZenCoding & Emmet
Bundle 'mattn/emmet-vim'
let g:user_emmet_leader_key='<C-Y>'
"| Occured strange key confliction...I have to find out reason.
"| Bundle 'rstacruz/sparkup'
"| let g:sparkupExecuteMapping = '<c-s>o'
"---------------------------------------------- Thank you, Shougo.
Bundle 'Shougo/vimproc'
Bundle 'Shougo/vimshell'
Bundle 'Shougo/unite.vim'
"---------------------------
if has('nvim')
  Bundle 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Bundle 'Shougo/deoplete.nvim'
  Bundle 'roxma/nvim-yarp'
  Bundle 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1
"---------------------------------------------- Superior Lisp Interaction Mode for Vim
Bundle 'vim-scripts/slimv.vim'

"---------------------------------------------- Cool status bar.
Bundle 'Lokaltog/vim-powerline'

"---------------------------------------------- Syntastic [ Syntax checker ]
""Bundle 'scrooloose/syntastic'
""let g:syntastic_enable_signs=1
""let g:syntastic_auto_loc_list=2
""let g:syntastic_php_checkers=['php']

"---------------------------------------------- NERD Tree [ A BEST file explorer ]
Bundle 'scrooloose/nerdtree'
" Superior explorer.
let NERDTreeMapChdir='c'
let NERDTreeMapQuit=''

"---------------------------------------------- Multiple Cursors
Bundle "terryma/vim-multiple-cursors"
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
Bundle "thinca/vim-qfreplace"

"---------------------------------------------- Coffee Script
Bundle "kchmck/vim-coffee-script"

au BufRead,BufNewFile,BufReadPre *.coffee   set filetype=coffee
autocmd FileType coffee    setlocal sw=2 sts=2 ts=2 et
autocmd BufWritePost *.coffee silent make!
"autocmd QuickFixCmdPost * nested cwindow | redraw!
nnoremap <silent> <C-C> :CoffeeCompile vert <CR><C-w>h
