" Modeline and Notes {
" vim: set foldmarker={,} foldlevel=0 foldmethod=marker spell:
"
" 	This is the personal .vimrc file of Pascsal Thivent.
"
" }

" Environment {
	" Basics {
		 set nocompatible " must be first line
	" }

	" Setup Bundle Support {
		" The next two lines ensure that the ~/.vim/bundle/ system works
		" It is essential that these lines are called before enabling filetype detection
		call pathogen#runtime_append_all_bundles()
		call pathogen#helptags()
	" }

" }

" General {
	filetype plugin indent on       	" Automatically detect file types.
" }

" Formatting {
	set nowrap                     	" wrap long lines
	set autoindent                 	" indent at the same level of the previous line
	set shiftwidth=4               	" use indents of 4 spaces
	set noexpandtab 	       		" tabs are tabs, not spaces
	set tabstop=4 					" an indentation every four columns
	"set matchpairs+=<:>           	" match, to be used with %
	set pastetoggle=<F12>          	" pastetoggle (sane indentation on pastes)
	"set comments=sl:/*,mb:*,elx:*/	" auto format comment blocks
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
	" }

	" EasyTags {
		let g:easytags_cmd = '/usr/bin/ctags'
	" }

	" Delimitmate {
		au FileType * let b:delimitMate_autoclose = 1

		" If using html auto complete (complete closing tag)
        au FileType xml,html,xhtml let b:delimitMate_matchpairs = "(:),[:],{:}"
	" }

	" SnipMate {
		" Setting the author var
		let g:snips_author = 'Pascal Thivent <pascal.thivent@gmail.com>'
		" Shortcut for reloading snippets, useful when developing
		nnoremap ,smr <esc>:exec ReloadAllSnippets()<cr>
	" }
" }
