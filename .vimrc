" ===========================
" Vundle - vim bundle manager
" ===========================
set nocompatible              " be iMproved, required
" filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"   Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
"   Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"   Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"   Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
" Plugin 'pangloss/vim-javascript'
	" let g:javascript_plugin_flow = 1
" Plugin 'mxw/vim-jsx'
	" let g:jsx_ext_required = 0
Plugin 'ternjs/tern_for_vim'
Plugin 'othree/yajs.vim'
Plugin 'othree/es.next.syntax.vim'
Plugin 'Valloric/YouCompleteMe'
	let g:ycm_min_num_of_chars_for_completion = 1
	let g:ycm_max_num_identifier_candidates = 10
	let g:ycm_complete_in_comments = 1
	let g:ycm_seed_identifiers_with_syntax = 0
	let g:ycm_add_preview_to_completeopt = 1
	let g:ycm_autoclose_preview_window_after_completion = 1
Plugin 'alvan/vim-closetag'
	let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.jsx,*.js' "html autoclose tags enabled in *.jsx files
" Plugin 'isRuslan/vim-es6'
Bundle 'jeetsukumaran/vim-indentwise'
Bundle 'scrooloose/nerdcommenter'
	let g:NERDSpaceDelims = 1
	let g:NERDCommentEmptyLines = 1
	let g:NERDDefaultAlign = 'left'
Plugin 'idris-hackers/idris-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'flowtype/vim-flow'
Plugin 'universal-ctags/ctags'
Plugin 'ctrlpvim/ctrlp.vim'
"vim 8 needed (async lint checker)
Plugin 'w0rp/ale'
"sync lint checker
"Plugin 'vim-syntastic/syntastic'
	"set statusline+=%#warningmsg#
	"set statusline+=%{SyntasticStatuslineFlag()}
	"set statusline+=%*

	"let g:syntastic_always_populate_loc_list = 1
	"let g:syntastic_auto_loc_list = 1
	"let g:syntastic_check_on_open = 1
	"let g:syntastic_check_on_wq = 0
	"let g:syntastic_javascript_checkers = ['eslint']
	"let g:syntastic_javascript_eslint_exe = 'npm run lint --'

" grep & filesearch in vim
Plugin 'ggreer/the_silver_searcher'
Plugin 'mileszs/ack.vim'
  let g:ackprg = 'ag --vimgrep'
Plugin 'Chiel92/vim-autoformat'
Plugin 'kana/vim-submode'
	let g:submode_timeout = 0 "disable submode timeouts:
	let g:submode_keep_leaving_key = 1 " don't consume submode-leaving key
Plugin 'tpope/vim-surround'
Plugin 'mattn/emmet-vim'
Plugin 'airblade/vim-gitgutter'
	let g:gitgutter_realtime = 1
	let g:gitgutter_eager = 1
	let g:gitgutter_highlight_lines = 0
	let g:gitgutter_grep_command = 'ag'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to use auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" =========
" my config
" =========
" DONT FORGET: sudo apt-get install vim-gtk (for copy paste to/from clipboard)
set tabstop=2								"tabsize = 2 spaces
set shiftwidth=2
" set expandtab
set nu 											"line numbers
set nowrap
syntax on										"syntax highlighting
" set conceallevel=1
set updatetime=250
let mapleader = " "

set fdm=indent 								"sets folding blocks base on indentation
"autocmd VimEnter * :execute "normal zR" "unfolds automatic indent folds at vim startup
set hlsearch 									"unhighlights searched words after hitting enter
nnoremap <CR> :noh<CR><CR> 

nnoremap , <C-w><C-w>
"nnoremap <Leader><Tab> gt

"nnoremap gtd :YcmCompleter GoToDefinition<CR>

map <Shift>v <S-v>

au! BufNewFile,BufRead *.js.flow setf javascript " .js.flow is considered .js

" arrow completion
	autocmd Filetype javascript inoremap ;ar =>
	autocmd Filetype haskell inoremap ;ar ->
	autocmd Filetype haskell set expandtab
	autocmd Filetype javascript nnoremap <Leader>l oconsole.log()<Left>

	nnoremap <Leader>w :w<Enter>
	nnoremap <Leader>q :q<Enter>
	nnoremap <Leader>qq :qa<Enter>

" brackets completion
	inoremap {<CR> {<CR><Esc>0i}<Esc>O
	inoremap (<CR> (<CR><Esc>0i)<Esc>O
	inoremap [<CR> [<CR><Esc>0i]<Esc>O

	inoremap {;<CR> {<CR><Esc>0i};<Esc>O
	inoremap (;<CR> (<CR><Esc>0i);<Esc>O
	inoremap [;<CR> [<CR><Esc>0i];<Esc>O

	inoremap [<Tab> []<Left>
	inoremap {<Tab> {}<Left>
	inoremap (<Tab> ()<Left>

	inoremap [;<Tab> [];<Left><Left>
	inoremap {;<Tab> {};<Left><Left>
	inoremap (;<Tab> ();<Left><Left>

" clipboard copy-paste
	vnoremap <Leader>y "+y
	nnoremap <Leader>y "+y
	vnoremap <Leader>p "+p
	nnoremap <Leader>p "+p
	vnoremap <Leader>Y "+Y
	nnoremap <Leader>Y "+Y
	vnoremap <Leader>P "+P
	nnoremap <Leader>P "+P

" search & replace
	nnoremap riw "xyiw:%s/<C-r>x//gc<Left><Left><Left>

" view splitting
	nnoremap <Leader>hs :sp<Enter>
	nnoremap <Leader>vs :vsp<Enter>

" submode
	call submode#enter_with('tab-switching', 'n', '', '<Leader><Tab>', 'gt')
	call submode#map('tab-switching', 'n', '', '<Tab>', 'gt')

	call submode#enter_with('resize', 'n', '', '<Leader>vj', '<C-w><')
	call submode#map('resize', 'n', '', 'j', '<C-w><')
	call submode#enter_with('resize', 'n', '', '<Leader>vk', '<C-w>>')
	call submode#map('resize', 'n', '', 'k', '<C-w>>')

" NERDCommenter
	nmap <Leader>' <Leader>c<Space>
	vmap <Leader>' <Leader>c<Space>

" NERDTree
	nmap <Leader>f :NERDTree<Enter> 

" CtrlP
	nnoremap <Leader>s :CtrlP<Enter>
	nnoremap si' "+yi':CtrlP<Enter><insert>
	nnoremap si" "+yi":CtrlP<Enter><insert>
	nnoremap siw "+yiw:CtrlP<Enter><insert>
	"better speed - uses: ggreer/the_silver_searcher
		if executable('ag')
			" Use Ag over Grep
			set grepprg=ag\ --nogroup\ --nocolor

			" Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
			let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
		endif

" ack with ag
	noremap <Leader>g :Ack!<Space>''<Left>
	nnoremap gi' "xyi':Ack!<Space>''<Left><C-r>x
	nnoremap gi" "xyi":Ack!<Space>''<Left><C-r>x
	nnoremap giw "xyiw:Ack!<Space>''<Left><C-r>x

" split resize
" nnoremap <Leader>vj <C-w><
" nnoremap <Leader>vk <C-w>>
