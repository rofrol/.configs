" vim:fdm=marker
" Links {{{
" http://usevim.com/2012/05/09/clean-vimrc/
" https://wiki.archlinux.org/index.php/Vim/.vimrc
" http://vim.wikia.com/wiki/Example_vimrc
" http://amix.dk/vim/vimrc.html
" http://nvie.com/posts/how-i-boosted-my-vim/
" }}}
" Main {{{
" reload config, show error on fold marker, but works
map <F10> :source $HOME/.vimrc<CR>

" These options and commands enable some very useful features in Vim, that
" no user should have to live without.

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on

" Enable syntax highlighting
syntax on

" clear highligting
nmap <Backspace> :noh<CR>

" http://www.reddit.com/r/vim/comments/19izuz/whats_your_wildmode/
set wildmode=longest,list " show menu

" I don't how what it does. Investigate
" set completeopt=menuone,preview

" switch buffer even if modified http://vim.wikia.com/wiki/Easier_buffer_switching
set hidden

" on some machine the defaults are bad
" http://stackoverflow.com/questions/11560201/backspace-key-not-working-in-vim-vi
set backspace=indent,eol,start

set showcmd
set showmode

" when forgot to sudo before editing a file that requires root privileges
cmap w!! w !sudo tee % >/dev/null

" Ignore compiled files
set wildignore=*.o,*~,*.pyc,*.class,*.swp

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <F3> :tabedit <c-r>=expand("%:p:h")<cr><cr>

set acd

" http://stackoverflow.com/questions/1444322/how-can-i-close-a-buffer-without-closing-the-window
map <C-d> :bp<bar>sp<bar>bn<bar>bd<CR>

" Pokaz niekompletne paragrafy nawet jesli nie mieszcza sie na ekranie
" (unikniemy znakow @)
set display+=lastline

if has("autocmd")
  " http://people.smu.edu/jrobinet/howto/customize-vim.asp 
  " Podczas edycji pliku zawsze przeskakuj do ostatniej znany pozycji kursora.
  " Nie rob tego gdy pozycja jest bledna lub gdy wewnatrz uchwytu zdarzenia
  " (zdarza sie podczas upuszczania pliku na gvim). 
  autocmd BufReadPost * 
    \ if line("'\"") > 0 && line("'\"") <= line("$") | 
    \   exe "normal g`\"" | 
    \ endif 
endif " has("autocmd")

nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk

nmap <F5> :call LevelingDay()<CR>
imap <F5> <C-o>:call LevelingDay()<CR>
nmap <F6> :call LevelingEntry()<CR>
imap <F6> <C-o>:call LevelingEntry()<CR>
" }}}
" Vundle {{{
" git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
" https://github.com/gmarik/vundle
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
"Bundle 'tpope/vim-fugitive'
"Bundle 'Lokaltog/vim-easymotion'
"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" vim-scripts repos
"Bundle 'L9'
"Bundle 'FuzzyFinder'
" non github repos
"Bundle 'git://git.wincent.com/command-t.git'
" git repos on your local machine (ie. when working on your own plugin)
"Bundle 'file:///Users/gmarik/path/to/plugin'
Bundle 'scrooloose/nerdtree'
map <F5> :NERDTreeToggle<CR>


filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..
" }}}
" Folding {{{
" zR to open all folds
" zM to close all folds
" http://vim.wikia.com/wiki/Folding
" http://superuser.com/questions/267407/best-code-folding-plugin-for-python-in-vim
" http://stackoverflow.com/questions/5074191/vim-fold-top-level-folds-only
" http://superuser.com/questions/278442/how-to-make-vim-not-fold-everything-automatically
inoremap <F1> <C-O>za
nnoremap <F1> za
onoremap <F1> <C-C>za
vnoremap <F1> zf
" }}}
" Syntastic {{{
" Syntax checkers with plugins for architecture for many langs
Bundle 'scrooloose/syntastic'
" :he syntastic
" http://blog.thomasupton.com/2012/05/syntastic/
" To get actual settings
" :SyntasticInfo
" To navigate on errors list, enter on element to jump there
" :Errors
" Next error :lnext
" Prev error :lprev

":SyntasticToggleMode
":SyntasticCheck
let g:syntastic_mode_map = { 'mode': 'active',
			   \ 'active_filetypes': ['ruby', 'php'],
			   \ 'passive_filetypes': ['puppet'] }

map <F4> :SyntasticToggleMode<CR>

" By default, the location list is changed only when you run the :Errors
" command, in order to minimise conflicts with other plugins. Set this if you want the
" location list to always be updated when you run the checkers
let g:syntastic_always_populate_loc_list=1
let g:syntastic_check_on_open=1 " check on open
let g:syntastic_enable_signs=1 " marks on left showing errors, warnings

" https://github.com/scrooloose/syntastic/issues/542
"let g:syntastic_enable_signs=0
"let g:syntastic_echo_current_error=0
"set nocuc nocul lazyredraw
" }}}
" Python {{{
" http://sudoers-d.com/blog/2013/01/18/installing-vim-on-centos-6-dot-3/
" https://gist.github.com/cfddream/1150782
Bundle 'hynek/vim-python-pep8-indent'
" or this http://www.vim.org/scripts/script.php?script_id=3461
"Bundle 'klen/python-mode'

" Sytnastic
" cave resolve pip -x
" pip install flake8
"let g:syntastic_python_checkers = ['flake8']
" ~/.config/flake8
" http://flake8.readthedocs.org/en/latest/config.html

" http://stackoverflow.com/questions/16570737/auto-indent-doesnt-work-when-using-vim-coding-python
" http://stackoverflow.com/questions/65076/how-to-setup-vim-autoindentation-properly-for-editing-python-files-py
" http://stackoverflow.com/questions/1675688/make-vim-show-all-white-spaces-as-a-character
" tabs
"autocmd FileType python setl ts=4 sts=4 sw=4 tw=0 wm=0 sta noet
" spaces
" http://www.python.org/dev/peps/pep-0008/#indentation
" Use 4 spaces per indentation level
" sts - makes VIM see multiple space characters as tabstops, and so <BS> does
" the right thing and will delete four spaces
" http://www.vex.net/~x/python_and_vim.html
"
" smartindent has been replaced by cindent which "Works more cleverly",
" although still mainly for languages with C-like syntax
" http://stackoverflow.com/a/234578/588759
autocmd FileType python setl expandtab cindent ts=4 sw=4 sts=4 ai
autocmd FileType python setl tw=160 wm=5 fo=cqt list lcs=eol:\ ,tab:·\ 
	\ cinwords=if,elif,else,for,while,try,except,finally,def,class
	\ fdm=indent foldignore= foldnestmax=9 foldlevelstart=0
" }}}
" Ruby {{{
autocmd FileType ruby setl expandtab cindent ts=4 sw=4 sts=4 ai
autocmd FileType ruby setl tw=160 wm=5 fo=cqt list lcs=eol:\ ,tab:·\ 
	\ cinwords=if,elif,else,for,while,try,except,finally,def,class
	\ fdm=syntax foldignore= foldnestmax=10 foldlevelstart=0
" }}}
" Bash {{{
" set syntax highlighting default to bash for ft=sh
" http://stackoverflow.com/questions/7450395/vim-inconsistently-syntax-highlighting-bash-files
let g:is_bash=1

" for some file vim set ft=conf instead of sh
" http://stackoverflow.com/questions/8890668/how-to-make-vim-detect-filetype-from-shebang-line
if did_filetype()
    finish
endif
if getline(1) =~# '^#!.*/bin/env\s\+bash\>'
    setfiletype sh
endif
" }}}
" Go {{{
filetype off
filetype plugin indent off
set runtimepath+=$GOROOT/misc/vim
filetype plugin indent on
syntax on
autocmd FileType go setl ts=4 sw=4
" }}}
" Rust {{{
Bundle 'wting/rust.vim'
" because hercules ext is also rs
au BufRead,BufNewFile *.rs,*.rc set filetype=rust
" }}}
" XML {{{
" http://www.jroller.com/lmchung/entry/xml_folding_with_vim

" http://vim.wikia.com/wiki/Forcing_Syntax_Coloring_for_files_with_odd_extensions
" if the filetype was not detected at all
au BufRead,BufNewFile *.xsd setfiletype xml
" override any filetype which was already detected
au BufRead,BufNewFile *.xsd set filetype=xml
let g:xml_syntax_folding=1
au FileType xml setlocal foldmethod=syntax
" }}}
" Backup {{{
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
" }}}
" Paste {{{
" http://vim.wikia.com/wiki/Toggle_auto-indenting_for_code_paste
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
" }}}
" Colors and Diff {{{
"http://itszero.github.io/blog/2012/04/19/the-solarized-dark-vim/
"http://ethanschoonover.com/solarized/vim-colors-solarized
Bundle 'altercation/vim-colors-solarized'
if &t_Co >= 256 || has("gui_running")
	set background=dark
	colorscheme solarized
endif

" http://stackoverflow.com/questions/16840433/forcing-vimdiff-to-wrap-lines
au VimEnter * if &diff | execute 'windo set wrap' | endif

" There's some problem with solarized bg color in diff
" http://stackoverflow.com/questions/2019281/load-different-colorscheme-when-using-vimdiff/2019401#2019401
" au FilterWritePre * if &diff | colorscheme koehler | endif

" http://stackoverflow.com/questions/2019281/load-different-colorscheme-when-using-vimdiff/11593961#11593961
" http://stackoverflow.com/questions/6496778/vim-run-autocmd-on-all-filetypes-except
fun! SetDiffColors()
	if &diff
		highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
		highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
		highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
		highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red
	endif
endfun

au FilterWritePre * call SetDiffColors()
" }}}
" Search {{{
set incsearch
set hlsearch
" }}}
" Recover {{{
command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis
" }}}
" Wrap {{{
" http://stackoverflow.com/questions/2280030/how-to-stop-line-breaking-in-vim/2280128#2280128
" this enables "visual" wrapping
set wrap
" this turns off physical line wrapping (ie: automatic insertion of newlines)
set textwidth=0 wrapmargin=0
" }}}
" History {{{
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
" Tell vim to remember certain things when we exit
" " '10 : marks will be remembered for up to 10 previously edited files
" " "100 : will save up to 100 lines for each register
" " :100 : up to 20 lines of command-line history will be remembered
" " % : saves and restores the buffer list
" " n... : where to save the viminfo files
" "
" http://vim.wikia.com/wiki/Restore_cursor_to_file_position_in_previous_editing_session
set viminfo='10,\"100,:20,%,n~/.viminfo

"make vim save and load the folding of the document each time it loads"
"also places the cursor in the last place that it was left."
"http://superuser.com/questions/111016/vim-open-file-at-location-that-was-last-viewed
"http://stackoverflow.com/questions/13510406/vim-folder-listing-cant-reach
"> http://vim.wikia.com/wiki/Make_views_automatic
"au BufWritePost,BufLeave,WinLeave ?* mkview
"au BufReadPre ?* silent loadview
" }}}
" Whitespace at EOL {{{
" http://stackoverflow.com/questions/4617059/showing-trailing-spaces-in-vim
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
nmap <F9> :%s/\s\+$//g<CR>
" }}}
" Status {{{
" http://got-ravings.blogspot.com/2008/08/vim-pr0n-making-statuslines-that-own.htmllways show the statusline
set laststatus=2

" http://vim.1045645.n5.nabble.com/listing-total-number-of-buffers-in-the-statusline-td1189645.html
" http://stackoverflow.com/questions/5547943/display-number-of-current-buffer
" http://stackoverflow.com/questions/5375240/a-more-useful-statusline-in-vim

set statusline=
set stl+=%n/%{len(filter(range(1,bufnr('$')),'buflisted(v:val)'))} " buffer number/buffers
set statusline+=\|%{&paste?'paste':'nopaste'} "paste
set statusline+=\|%{strlen(&fenc)?&fenc:'none'} "file encoding
set statusline+=%{(&bomb?\"\|BOM\":\"\")} "Encoding2
set statusline+=\|%{&ff} "file format
set statusline+=\|%{&filetype} "filetype
set statusline+=\|%f
set statusline+=%h "help file flag
set statusline+=%m "modified flag
set statusline+=%r "read only flag
set statusline+=%= "left/right separator
set statusline+=%c, "cursor column
set statusline+=%l/%L "cursor line/total lines
set statusline+=\ %P "percent through file
set statusline+=\ 0x%04B          "character under cursor

" Status line color
" http://stackoverflow.com/questions/9065941/how-can-i-change-vim-status-line-colour/9121083#9121083
" when terminal type is not xterm-256colors, then 7* would be gray
hi statusline guifg=Black guibg=Cyan ctermfg=10 ctermbg=7

" }}}
" Leveling_up {{{
" http://peterlyons.com/leveling_up
" http://www.adp-gmbh.ch/vim/scripting/script_vars.html
" http://vim.1045645.n5.nabble.com/What-do-I-need-to-read-to-understand-g-and-s-VIM-variable-prefixes-td5711600.html
" To see list of options:
" :he :s^D
let s:h2 = "== "
let s:h3 = "=== "

function LevelingDay()
  " http://vim.wikia.com/wiki/Insert_current_date_or_time
  let date = strftime("%Y-%m-%d")
  put=s:h2.'Day '.date
  put=''
  put=''
endfunction

function LevelingEntry()
  let date = strftime("%Y-%m-%d %H:%M:%S %z")
  put=s:h3.'Entry '.date
  put=''
  put=''
endfunction
" }}}
