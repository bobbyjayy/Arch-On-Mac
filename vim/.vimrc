""""""""""""""""""""""""""""""
""""""VIM-PLUG-AUTOMATE-DL
""""""""""""""""""""""""""""""
" {{{
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" }}}

"""""""""""""""""""""""""""'
""""""""VIM-PLUG PLUGINS"""""""""""""
""""""""""""""""""""""""""""
" {{{

" Specify a directory for plugins
call plug#begin('~/.vim/bundle')

Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'airblade/vim-gitgutter'
Plug 'sheerun/vim-polyglot'
Plug 'mhinz/vim-startify'
Plug 'ap/vim-css-color'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'crusoexia/vim-monokai'
Plug 'majutsushi/tagbar'
Plug 'junegunn/goyo.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'drewtempelmeyer/palenight.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'vimwiki/vimwiki'
Plug 'morhetz/gruvbox'

call plug#end()


" }}}

""""""""""""""""""""""""""
""""""" GLOBAL""""""""""""
""""""""""""""""""""""""""
" {{{
let &keywordprg=':help'

syntax on
filetype plugin indent on
set omnifunc=syntaxcomplete#Complete
set textwidth=80
"set textwidth=60
set encoding=utf-8
set fenc=
"set fencs=iso-2022-jp,euc-jp,cp932
set relativenumber
set hidden
set showcmd
set nowrap
set backspace=indent,eol,start
set autoindent
set copyindent
set number
set shiftround
set ignorecase
set smartcase
set hlsearch
set incsearch
set history=1000
set undolevels=1000
set title
set visualbell
set noerrorbells
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.
set ttyfast
set mouse=
set nocompatible
set backup
set backupdir=~/.vim_backup
set noswapfile
set fileformats=unix,dos,mac
set laststatus=2
set expandtab
set softtabstop=2 tabstop=2 shiftwidth=2
set ruler
set wildignore=*.swp,*.bak
set wildmode=longest,list
" set cursorline " highlight current line
set showmatch  " highlight matching [{()}]
set foldenable " enable folding
set foldlevelstart=10 " open most folds by default
set foldnestmax=10 "10 nested fold max
"set foldmethod=manual "fold based on indent level
set foldmethod=syntax "fold based on indent level
set modelines=1
set pastetoggle=<F3>
set complete-=i

hi vertsplit ctermfg=238 ctermbg=235
hi LineNr ctermfg=237
hi StatusLine ctermfg=235 ctermbg=245
hi StatusLineNC ctermfg=235 ctermbg=237
hi Search ctermbg=58 ctermfg=15
hi Default ctermfg=1
hi clear SignColumn
hi SignColumn ctermbg=235
hi GitGutterAdd ctermbg=235 ctermfg=245
hi GitGutterChange ctermbg=235 ctermfg=245
hi GitGutterDelete ctermbg=235 ctermfg=245
hi GitGutterChangeDelete ctermbg=235 ctermfg=245
hi EndOfBuffer ctermfg=237 ctermbg=235

set statusline=%=%f\ %m\ %P\ 
set fillchars=vert:\ ,stl:\ ,stlnc:\ 
set laststatus=2
set noshowmode
set background=dark
colorscheme gruvbox 

" }}}

"""""""""""""""""""""""""""""
"""""Coc specific settings"""
"""""""""""""""""""""""""""""
" {{{
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
" }}}


"""""""""""""""""""""""""""""
"""""KEY BINDINGS""""""""""""
"""""""""""""""""""""""""""""
" {{{
nnoremap <leader>s :update<CR>

nmap <TAB> :bn<CR>
nmap <S-TAB> :bp<CR>

"map leader(-) to edit and source vimrc
let mapleader="-"
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

"map jk to go back to normal mode from i
inoremap jk <esc>
inoremap <esc> <nop>

" mapping to execute python code
"nnoremap <buffer> <F9> :exec '!python3' shellescape(@%, 1)<cr>

"mapping to open browser
nnoremap <silent> <F10> :!xdg-open %<cr>
nnoremap <silent> <F9> :!xdg-open % -a firefox<cr>

" Regex mapping for substituting
noremap <leader>; :%s:::g<Left><Left><Left>
noremap <leader>' :%s:::cg<Left><Left><Left><Left>

" Turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

"=== coc.nvim ==="
nmap <silent> <leader>dd <Plug>(coc-definition)
nmap <silent> <leader>dr <Plug>(coc-references)
nmap <silent> <leader>dj <Plug>(coc-implementation)

" map Ctrl X Ctrl o
" imap <tab><tab> <c-x><c-o>

" TagBar keybindings
noremap <leader>t :TagbarOpenAutoClose<CR>

" }}}


"{{{ Fuzzy search
"Search down into all folders
"fuzzy search
set path+=**
"Displays all matching files when tab complete
set wildmenu
"}}}

"Tweaks for browsing
let g:netrw_banner=0  "disable annoying banner

"{{{  SNIPPETS

" Read an empty HTML template and move cursor to title
nnoremap \html :-1read $HOME/.vim/.skeleton.html<CR>4jwf>a
nnoremap \boot :-1read $HOME/.vim/.skeleton.bootstrap<CR>10j2e2li
"}}}

"{{{ NERDTree
" Open nerd tree in current buffer
nmap <silent><leader>k :NERDTreeToggle<cr>
let NERDTreeSortOrder = ['\/$', '\.js*', '\.cpp$', '\.h$', '*']
"}}}

hi LineNr ctermbg=NONE
hi Normal guibg=NONE ctermbg=NONE

"""""""""""""""""""""""""""""
"""" GOYO SETTINGS """"""""""
"""""""""""""""""""""""""""""
nnoremap <leader>g :Goyo<CR>


" vim:foldmethod=marker:foldlevel=0
