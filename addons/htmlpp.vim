" Htmlpp syntax file
" Language:	        Htmlpp directives
"                   (see http://www.imatix.com/html/htmlpp/index.htm )
" Maintainer:	    Jean Jordaan <rgo_anas@rgo.sun.ac.za>
" Last change:	    990802 12:15:06

" These are used with Claudio Fleiner's html.vim in the standard distribution.
"
" --- Insert in mysyntax.vim ( see :h mysyntax )  ---
" - "  For all hypertext files, add htmlpp syntax coloring.
" - "  My mods to html syntax is activated by setting html_my_rendering
" - "  Change this to reflect your preferences and configuration!
" - "
" - if has ("unix")
" -   au! BufNewFile,BufReadPost *.htm,*.html,*.htp,*.hpp,*.def
" -   au  BufNewFile,BufReadPost *.htm,*.html,*.htp,*.hpp,*.def  so ~/.vim/contrib/syntax/htmlpp.vim
" - else
" -   au! BufNewFile,BufReadPost *.htm,*.html,*.htp,*.hpp,*.def
" -   au  BufNewFile,BufReadPost *.htm,*.html,*.htp,*.hpp,*.def  so /vim/contrib/syntax/htmlpp.vim
" - endif
" --- End insert ---

" Remove any old syntax stuff hanging around.
syn clear

" HTML (plus my modifications)
so $VIM/syntax/html.vim
if has ("unix")
  so ~/.vim/contrib/syntax/html.vim
else
  so /vim/contrib/syntax/html.vim
endif

syn case match

if !exists("main_syntax")
  let main_syntax = 'htmlpp'
endif

" regular htmlpp symbols
syn keyword htmlppSymbol DATE			TIME		DOCBASE		INC	PAGE   contained
syn keyword htmlppSymbol TITLE			PIPE_TITLE	PASS		BASE	   contained
syn keyword htmlppSymbol EXT			DIR	    	SILENT		LINEMAX	   contained
syn keyword htmlppSymbol DEBUG_MODE		FIRST_PAGE	LAST_PAGE	           contained
syn keyword htmlppSymbol NEXT_PAGE		PREV_PAGE	FIRST_TITLE	           contained
syn keyword htmlppSymbol LAST_TITLE		NEXT_TITLE	PREV_TITLE	           contained
syn keyword htmlppSymbol H1 H2 H3 H4 H5 H6                                 contained

" htmlpp keywords
syn keyword htmlppCommand define	echo	if		macro	include 	  transparent contained
syn keyword htmlppCommand page		pipe	ignore	else	endif		  transparent contained
syn keyword htmlppCommand header	footer	toc_open		toc_entry	  transparent contained
syn keyword htmlppCommand dir_open	dir_entry	dir_close	index_open	  transparent contained
syn keyword htmlppCommand index_close		anchor	endblock			  transparent contained
syn keyword htmlppCommand build		echo	for		endfor	block		  transparent contained
syn keyword htmlppCommand toc_close	index_entry		local		          transparent contained
syn keyword htmlppCommand H1 H2 H3 H4 H5 H6                               transparent contained

" Own additions
syn keyword htmlppTODO    TODO                                                        contained

" All htmlppCommands are contained by htmlppIsCommand.
syn match htmlppIsCommand	"^\.\s*\k\+"    contains=htmlppCommand
syn match htmlppDbSeperator	"#\|%\|\*"      contained
syn match htmlppSymbolLabel	+".\{-}"+       contained
syn match htmlppIsSymbol	"\$\\*\(([^ ]\+\|[0-9]\{1,2}\)" contains=htmlppSymbol,htmlppDbSeperator,htmlppSymbolLabel
syn match htmlppMacro 	    "\s\.\k\+"
syn match htmlppHyperlink	+\({\{2}[^}]\+}\{2}\)\|\(|[^|]\+|\)+ contained
syn match htmlppComment		+^\.-.*$+       contains=htmlppTODO,htmlppHyperlink

if !exists("did_htmlpp_syntax_inits")
  let did_htmlpp_syntax_inits = 1
  hi link htmlppIsCommand	PreProc
  hi link htmlppMacro       Macro
  hi link htmlppIsSymbol	Identifier
  hi link htmlppSymbol	    Constant
  hi link htmlppSymbolLabel	String
  hi link htmlppComment	    Comment
  hi link htmlppDbSeperator Delimiter
  hi link htmlppTODO        Todo
  hi link htmlppHyperlink   Special
endif

let b:current_syntax = "htmlpp"

if main_syntax == 'htmlpp'
  unlet main_syntax
endif

" vim: ts=4

