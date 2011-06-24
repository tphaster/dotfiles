" ====================================================
" Description: Configuration file for Vi Improved    =
" Author:      Tomasz Pieczerak <tphaster gmail.com> =
" Last Change: Fri, 24 Jun 2011 14:47:14 CEST        =
" ====================================================

scriptencoding iso-8859-2   " kodowanie pliku konfiguracyjnego

set nocompatible        " uzyj ustawien Vim'a (w przeciwnym wypadku beda to znacznie ubozsze ustawienia vi)
set mouse=a             " umozliwia uzywanie myszy
set ttymouse=xterm2     " obsluga myszy m.in dla screen'a

" ustawiania jezyku na polski i jezyku komunikatow na angielski
language pl_PL
language messages en_US

" kodowanie znakow
set fencs=iso-8859-2    " zapisywanie wszystkich nowych plikow w tym kodowaniu
set tenc=iso-8859-2     " kodowanie terminala

" slowniki
set spelllang=pl,en    " sprawdzanie pisowni dla jezykow pl i en
map  <silent><F6>    :setlocal spell!<CR>
imap <silent><F6>    <ESC>:setlocal spell!<CR>i<right>

set backspace=indent,eol,start  " pozwoj na uzywanie <BS> na wszystkim

set writebackup     " tworz kopie zapasowe podczas edycji
set nobackup        " nie przechowuj kopii zapasowych zapisanych plikow
set confirm         " pytaj co robic z niezapisanymi/tylko-do-odczytu plikami

set ruler           " zawsze wyswietlaj pozycje kursora
set showcmd         " wyswietlaj niekompletne komendy
set showmode        " pokazje tryb w jakim jestesmy
set showmatch       " pokazuj pasujace nawiasy
set laststatus=2    " zawsze pokazuj status
set title           " tytul okna

set shortmess+=I    " wylacza powitanie

" ustawienia schematu kolorow
if has('gui')
  colorscheme inkpot
else
  if &term == "linux"
    set background=dark
  else
    colorscheme inkpot-tph
  endif
endif

" fix &term variable if screen changed it
if &term == "screen-bce" || &term == "screen"
  let &term = "xterm-256color"
endif

" nie uzywaj trybu Ex, uzyj Q do formatowania
map Q gq

syntax on       " wlacz podswietlanie skladni
"set hlsearch    " wlacz podswietlanie ostatniego szukanego wyrazu

set noautoindent    " wylacz auto-wciecia

filetype on         " wlacz rozpoznawanie typu pliku
filetype plugin on  " wlacz obsluge pluginow
filetype indent on  " wlacz automatyczne wciecia zalezne od typu pliku

" dla wszystkich plikow tekstowych ustaw dlugosc linii na 78 znakow
autocmd FileType text,tex setlocal textwidth=78 autoindent

" zaden z tych znakow nie powinien byc znakiem dzielacym wyrazy
set iskeyword+=_,$,@,%,#

" podczas edycji plikow przeskakuj do ostatniej zapamietanej pozycji
" nie rob tego jesli pozycja jest nieprawidlowa lub jesli jest w 'event handler'
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

" ustawienia numerowanie wierszy
set nonumber        " standardowo wylacz numerowanie

" wlaczanie/wylaczanie numerowania za pomoca <F2>
map <F2> :set nu!<CR>
imap <F2> <C-O>:set nu!<CR>

" uzupelnianie skladni
imap <C-Z> <C-X><C-K>

set history=100        " pamietaj ostatnie 50 komend i 50 ostatnich wzrocow szukania

set matchtime=2        " ile dziesiatych sekundy nawiasy maja byc podswietlone
set incsearch          " szukaj juz podczas wpisywania

set scrolloff=5        " minimalna ilosc linii przed i po kursorze (przewijanie)
set novisualbell       " nie mrugaj
set nowrap             " nie zawijaj dlugich linii
set formatoptions+=1   " przenosi pojedyncze literki do nowego wiersza

" ustawienia zachowania tabulacji
set expandtab        " nie uzywaj tabulacji!
set tabstop=8        " szerokosc tabulatora <Tab>
set softtabstop=4    " ile spacji wstawiac zamiast tabulacji
set shiftwidth=4     " ilosc spacji, ktore maja byc wpisane zamiast <Tab>

" ustawienia zwijania linii
set foldmethod=indent
"set foldmethod=marker
"set foldmarker={,}
set fillchars-=fold:-
set fillchars+=fold:=
set foldnestmax=1
set foldtext=MyFoldText()
set nofoldenable

" zwijanie linii na podstawie wciec
function MyFoldText()
    return '    +=== ' . (v:foldend-v:foldstart+1) . ' lines folded '
endfunction

" zwijanie linii na podstawie znacznikow
"function MyFoldText()
"    let line = foldtext()
"    return substitute(line, '{\ \/\/\ \d\=', '', 'g')
"endfunction

" podswietlanie sql i html w stringach dla php
let php_sql_query=1
let php_htmlInStrings=1

" korzysta ze styli css dla plikow html
let html_use_css=1

" podswietlaj zaawansowane zmienne Perla w stringach
let perl_extended_vars=1

" ustawia uzupelnianie w linii polecen. Dzieki temu <Tab> zawsze wyswietli
" liste mozliwosci a nie jedna wartosc naraz
set wildmode=longest,list
set wildmenu

" Zaczynaj nowy plik w trybie Insert
autocmd BufNewFile * startinsert

" Nie pozwalaj na zadne modyfikacje plikow tylko do odczytu.
au BufReadPost * :call CheckReadonly()
function! CheckReadonly()
  if version >= 600
     if &readonly
       setlocal nomodifiable
     endif
  endif
endfunction

" ustawienia dla c.vim
map  <silent> <F7>   <Esc>:cp<CR>
imap <silent> <F7>   <Esc>:cp<CR>
map  <silent> <F8>   <Esc>:cn<CR>
imap <silent> <F8>   <Esc>:cn<CR>
map  <silent> <F10>   <Esc>:make<CR>
imap <silent> <F10>   <Esc>:make<CR>

" ustawienia dla MiniBufExplorera
let g:miniBufExplUseSingleClick = 1     " zmiana buforu jednym kliknieciem
let g:miniBufExplModSelTarget = 1
let g:miniBufExplMapWindowNavVim = 1    " zmiana okien za pomoca Ctrl + [hjkl]
let g:miniBufExplMaxSize = 2            " maksymalnie 2 linie

map  <silent> <F3>   <Esc>:TMiniBufExplorer<CR><Esc>
imap <silent> <F3>   <Esc>:TMiniBufExplorer<CR>

" szybka zmiana buforow
map  <silent> \.   <Esc>:bn!<CR>
imap <silent> \.   <Esc>:bn!<CR>
map  <silent> \,   <Esc>:bp!<CR>
imap <silent> \,   <Esc>:bp!<CR>

map  <silent> \1   <Esc>:b!1<CR>
imap <silent> \1   <Esc>:b!1<CR>
map  <silent> \2   <Esc>:b!2<CR>
imap <silent> \2   <Esc>:b!2<CR>
map  <silent> \3   <Esc>:b!3<CR>
imap <silent> \3   <Esc>:b!3<CR>
map  <silent> \4   <Esc>:b!4<CR>
imap <silent> \4   <Esc>:b!4<CR>
map  <silent> \5   <Esc>:b!5<CR>
imap <silent> \5   <Esc>:b!5<CR>
map  <silent> \6   <Esc>:b!6<CR>
imap <silent> \6   <Esc>:b!6<CR>
map  <silent> \7   <Esc>:b!7<CR>
imap <silent> \7   <Esc>:b!7<CR>
map  <silent> \8   <Esc>:b!8<CR>
imap <silent> \8   <Esc>:b!8<CR>
map  <silent> \9   <Esc>:b!9<CR>
imap <silent> \9   <Esc>:b!9<CR>

" ustawienia dla NERDTree
let g:NERDTreeCaseSensitiveSort = 1
let g:NERDTreeMouseMode = 2

map  <silent> <F4> <Esc>:NERDTreeToggle<CR><Esc>
imap <silent> <F4> <Esc>:NERDTreeToggle<CR><Esc>

" ustawienia dla TagList
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Use_SingleClick = 1

map  <silent> <F5> <Esc>:TlistToggle<CR><Esc>
imap <silent> <F5> <Esc>:TlistToggle<CR><Esc>

" ustawienia dla OmniCppComplete
map <F12> :!ctags -R --c++-kinds=+pl --fields=+iaS --extra=+q .<CR>

let OmniCpp_DisplayMode = 1
let OmniCpp_ShowPrototypeInAbbr = 1
let OmniCpp_DisplayMode = 1
let OmniCpp_LocalSearchDecl = 1
let OmniCpp_SelectFirstItem = 2
let OmniCpp_DefaultNamespaces   = ["std", "_GLIBCXX_STD"]

set completeopt=menuone,menu,longest,preview

" automatycznie otwieraj i zamykaj wyskakujace menu oraz okno podgladu
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
 
