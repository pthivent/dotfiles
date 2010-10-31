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
