" Modeline and Notes {
" vim: set foldmarker={,} foldlevel=0 foldmethod=marker spell:
"
" 	This is the personal .vimrc file of Pascsal Thivent.
"
" }

" Environment {
	" Basics {
		set nocompatible 		" Disable vi compatibility. Must be first line.
	" }

	" Setup Bundle Support {
		" The next two lines ensure that the ~/.vim/bundle/ system works
		" It is essential that these lines are called before enabling filetype detection
		call pathogen#runtime_append_all_bundles()
		call pathogen#helptags()
	" }

" }

" General {
	set background=dark         " Assume a dark background.
	"Commented out because it breaks my function keys (F12, etc).
	"set term=builtin_ansi      " Make arrow and other keys work.
	filetype plugin indent on  	" Automatically detect file types.
	syntax on 					" Enable syntax highlighting.
	set mouse=a					" Automatically enable mouse usage.
	"set autochdir 				" Always switch to the current file directory.
	" not every vim is compiled with this, use the following line instead
	" If you use command-t plugin, it conflicts with this, comment it out.
	"autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif
	scriptencoding utf-8
	set autowrite                   " Automatically write a file when leaving a modified buffer.
	set shortmess+=filmnrxoOtT     	" Abbrev. of messages (avoids 'hit enter').
	set viewoptions=folds,options,cursor,unix,slash " Better unix / windows compatibility.
	set virtualedit=onemore 	   	" Allow for cursor beyond last character.
	set history=1000  				" Store a ton of history (default is 20)
	set spell 		 	        	" spell checking on

	" Setting up the directories {
		set backup 						" Backups are nice ...
		set backupdir=$HOME/.vimbackup//  " but not when they clog.
		set directory=$HOME/.vimswap// 	" Same for swap files.
		set viewdir=$HOME/.vimviews// 	" same for view files.

		" Creating directories if they don't exist
		silent execute '!mkdir -p $HOME/.vimbackup'
		silent execute '!mkdir -p $HOME/.vimswap'
		silent execute '!mkdir -p $HOME/.vimviews'
		au BufWinLeave * silent! mkview  "Make vim save view (state) (folds, cursor, etc).
		au BufWinEnter * silent! loadview "Make vim load view (state) (folds, cursor, etc).
	" }
" }

" Vim UI {
	set t_Co=256                 	" Enable 256 color mode in terminal.
	color molokai     	       		" Load a colorscheme.
	set tabpagemax=15 				" Only show 15 tabs.
	set showmode                   	" Display the current mode.

	set cursorline  				" Highlight current line.
	hi cursorline guibg=#333333 	" Highlight bg color of current line.
	hi CursorColumn guibg=#333333   " Highlight cursor.

	if has('cmdline_info')
		set ruler                  	" Show the ruler.
		set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids.
		set showcmd                	" Show partial commands in status line and
									" Selected characters/lines in visual mode.
	endif

	if has('statusline')
		set laststatus=1           	" Show statusline only if there are > 1 windows.
		" Use the commented line if fugitive isn't installed
		"set statusline=%<%f\ %=\:\b%n%y%m%r%w\ %l,%c%V\ %P " a statusline, also on steroids
		set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
	endif

	set backspace=indent,eol,start 	" Backspace for dummys.
	set linespace=0 				" No extra spaces between rows.
	set nu 							" Line numbers on.
	set showmatch                  	" Show matching brackets/parenthesis.
	set incsearch 					" Find as you type search.
	set hlsearch 					" Highlight search terms.
	set winminheight=0 				" Windows can be 0 line high.
	set ignorecase 					" Case insensitive search.
	set smartcase 					" Case sensitive when uc present.
	set wildmenu 					" Show list instead of just completing.
	set wildmode=list:longest,full 	" comand <Tab> completion, list matches, then longest common part, then all.
	set whichwrap=b,s,h,l,<,>,[,]	" Backspace and cursor keys wrap to.
	set scrolljump=5 				" Lines to scroll when cursor leaves screen.
	set scrolloff=3 				" Minimum lines to keep above and below cursor.
	set foldenable  				" Auto fold code.
	set gdefault					" The /g flag on :s substitutions by default.

" }

" Formatting {
	set nowrap                     	" Wrap long lines.
	set autoindent                 	" Indent at the same level of the previous line.
	set shiftwidth=4               	" Use indents of 4 spaces.
	set noexpandtab 	       		" Tabs are tabs, not spaces.
	set tabstop=4 					" An indentation every four columns.
	"set matchpairs+=<:>           	" Match, to be used with %
	set pastetoggle=<F12>          	" pastetoggle (sane indentation on pastes).
	"set comments=sl:/*,mb:*,elx:*/	" Auto format comment blocks.
" }

" Key Mappings {

	" change the mapleader from \ to ,
	let mapleader=","

	" Easier moving in tabs and windows
	map <C-J> <C-W>j<C-W>_
	map <C-K> <C-W>k<C-W>_
	map <C-L> <C-W>l<C-W>_
	map <C-H> <C-W>h<C-W>_
	map <C-K> <C-W>k<C-W>_

	" Yank from the cursor to the end of the line, to be consistent with C and D.
	nnoremap Y y$

	" Shortcuts
	" For when you forget to sudo. Really Write the file.
	cmap w!! w !sudo tee % >/dev/null
" }

" Plugins {

	" Supertab {
		"let g:SuperTabDefaultCompletionType = "context"
		let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
	" }

	" Misc {
		let g:checksyntax_auto = 0

		"comment out line(s) in visual mode
		vmap  o  :call NERDComment(1, 'toggle')<CR>
		let g:NERDShutUp=1

		let b:match_ignorecase = 1
	" }

	" EasyTags {
		let g:easytags_cmd = '/usr/bin/ctags'
	" }

	" Delimitmate {
		au FileType * let b:delimitMate_autoclose = 1

		" If using html auto complete (complete closing tag)
        au FileType xml,html,xhtml let b:delimitMate_matchpairs = "(:),[:],{:}"
	" }

	" AutoCloseTag {
		" Make it so AutoCloseTag works for xml and xhtml files as well
		au FileType xhtml,xml ru ftplugin/html_autoclosetag.vim
	" }

	" SnipMate {
		" Setting the author var
		let g:snips_author = 'Pascal Thivent <pascal.thivent@gmail.com>'
		" Shortcut for reloading snippets, useful when developing
		nnoremap ,smr <esc>:exec ReloadAllSnippets()<cr>
	" }
" }

" GUI Settings {
	" GVIM- (here instead of .gvimrc)
	if has('gui_running')
		set guioptions-=T          	" Remove the toolbar.
		set lines=40               	" 40 lines of text instead of 24,
	endif
" }

