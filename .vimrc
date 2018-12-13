" =========
" PLUGINS
" =========
	" Install vim.plug
		if empty(glob('~/.vim/autoload/plug.vim'))
			silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
			autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
		endif

	" Plugins
		call plug#begin('~/.vim/plugged')
			" Haskell
				Plug 'eagletmt/ghcmod-vim', {'for': 'haskell'}
				Plug 'Shougo/vimproc.vim', {'do': 'make'}
				Plug 'eagletmt/neco-ghc', {'for': 'haskell'}
					" show type anotations in omnicompletion
					let g:necoghc_enable_detailed_browse = 1
				Plug 'itchyny/vim-haskell-indent'

			" Idris
				Plug 'idris-hackers/idris-vim'

			" Elm
				Plug 'ElmCast/elm-vim'
				let g:elm_format_autosave = 1

			" JavaScript
				Plug 'othree/yajs.vim'
				Plug 'othree/es.next.syntax.vim'
				Plug 'ternjs/tern_for_vim'
				" Plug 'pangloss/vim-javascript'
				"   let g:javascript_plugin_flow = 1
				" Plug 'isRuslan/vim-es6'
				" Plug 'mxw/vim-jsx'
					" let g:jsx_ext_required = 0

			" TypeScript
				Plug 'Quramy/tsuquyomi'
					let g:tsuquyomi_disable_quickfix = 1

					autocmd FileType typescript nmap <silent><buffer> <Leader>rs <Plug>(TsuquyomiRenameSymbol)
				Plug 'leafgarland/typescript-vim'
				Plug 'Quramy/vim-js-pretty-template'
				Plug 'jason0x43/vim-js-indent'

			" Markdown
				Plug 'iamcco/markdown-preview.vim'
				Plug 'vim-pandoc/vim-pandoc-syntax'
				Plug 'vim-pandoc/vim-pandoc'
				" markdown preview
				" Plug 'shime/vim-livedown' " needs node & npm i -g livedown

			" HTML & CSS & JSX
				Plug 'iloginow/vim-stylus'
				Plug 'alvan/vim-closetag'
					let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.jsx,*.js' "html autoclose tags enabled in *.jsx files

			" Linting
				" vim 8 needed (async lint checker)
				Plug 'w0rp/ale'
					let g:ale_linter_aliases = {'javascript': 'typescript'}
					let g:ale_lint_delay = 1500
					let g:ale_typescript_tslint_executable = 'tslint'
					let g:ale_set_highlights = 0
					let b:ale_linters = {'typescript': ['tslint']}
					" let g:airline#extensions#ale#enabled = 1

					nmap <silent> [e <Plug>(ale_previous_wrap)
					nmap <silent> ]e <Plug>(ale_next_wrap)
					nmap <silent> gd <Plug>(ale_go_to_definition)

			" Snippets
				" Plug 'SirVer/ultisnips'
				"   let g:UltiSnipsExpandTrigger="<Tab>"
				"   let g:UltiSnipsJumpForwardTrigger="<Tab>"
					" let g:UltiSnipsJumpBackwardTrigger="<c-z>"
				Plug 'Shougo/neosnippet.vim'
				Plug 'Shougo/neosnippet-snippets'
					let g:neosnippet#enable_snipmate_compatibility = 1
					imap <C-k>     <Plug>(neosnippet_expand_or_jump)
					smap <C-k>     <Plug>(neosnippet_expand_or_jump)
					xmap <C-k>     <Plug>(neosnippet_expand_target)

			" Text Editing
				Plug 'Valloric/YouCompleteMe'
					" NEEDs INSTALLATION -> CHECK THIS issue for usage with vim.plug  https://github.com/Valloric/YouCompleteMe/issues/2934
					let g:ycm_min_num_of_chars_for_completion = 1
					let g:ycm_max_num_identifier_candidates = 10
					let g:ycm_complete_in_comments = 1
					let g:ycm_seed_identifiers_with_syntax = 0
					let g:ycm_add_preview_to_completeopt = 1
					let g:ycm_autoclose_preview_window_after_completion = 1
					let g:ycm_semantic_triggers = {'haskell' : ['.'], 'elm' : ['.']}

				" this one is better with necoghc (haskell autocompletion)
				" Plug 'Shougo/deoplete.nvim' " needs sudo apt-get install python3-pip | pip3 install --user pynvim
				"   let g:haskellmode_completion_ghc = 0
				"   let g:deoplete#enable_at_startup = 1
				"   let g:deoplete#ignore_case = 1
				"   let g:deoplete#max_list = 5 

				"   " tab-completeion
				"     inoremap <expr><Tab> pumvisible() ? "\<c-n>" : "\<Tab>"

				"   " omnifuncs
				"     augroup omnifuncs
				"       autocmd!
				"       autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
				"       autocmd FileType typescript setlocal omnifunc=tsuquyomi#complete
				"     augroup end
				"     " tern
				"       if exists('g:plugs["tern_for_vim"]')
				"         let g:tern_show_argument_hints = 'on_hold'
				"         let g:tern_show_signature_in_pum = 1
				"         autocmd FileType javascript setlocal omnifunc=tern#Complete
				"       endif

				Plug 'scrooloose/nerdcommenter'
					let g:NERDSpaceDelims = 1
					let g:NERDCommentEmptyLines = 0
					let g:NERDDefaultAlign = 'left'

					nmap <Leader>' <Leader>c<Space>
					vmap <Leader>' <Leader>c<Space>
				Plug 'Chiel92/vim-autoformat'
				Plug 'kana/vim-submode'
					let g:submode_timeout = 0 "disable submode timeouts:
					let g:submode_keep_leaving_key = 1 " don't consume submode-leaving key
				Plug 'tpope/vim-surround'
				Plug 'mattn/emmet-vim'

			" Codebase Movement
				Plug 'scrooloose/nerdtree'
					nnoremap <Leader>nt :NERDTree<Enter>		" open
					nnoremap <Leader>tnt :NERDTree %<Enter> " open at current file's location (mnemotic: this (file) nerd tree)
				Plug 'ctrlpvim/ctrlp.vim'
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
				Plug 'ggreer/the_silver_searcher'
				Plug 'mileszs/ack.vim'
					let g:ackprg = 'ag --vimgrep'

					noremap <Leader>g :Ack!<Space>''<Left>
					nnoremap gi' "xyi':Ack!<Space>''<Left><C-r>x
					nnoremap gi" "xyi":Ack!<Space>''<Left><C-r>x
					nnoremap giw "xyiw:Ack!<Space>''<Left><C-r>x

			" Git
				Plug 'tpope/vim-fugitive'
				Plug 'airblade/vim-gitgutter'
					let g:gitgutter_realtime = 1
					let g:gitgutter_eager = 1
					let g:gitgutter_highlight_lines = 0
					let g:gitgutter_grep_command = 'ag'

			" Vim style
				" INSTALL https://github.com/powerline/fonts, sudo apt-get install fonts-powerline
				Plug 'altercation/vim-colors-solarized'
					set background=light
					colorscheme solarized
				Plug 'itchyny/lightline.vim'
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

			" neovim plugin support
				Plug 'roxma/nvim-yarp'
				Plug 'roxma/vim-hug-neovim-rpc'

			" not using anymore
				" Plug 'jeetsukumaran/vim-indentwise'
				" Plug 'flowtype/vim-flow'
				" Plug 'universal-ctags/ctags'
				"LINTER synchronous
					"Plug 'vim-syntastic/syntastic'
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
					" Plug 'vim-airline/vim-airline'
					" Plug 'vim-airline/vim-airline-themes'
					"   let g:airline_solarized_bg='dark'
					"   let g:airline_theme = 'solarized'
		call plug#end()

" =========
" CONFIG
" =========
	" Others
		filetype plugin indent on
		set tabstop=2								" tabsize = 2 spaces
		set shiftwidth=2
		" set expandtab
		set nu 											" line numbers
		set nowrap 									" don't wrap text
		syntax on										" syntax highlighting
		set hlsearch
		set updatetime=250
		let mapleader = " "
		" let maplocalleader = ""
		set fdm=indent 							" sets folding blocks base on indentation
		" autocmd VimEnter * :execute "normal zR"						"unfolds automatic indent folds at vim startup
		noremap yfp :let @" = expand("%")<CR> 							" yank file path
		nnoremap <CR> :noh<CR><CR> 	" unhighlights searched words after hitting enter
		map <Shift>v <S-v>					" VISUAL-BLOCK shortcut
		nnoremap riw "xyiw:%s/<C-r>x//gc<Left><Left><Left> 	" Search & Replace

	" Filetype Recognitions
		augroup filetypedetect
			au BufRead,BufNewFile *.tsx set filetype=typescript
			au BufRead,BufNewFile *.ts set filetype=typescript
			au BufRead,BufNewFile *.styl set filetype=stylus
		augroup END
		au! BufNewFile,BufRead *.js.flow setf javascript " .js.flow is considered .js

	" Save Shortcuts
		nnoremap <Leader>w :w<Enter>
		nnoremap <Leader>q :q<Enter>
		nnoremap <Leader>qq :qa<Enter>

	" Copy-Paste from system clipboard
		vnoremap <Leader>y "+y
		nnoremap <Leader>y "+y
		vnoremap <Leader>p "+p
		nnoremap <Leader>p "+p
		vnoremap <Leader>Y "+Y
		nnoremap <Leader>Y "+Y
		vnoremap <Leader>P "+P
		nnoremap <Leader>P "+P

	" View Organization
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

	" Custom Formatting
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

	" Custom Functions
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
