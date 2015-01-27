runtime bundle/pathogen/autoload/pathogen.vim " necessary because Pathogen is submodule
execute pathogen#infect()

syntax on
filetype plugin indent on

" use 'f' to toggle filter
let NERDTreeIgnore = ['\.DS_Store', '\.gz', '\.sass-cache', '\.ico$', '\.jpg$', '\.jpeg$', '\.png$', '\.PNG$', '\.gif$', '\.ttf$', '\.otf$', '\.eot$', '\.woff$']

let $JS_CMD='node'
let html_no_rendering=1
let mapleader=","
set term=screen-256color
set viminfo=""
set noswapfile
set showmatch
"set nocursorline
set cursorline
set cursorcolumn
set nocompatible
set backspace=2
set expandtab
set softtabstop=2
set shiftwidth=2
set smarttab
set autoindent
set smartindent
set ai
set nohlsearch
set mouse=a
set visualbell
set nu
set ruler
set nowrap
set linebreak
set showcmd
set smartcase
set incsearch
set scrolloff=2
set nolist
set wildmenu
set wildmode=longest,list
set shortmess+=I
set clipboard=unnamed
set nofoldenable
set showmode
set background=dark
colorscheme base16-twilight
set omnifunc=syntaxcomplete#Complete
"set synmaxcol=120
set tags+=gems.tags

set encoding=utf-8
setglobal fileencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,latin1

" Toggle paste mode
nnoremap <C-P> :set invpaste paste?<CR>

nnoremap <F5> "=strftime("%Y-%m-%d")<CR>P
inoremap <F5> <C-R>=strftime("%Y-%m-%d")<CR>

" set j/k keys to treat wrapped lines as multiple rows
nnoremap j gj
nnoremap k gk

" place cursor in middle after search and end-of-paragraph
nnoremap n nzz
nnoremap N Nzz
nnoremap } }zz
nnoremap { {zz

nmap <buffer> ;e <Plug>(xmpfilter-run)
xmap <buffer> ;e <Plug>(xmpfilter-run)
imap <buffer> ;e <Plug>(xmpfilter-run)

nmap <buffer> ;d <Plug>(xmpfilter-mark)
xmap <buffer> ;d <Plug>(xmpfilter-mark)
imap <buffer> ;d <Plug>(xmpfilter-mark)

let g:mustache_abbreviations = 1

:map <F7> :setlocal spell! spelllang=en_us<CR>

" toggle comments
map // <plug>NERDCommenterToggle

map ;b :!open -a Safari %<CR><CR>

" remap jj to escape
inoremap jj <ESC>

" remap autocomplete navigation to j/k keys
inoremap <expr> j ((pumvisible())?("\<C-n>"):("j"))
inoremap <expr> k ((pumvisible())?("\<C-p>"):("k"))

" yank to end of line
nnoremap Y y$

" Clear screen clears search highlighting.
nnoremap <C-L> :nohl<CR><C-L>

" set filetype to Ruby with :FR
command! FR set filetype=ruby

map <C-K> :let &background = ( &background == "dark"? "light" : "dark" )<CR>

" Shortcut to rapidly toggle `set list`
nmap <leader>ll :set list!<CR>
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬,trail:.
set list listchars=tab:▸\ ,trail:.

" Turn off validation on save for certain types
let g:syntastic_mode_map = { 'mode': 'active',
  \ 'active_filetypes': [],
  \ 'passive_filetypes': ['coffee', 'html'] }

" Remove trailing white-space
function! <SID>StripTrailingWhitespaces()
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  %s/\s\+$//e
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

function! ToggleCoffeeCompilation()
  if exists("g:coffee")
    echo "Coffee compilation disabled"
    unlet g:coffee
  else
    echo "Coffee compilation enabled"
    let g:coffee=1
  endif
endfunction

nmap <silent>;c :call ToggleCoffeeCompilation()<cr>
" pull up most recent docs
nmap <silent>;r :MRU<cr>

" tagbar
let g:tagbar_autofocus = 1
nmap <silent>;; :TagbarOpenAutoClose<CR>
"nmap <silent>;; :TagbarToggle<CR>
nmap <silent>;w :set wrap!<CR>
nmap <silent>;m :MarkedOpen!<CR>

if has("autocmd")
  "autocmd BufWritePre FileType ruby :call <SID>StripTrailingWhitespaces()
  " if global custom variable "coffee" is set (using let)
  autocmd BufWritePost,FileWritePost *.coffee if exists("g:coffee") | :silent !coffee -c <afile>
  autocmd BufWritePost *.swift :make
endif

" format hamlc files as haml
au BufRead,BufNewFile *.hamlc set ft=haml

map <C-b> :!open -a Safari %<cr>

" Command-Shift-F for Ack
map <C-F> :Ack -i<space>

map + :cnext<CR>
map _ :cprevious<CR>
"map + :cnfile<CR>
"map _ :cpfile<CR>

" CommandT with double-comma
let g:ctrlp_map = ',,'

" toggle NERDTree
map \\ :NERDTreeToggle<CR>

" change window
map <leader>ww :winc w<cr>

" quickfix open
map <leader>aa :cope<cr>
" close
map <leader>vv :ccl<cr>

" Emmet / Zen Coding
let g:user_emmet_install_global = 0
autocmd FileType html,css,php EmmetInstall
let g:user_emmet_leader_key = '<c-y>'
"let g:user_emmet_leader_key = 'm'
let g:user_emmet_settings = {
  \  'indentation' : '  '
  \}

" alt-shift + h,j,k,l keys
map <silent>Ó :vertical res -10<CR>
map <silent> :res -10<CR>
map <silent>Ô :res +10<CR>
map <silent>Ò :vertical res +10<CR>
map <silent> ˙ <C-w><
map <silent> ∆ <C-W>-
map <silent> ˚ <C-W>+
map <silent> ¬ <C-w>>

let g:rspec_command = 'call Send_to_Tmux("rspec {spec}\n")'
"let g:rspec_command = '!rspec spec --drb --drb-port 8988'
" vim-rspec mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

function! SourceConfig()
  if filereadable(".config.vim")
    echo "Loading config.vim..."
  endif
endfunction

nmap <Leader>c :source %:p:h/.config.vim<CR>
nmap <Leader>x :!chmod a+x %<CR>

if executable('coffeetags')
  let g:tagbar_type_coffee = {
        \ 'ctagsbin' : 'coffeetags',
        \ 'ctagsargs' : '',
        \ 'kinds' : [
        \ 'f:functions',
        \ 'o:object',
        \ ],
        \ 'sro' : ".",
        \ 'kind2scope' : {
        \ 'f' : 'object',
        \ 'o' : 'object',
        \ }
        \ }
endif

" python-mode
map <leader>g :call RopeGotoDefinition()<CR>
let ropevim_enable_shortcuts = 1


" toggle colored right border after 80 chars
let s:color_column_old = 81

function! s:ToggleColorColumn()
    if s:color_column_old == 0
        let s:color_column_old = &colorcolumn
        windo let &colorcolumn = 0
    else
        windo let &colorcolumn=s:color_column_old
        let s:color_column_old = 0
    endif
endfunction

nnoremap ;l :call <SID>ToggleColorColumn()<CR>

autocmd FileType javascript,css nmap <silent> ,; :call cosco#commaOrSemiColon()<CR>
autocmd FileType javascript,css inoremap <silent> ,; <ESC>:call cosco#commaOrSemiColon()"<CR>a

let g:CoffeeAutoTagDisabled=0         " Disables autotaging on save (Default: 0 [false])
"let g:CoffeeAutoTagFile=<filename>       " Name of the generated tag file (Default: ./tags)
let g:CoffeeAutoTagIncludeVars=0  " Includes variables (Default: 0 [false])
"let g:CoffeeAutoTagTagRelative=<0 or 1>  " Sets file names to the relative path from the tag file location to the tag file location (Default: 1 [true])

" Incr function will add numbers in search and replace
" Usage: %s/change@me/\="change@me" . Incr()/
" \= is the special magic combo for interpolation
let g:incr = 7000
function! Incr()
  let g:incr = g:incr + 1
  return g:incr
endfunction
