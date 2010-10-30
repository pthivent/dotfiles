" Modeline and Notes {
"
" 	This is the personal .vimrc file of Pascsal Thivent.
"
" }

" Environment {
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
