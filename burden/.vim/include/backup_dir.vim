"----------------------------------------------
"  Backup and swap
"----------------------------------------------

" Backup directory
set backup
set backupdir="~/.vimbackup/"
let &backupskip="/private/tmp/*," . &backupskip

" Swap directory
set noswapfile
""set directory=~/.vim/swap/

" Put backup files to
"
" ~/.vim/backup/DATE/PATH/TO/FILE
"
" If you manage many projects in common dir,
" this make easy to find changes at that day.
"
au BufWritePre * call BackupAppendSuffix()

" BackupAppendSuffix :: Nothing
"
" Change backupdir and backupextension
"
function! BackupAppendSuffix()
  " Trying...
  let date = strftime("%Y%m%d")
  let time = strftime("%H%M%S")
  let datetime = date."-".time
  let cur_cwd = getcwd()
  let pardir = substitute(cur_cwd, '^/', "", "g")
  let backupdir = GetUserHomePath()."/.vimbackup/"
  let curbackupdir = backupdir.date."/".substitute(cur_cwd, '^/', "", "g")

  " Check existance of `Today's` directory.
  if !isdirectory(expand(curbackupdir))
    echo 'Creating new backupdir -> '.curbackupdir
    call mkdir(fnameescape(curbackupdir), 'p')
  endif

  " Override backupdir
  exe "set backupdir=".expand(curbackupdir)

  let &bex='-' . expand(datetime) . '.vimbackup'
endfunction

