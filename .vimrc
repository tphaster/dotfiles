" =======================================================
" Description: Configuration file for Vi Improved       =
" Author:      Tomasz Pieczerak <tphaster AT gmail.com> =
" =======================================================

scriptencoding utf-8

"== General settings =="

set nocompatible    " make Vim behave in a more useful way (and no Vi-compatile)

" Mouse settings "
set mouse=a         " enable the use of the mouse in all modes
set ttymouse=xterm2 " enable mouse for XTerm terminals


"== Language and encoding =="

set encoding=utf-8          " character encoding used inside Vim
set fileencoding=utf-8      " default character encoding for new files
set termencoding=utf-8      " character encoding used in terminal
set fileencodings=ucs-bom,utf-8,latin2,default  " prefer latin2 over latin1

" print messages in a portable locale (with UTF-8 encoding if available)
if empty(system("locale -a | grep -i C.UTF-8"))
	language messages C
else
	language messages C.UTF-8
endif


" == Plugins == "
if $USER != "root"
	if empty(glob('~/.vim/autoload/plug.vim'))
		silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
			\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
		autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
	endif

	call plug#begin('~/.vim/bundle')
		Plug 'bling/vim-airline'
		Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
		Plug 'tpope/vim-eunuch'
		Plug 'tmux-plugins/vim-tmux'

		" Editing
		Plug 'tpope/vim-surround'
		Plug 'vim-scripts/Smart-Tabs'

		" Git
		Plug 'tpope/vim-fugitive'
		Plug 'airblade/vim-gitgutter'

		" C++
		Plug 'octol/vim-cpp-enhanced-highlight'
	call plug#end()
endif


" == Other settings == "

" fix &term variable if 'screen' or other program changed it
if &term == "screen-bce" || &term == "screen" || &term == "xterm"
	let &term = "xterm-256color"
endif

" Set color scheme "
if &term == "linux"     " probably this is a very primitive terminal
	set background=dark
else
	if ! has("gui_running")
		let g:inkpot_black_background = 1
	endif
	colorscheme inkpot-tph
endif


"== Saving/file settings =="

set nobackup        " remove backup file after the file has been written
set confirm         " raise a dialog when trying to abandon changes etc.
set hidden          " hide buffers instead of unloading
set updatetime=300  " how often swap files will be written to disk [ms]

if has('persistent_undo')
	set undofile                    " save undo history to files
	set undodir=~/.vim/undofiles    " in ~/.vim/undofiles directory
endif

if has('autocmd')
	" Jump to the last known position in a file just after opening it "
	autocmd BufReadPost * call SetCursorPosition()
	function! SetCursorPosition()
		if line("'\"") > 0 && line("'\"") <= line("$")
			exe "normal! g'\""
		endif
	endfunction

	" Enter Insert mode when editing a new file "
	autocmd BufNewFile * startinsert

	" Do no allow any modifications on read-only files "
	autocmd BufReadPost * call CheckReadonly()
	function! CheckReadonly()
		if version >= 600
			if &readonly
			setlocal nomodifiable
			endif
		endif
	endfunction
endif


"== Display settings =="

set ruler               " always show cursor position
set signcolumn=yes      " always show sign column
set showcmd             " how (partial) commands in the last line of the screen
set laststatus=2        " always show status line
set title               " set window title
set shortmess+=I        " don't give the intro message on start
set scrolloff=5         " minimal number of lines above/below cursor
set novisualbell        " no visual bell, please
set nowrap              " do no wrap long lines
set display+=lastline   " display as much as possible of the last line

if has('syntax')
	set colorcolumn=+2  " highlight the 2nd column after 'textwidth'
endif

" Set appropriate characters for :list command (utf-8 or ascii) "
if (&termencoding ==# 'utf-8' || &encoding ==# 'utf-8')
	set listchars=tab:►–,trail:⋅,extends:▷,precedes:◁,nbsp:~
else
	set listchars=tab:>-,trail:~,extends:>,precedes:<,nbsp:~
endif


"== Editing settings =="

if has('autocmd')
	filetype on
	filetype plugin indent on
endif

if has('syntax')
	syntax on
	set spelllang=pl,en     " Polish/English spell checking
endif

set backspace=indent,eol,start  " allow <BS>, <Del> on everything

set autoread        " read open files again when changed outside Vim
set history=100     " : commands and search patterns history size

set hlsearch        " highlight all search patterns
set incsearch       " find and show matching string while typing
set ignorecase      " ignore case in search patterns
set smartcase       " don't ignore case if patter contains upper case chars

set showmatch       " when bracket is inserted, show the matching one
set matchtime=2     " show matching bracket for 0.2 seconds

set formatoptions+=1    " move one-letter word to the next line
set formatoptions+=j    " remove a comment leader when joining lines

set wildmenu                            " choose from menu
set wildmode=longest:full,list:full     " behave like Bash completion
set wildignore=*.o,*.pyc,*~,*.swp,*.bak " ignore on <Tab> completion

" Tabs and indentation "
set autoindent      " copy indent from current line when starting a new line
set smarttab        " smarter tabs behaviour
set noexpandtab     " use actual <Tab> for indentation
set tabstop=4       " size of <Tab> character (in spaces)
set shiftwidth=4    " number of spaces to use for each step of (auto)indent

" Folding "
set nofoldenable                " folds not enabled by default
set foldmethod=indent           " indent based folding
set foldmarker={,}              " treat { and } as markers
set fillchars="vert:|,fold:="   " characters to fill status lines
set foldnestmax=5               " maximum nesting of folds (for indent method)
set foldminlines=3              " minimum number of lines for a fold
set foldtext=MyFoldIndent()     " text displayed when fold is closed

function! FoldTextIndent()  " for indent based folding
	return '    +=== ' . (v:foldend-v:foldstart+1) . ' lines folded '
endfunction

function! FoldTextMarker()  " for marker based folding
	let line = foldtext()
	return substitute(line, '{\ \/\/\ \d\=', '', 'g')
endfunction

function! FoldToggle()  " fold toggle with setting foldcolumn
	if &foldenable
		set foldcolumn=0
		set nofoldenable
	else
		set foldcolumn=1
		set foldenable
	endif
endfunction

" Auto-completion "
set complete-=i         " do not scan current and included files
set completeopt=menuone,menu,longest,preview

autocmd CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif

" Tags "
setglobal tags=./tags;~/

" Filetype-specific settings "
autocmd FileType text,tex setlocal textwidth=78 spell
autocmd FileType help setlocal nospell
autocmd FileType svn,*commit* setlocal spell
autocmd FileType svn,*commit* call setpos('.', [0, 1, 1, 0])
autocmd FileType xml,html,xhtml,css setlocal noexpandtab tabstop=2 shiftwidth=2 textwidth=78 formatoptions-=t spell

"== Shortcuts/commands =="

" \ev, \sv - quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" w!! - gain root privileges and write file
cmap w!! w !sudo tee % >/dev/null

" Q - don't use Ex mode, use Q for formatting
map Q gq

" F2 - toggle show whitespace characters
map  <silent> <F2> <Esc>:set list!<CR>
imap <silent> <F2> <C-O>:set list!<CR>

" F3 - toggle folds
map  <silent> <F3>   <Esc>:call FoldToggle()<CR>
imap <silent> <F3>   <C-O>:call FoldToggle()<CR>

" F4 - toggle NERD_Tree
if $USER != "root"
	map  <silent> <F4> <Esc>:NERDTreeToggle<CR>
	imap <silent> <F4> <C-O>:NERDTreeToggle<CR>
endif

" F5 - toggle paste-mode
set pastetoggle=<F5>

" F6 - toggle spell checking
map  <silent> <F6>    <Esc>:setlocal spell!<CR>
imap <silent> <F6>    <C-O>:setlocal spell!<CR>

" F7 - run make
map  <silent> <F7>    <Esc>:make<CR>
imap <silent> <F7>    <C-O>:make<CR>

" Fast buffer switching
map  <silent> <leader>.   <Esc>:bn<CR>
imap <silent> <leader>.   <Esc>:bn<CR>
map  <silent> <leader>,   <Esc>:bp<CR>
imap <silent> <leader>,   <Esc>:bp<CR>

map  <silent> <leader>1   <Esc>:b1<CR>
imap <silent> <leader>1   <Esc>:b1<CR>
map  <silent> <leader>2   <Esc>:b2<CR>
imap <silent> <leader>2   <Esc>:b2<CR>
map  <silent> <leader>3   <Esc>:b3<CR>
imap <silent> <leader>3   <Esc>:b3<CR>
map  <silent> <leader>4   <Esc>:b4<CR>
imap <silent> <leader>4   <Esc>:b4<CR>
map  <silent> <leader>5   <Esc>:b5<CR>
imap <silent> <leader>5   <Esc>:b5<CR>
map  <silent> <leader>6   <Esc>:b6<CR>
imap <silent> <leader>6   <Esc>:b6<CR>
map  <silent> <leader>7   <Esc>:b7<CR>
imap <silent> <leader>7   <Esc>:b7<CR>
map  <silent> <leader>8   <Esc>:b8<CR>
imap <silent> <leader>8   <Esc>:b8<CR>
map  <silent> <leader>9   <Esc>:b9<CR>
imap <silent> <leader>9   <Esc>:b9<CR>


"== Plugin settings =="

if $USER != "root"
	" Smart-Tabs "
	let g:ctab_disable_checkalign = 1   " disable re-check of alignment
	" NERD_Tree "
	let g:NERDTreeCaseSensitiveSort = 1 " sort case-sensitively
	let g:NERDTreeMouseMode         = 3 " single click open any node (dir/file)
	let g:NERDTreeDirArrows         = 1 " use arrows instead of old-school chars
	" ignore some non-editable files
	let g:NERDTreeIgnore            = ['\~$', '\.o$', '\.lo$', '^moc_', '^ui_']

	" vim-arline "
	let g:airline_theme                      = 'dark'
	let g:airline_powerline_fonts            = 1
	let g:airline#extensions#tabline#enabled = 1
endif

"== Local settings =="
if filereadable(glob("~/.vimrc_local"))
	source ~/.vimrc_local
endif
