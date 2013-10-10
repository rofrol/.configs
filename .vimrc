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

" }}}
" Vundle {{{
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

" By default, the location list is changed only when you run the :Errors
" command, in order to minimise conflicts with other plugins. Set this if you want the
" location list to always be updated when you run the checkers
let g:syntastic_always_populate_loc_list=1
let g:syntastic_check_on_open=1 " check on open
let g:syntastic_enable_signs=1 " marks on left showing errors, warnings
" }}}
" Python {{{
" http://sudoers-d.com/blog/2013/01/18/installing-vim-on-centos-6-dot-3/
" https://gist.github.com/cfddream/1150782
Bundle 'hynek/vim-python-pep8-indent'
" or this http://www.vim.org/scripts/script.php?script_id=3461
"Bundle 'klen/python-mode'

" Sytnastic
" pip install flake8
let g:syntastic_python_checkers = ['flake8']
" ~/.config/flake8
" http://flake8.readthedocs.org/en/latest/config.html

" http://stackoverflow.com/questions/16570737/auto-indent-doesnt-work-when-using-vim-coding-python
" http://stackoverflow.com/questions/65076/how-to-setup-vim-autoindentation-properly-for-editing-python-files-py
" http://stackoverflow.com/questions/1675688/make-vim-show-all-white-spaces-as-a-character
set cindent
" tabs
"autocmd FileType python setl ts=4 sts=4 sw=4 tw=0 wm=0 sta noet
" spaces
autocmd FileType python setl expandtab
autocmd FileType python setl tw=160 wm=5 fo=cqt list lcs=eol:\ ,tab:·\ 
	\ cinwords=if,elif,else,for,while,try,except,finally,def,class
	\ fdm=indent foldignore= foldnestmax=2 foldlevelstart=0
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
" Diff {{{
" http://stackoverflow.com/questions/16840433/forcing-vimdiff-to-wrap-lines
au VimEnter * if &diff | execute 'windo set wrap' | endif
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
" Colors {{{
"http://itszero.github.io/blog/2012/04/19/the-solarized-dark-vim/
"http://ethanschoonover.com/solarized/vim-colors-solarized
Bundle 'altercation/vim-colors-solarized'
if &t_Co >= 256 || has("gui_running")
	set background=dark
	colorscheme solarized
endif
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
au BufWritePost,BufLeave,WinLeave ?* mkview
au BufReadPre ?* silent loadview
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
