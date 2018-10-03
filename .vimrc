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

" JavaScript
	Plugin 'othree/yajs.vim'
	Plugin 'othree/es.next.syntax.vim'
	" Plugin 'pangloss/vim-javascript'
	"   let g:javascript_plugin_flow = 1
	" Plugin 'isRuslan/vim-es6'
	" Plugin 'mxw/vim-jsx'
		" let g:jsx_ext_required = 0

" TypeScript
	Plugin 'Quramy/tsuquyomi'
		let g:tsuquyomi_disable_quickfix = 1
	Plugin 'leafgarland/typescript-vim'
	Plugin 'Quramy/vim-js-pretty-template'
	Plugin 'jason0x43/vim-js-indent'

" HTML & CSS & JSX
	Plugin 'iloginow/vim-stylus'
	Plugin 'alvan/vim-closetag'
		let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.jsx,*.js' "html autoclose tags enabled in *.jsx files

" LINTING
	" vim 8 needed (async lint checker)
	Plugin 'w0rp/ale'
		let g:ale_linter_aliases = {'javascript': 'typescript'}
		let g:ale_lint_delay = 1500
		let g:ale_typescript_tslint_executable = 'tslint'
		let g:ale_set_highlights = 0
		" let g:airline#extensions#ale#enabled = 1

" TEXT EDITING
	Plugin 'Valloric/YouCompleteMe'
		let g:ycm_min_num_of_chars_for_completion = 1
		let g:ycm_max_num_identifier_candidates = 10
		let g:ycm_complete_in_comments = 1
		let g:ycm_seed_identifiers_with_syntax = 0
		let g:ycm_add_preview_to_completeopt = 1
		let g:ycm_autoclose_preview_window_after_completion = 1
	Plugin 'scrooloose/nerdcommenter'
		let g:NERDSpaceDelims = 1
		let g:NERDCommentEmptyLines = 0
		let g:NERDDefaultAlign = 'left'
	Plugin 'Chiel92/vim-autoformat'
	Plugin 'kana/vim-submode'
		let g:submode_timeout = 0 "disable submode timeouts:
		let g:submode_keep_leaving_key = 1 " don't consume submode-leaving key
	Plugin 'tpope/vim-surround'
	Plugin 'mattn/emmet-vim'

" CODEBASE MOVEMENT
	Plugin 'scrooloose/nerdtree'
	Plugin 'ctrlpvim/ctrlp.vim'
	Plugin 'ggreer/the_silver_searcher'
	Plugin 'mileszs/ack.vim'
		let g:ackprg = 'ag --vimgrep'

" GIT
	Plugin 'tpope/vim-fugitive'
	Plugin 'airblade/vim-gitgutter'
		let g:gitgutter_realtime = 1
		let g:gitgutter_eager = 1
		let g:gitgutter_highlight_lines = 0
		let g:gitgutter_grep_command = 'ag'

" STYLE
	" INSTALL https://github.com/powerline/fonts, sudo apt-get install fonts-powerline
	Plugin 'altercation/vim-colors-solarized'
	Plugin 'itchyny/lightline.vim'

Plugin 'idris-hackers/idris-vim'

" NOT USING ANYMORE
	" Plugin 'jeetsukumaran/vim-indentwise'
	Plugin 'ternjs/tern_for_vim'
	" Plugin 'flowtype/vim-flow'
	" Plugin 'universal-ctags/ctags'
	"LINTER synchronous
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
	" statusline plugin
		" Plugin 'vim-airline/vim-airline'
		" Plugin 'vim-airline/vim-airline-themes'
		"   let g:airline_solarized_bg='dark'
		"   let g:airline_theme = 'solarized'

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
set tabstop=2								"tabsize = 2 spaces
set shiftwidth=2
" set expandtab

set nu 											"line numbers
set nowrap
syntax on										"syntax highlighting
" set conceallevel=1
set updatetime=250

let mapleader = " "
" let maplocalleader = ""

set fdm=indent 								"sets folding blocks base on indentation
"autocmd VimEnter * :execute "normal zR" "unfolds automatic indent folds at vim startup
"
set hlsearch



" unhighlights searched words after hitting enter
	nnoremap <CR> :noh<CR><CR> 

" VISUAL-BLOCK shortcut
	map <Shift>v <S-v>

" FILETYPE RECOGNITIONs
	augroup filetypedetect
		au BufRead,BufNewFile *.tsx set filetype=typescript
		au BufRead,BufNewFile *.ts set filetype=typescript
		au BufRead,BufNewFile *.styl set filetype=stylus
	augroup END
	au! BufNewFile,BufRead *.js.flow setf javascript " .js.flow is considered .js

" SAVE shortcuts
	nnoremap <Leader>w :w<Enter>
	nnoremap <Leader>q :q<Enter>
	nnoremap <Leader>qq :qa<Enter>

" COPY-PASTE from system clipboard
	vnoremap <Leader>y "+y
	nnoremap <Leader>y "+y
	vnoremap <Leader>p "+p
	nnoremap <Leader>p "+p
	vnoremap <Leader>Y "+Y
	nnoremap <Leader>Y "+Y
	vnoremap <Leader>P "+P
	nnoremap <Leader>P "+P

" SEARCH & REPLACE
	nnoremap riw "xyiw:%s/<C-r>x//gc<Left><Left><Left>

" VIEW organization
	" BUFFER switching
			nnoremap , <C-w><C-w>
	" TAB switching
		call submode#enter_with('tab-switching', 'n', '', '<Leader><Tab>', 'gt')
		call submode#map('tab-switching', 'n', '', '<Tab>', 'gt')
	" WINDOW splitting
		nnoremap <Leader>hs :sp<Enter>
		nnoremap <Leader>vs :vsp<Enter>

		call submode#enter_with('resize', 'n', '', '<Leader>b')
		call submode#map('resize', 'n', '', 'j', ':res +1<CR>')
		call submode#map('resize', 'n', '', 'k', ':res -1<CR>')
		call submode#map('resize', 'n', '', 'h', ':vertical resize -1<CR>')
		call submode#map('resize', 'n', '', 'l', ':vertical resize +1<CR>')

" NERDCommenter
	nmap <Leader>' <Leader>c<Space>
	vmap <Leader>' <Leader>c<Space>

" NERDTree
	" open
		nnoremap <Leader>nt :NERDTree<Enter>
	" open at current file's location (mnemotic: this (file) nerd tree)
		nnoremap <Leader>tnt :NERDTree %<Enter>

" FILE-NAME SEARCH - CtrlP
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

" FILE-CONTENT SEARCH - Ack
	noremap <Leader>g :Ack!<Space>''<Left>
	nnoremap gi' "xyi':Ack!<Space>''<Left><C-r>x
	nnoremap gi" "xyi":Ack!<Space>''<Left><C-r>x
	nnoremap giw "xyiw:Ack!<Space>''<Left><C-r>x

" CUSTOM FORMATTING
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
	" arrow completion
		autocmd Filetype javascript inoremap ;ar =>
		autocmd Filetype typescript inoremap ;ar =>
		autocmd Filetype haskell inoremap ;ar ->
		autocmd Filetype haskell set expandtab
		autocmd Filetype javascript nnoremap <Leader>l oconsole.log()<Left>
		autocmd Filetype typescript nnoremap <Leader>l oconsole.log()<Left>
		autocmd Filetype idris inoremap ;ar ->
	" sort
		nnoremap <leader>bsrt vi{:sort<Enter>
		vnoremap <leader>srt :sort<Enter>
	" spread
		nnoremap <leader>srd :call<Space>Spread()<Enter>
		nnoremap <leader>usrd :call<Space>Unspread()<Enter>
	" remove trailing whitespace
		nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" CUSTOM FUNCTIONS
	function Spread()
		execute "s#{#{\r#g"
		execute "s#}#\r}#g"
		execute "normal! k"
		execute "s#\\s##g"
		execute "normal! 0"
		execute "normal! >>"
		execute "s#,#,\r\t#g"
		execute "s#$#,#g"
	endfunction

	function Unspread()
		execute "normal! [{j"
		execute "mark a"
		execute "normal! ]}k"
		execute "mark b"
		execute "'a,'bs#\\s##g"

		execute "normal! [{"
		execute "mark a"
		execute "normal! ]}k"
		execute "mark b"
		execute "'a,'bs#\\n##g"

		execute "normal! ]}"
		execute "normal! hx"

		execute "s#,#, #g"
	endfunction

	function GetItemCount()
		execute "normal! [{"
		let cursorColumn = col(".")
		execute "normal! f,"
		let cursorColumnAfterFind = col(".")
		let itemCount = 1
		while cursorColumn != cursorColumnAfterFind
			let itemCount += 1
			let cursorColumn = col(".")
			execute "normal! f,"
			let cursorColumnAfterFind = col(".")
		endwhile

		return itemCount
	endfunction

" SET THEME
	set background=light
	colorscheme solarized

" STATUS-LINE
	set laststatus=2
	set noshowmode
	let g:lightline = {
		\ 	'colorscheme': 'solarized',
		\ 	'mode_map': { 'c': 'NORMAL' },
		\ 	'active': {
		\ 	  'left': [['modified', 'filename', 'fugitive'], ['path']],
		\			'right': [['lineinfo'], ['ale'], ['filetype']]
		\ 	},  
		\   'inactive': {
		\     'left': [['modified', 'filename']],
		\			'right': [['ale'], ['modified']]
		\		},
		\		'component_type': {
		\			'ale': 'error',
		\		},
		\ 	'component_function': {
		\ 	  'modified': 'LightLineModified',
		\ 	  'readonly': 'LightLineReadonly',
		\ 	  'fugitive': 'LightLineFugitive',
		\ 	  'filename': 'LightLineFilename',
		\ 	  'fileformat': 'LightLineFileformat',
		\ 	  'filetype': 'LightLineFiletype',
		\ 	  'fileencoding': 'LightLineFileencoding',
		\ 	  'mode': 'LightLineMode',
		\			'path': 'LightLinePath',
		\			'ale': 'LightLineALE',
		\ 	},
		\ 	'subseparator': { 'left': "|", 'right': "|" },
		\ 	'separator': { 'left': "", 'right': "" }
		\ }

	function! LightLineALE()
		let buf = bufnr('%')
		let list = ale#engine#GetLoclist(buf)
		return "Errors: ".len(list)
	endfunction

	function! LightLinePath()
		return winwidth(0) > 140 ? expand('%') : ''
	endfunction

	function! LightLineModified()
		return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
	endfunction

	function! LightLineReadonly()
		return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? '⭤' : ''
	endfunction

	function! LightLineFilename()
		let fname = expand('%:t')
		if fname == 'ControlP' || fname =~ 'NERD_tree'
			return ''
		endif
		let modifiedPrefix = ''
		let modifiedSuffix = ''
		return ('' != LightLineModified() ? modifiedPrefix : '') .
					\ ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
					\ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
					\  &ft == 'unite' ? unite#get_status_string() :
					\  &ft == 'vimshell' ? vimshell#get_status_string() :
					\ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
					\ ('' != LightLineModified() ? modifiedSuffix : '')
	endfunction

	function! LightLineFugitive()
		if &ft !~? 'vimfiler\|gundo' && exists("*fugitive#head")
			let _ = fugitive#head()
			return winwidth(0) > 90 && strlen(_) ? "\ue0a0 "._ : ''
		endif
		return ''
	endfunction

	function! LightLineFileformat()
		return winwidth(0) > 70 ? &fileformat : ''
	endfunction

	function! LightLineFiletype()
		return winwidth(0) > 90 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
	endfunction

	function! LightLineFileencoding()
		return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
	endfunction

	function! LightLineMode()
		let fname = expand('%:t')
		return fname == '__Tagbar__' ? 'Tagbar' :
					\ fname == 'ControlP' ? 'CtrlP' :
					\ fname == '__Gundo__' ? 'Gundo' :
					\ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
					\ fname =~ 'NERD_tree' ? 'NERDTree' :
					\ &ft == 'unite' ? 'Unite' :
					\ &ft == 'vimfiler' ? 'VimFiler' :
					\ &ft == 'vimshell' ? 'VimShell' :
					\ winwidth(0) > 60 ? lightline#mode() : ''
	endfunction
