" Vim syntax file
" Language:    zm 
" Version:     0.3
" URL:		https://gitlab.com/non.est.sacra/zoomba/wikis/home
" Last Change: 2017 Jul 17
" Disclaimer:  It's an absolute basic, very simple and by far not finished
" syntax file! It only recognizes basic keywords and  constructs like comments
" any help is welcome

" Remove any old syntax stuff
syn clear

" syntax highlighting for words that are not identifiers:
" int unit double String Array byte short char long float
syn keyword zmExternal      #atomic #clock #def
syn keyword zmConditional	if else where break continue
syn keyword zmRepeat		while for
syn keyword zmType			bool enum int INT num float FLOAT str
syn keyword zmType			isa type del is switch case

syn keyword zmStatement		return
syn keyword	zmBoolean		true false
syn keyword zmConstant		null
syn keyword	zmTypedef		import $ $.o $.i $.p $.c $.partial $.index $.item $.left $.right @ARGS @$ type
syn keyword zmLangClass	    set sset mset oset ceil dict sdict odict floor fold list slist select time load lfold rfold reduce rreduce open
syn keyword zmLangClass	    async system read write eprintln eprintf println perm comb seq sequence printf json xml matrix #clock
syn keyword zmLangClass	    round index rindex find tuple sum minmax heap hash random shuffle assert panic poll test tokens
syn keyword zmLangClass	    db partition join fiber thread task group send sorta sortd exists from file raise xpath xelem
syn keyword zmLangClass	    as where popen str jstr ystr


" TODO differentiate the keyword class from MyClass.class -> use a match here

syn keyword	zmOperator		new size empty def as where


" same number definition as in java.vim
syn match   zmNumber		"\<\(0[0-7]*\|0[xX]\x\+\|\d\+\)[lL]\=\>"
syn match   zmNumber     "\(\<\d\+\.\d*\|\.\d\+\)\([eE][-+]\=\d\+\)\=[fFdD]\="
syn match   zmNumber     "\<\d\+[eE][-+]\=\d\+[fFdD]\=\>"
syn match   zmNumber     "\<\d\+\([eE][-+]\=\d\+\)\=[fFdD]\>"

syn match   zmOperator  "!"
syn match   zmOperator  "-"
syn match   zmOperator  "+"
syn match   zmOperator  "/"
syn match   zmOperator  "%"
syn match   zmOperator  "|"
syn match   zmOperator  "&"
syn match   zmOperator  "="
syn match   zmOperator  "*"
syn match   zmOperator  "<"
syn match   zmOperator  ">"
syn match   zmOperator  "@"
syn match   zmOperator  "\~"
syn match   zmOperator  "^"
syn match   zmOperator  "\$"
syn match   zmOperator  "_"
syn match   zmOperator  ":"
syn match   zmOperator  "#"
syn match   zmOperator  "?"

syn region  zmString		start=+"+ end=+"+
syn region  zmString		start=+'+ end=+'+

" Functions
"	def [name] [(prototype)] {
"
syn match   zmFunction	"\s*\<def\>"

" Comments
syn region zmComment		start="/\*"	end="\*/"
syn match	zmLineComment	"//.*"


if !exists("did_zm_syntax_inits")
    let did_zm_syntax_inits = 1
    
    " The default methods for highlighting. Can be overridden later
    hi link zmExternal		Include
    hi link zmStatement		Statement
    hi link zmConditional	Conditional
	hi link zmRepeat			Repeat
    hi link zmType			Type
    hi link zmTypedef		Typedef
	hi link	zmBoolean		Boolean
    hi link zmFunction		Function
    hi link zmLangClass		Constant
	hi link	zmConstant		Constant
	hi link zmStorageClass 	StorageClass
	hi link zmOperator		Operator
    hi link zmNumber			Number
    hi link zmString			String
	hi link	zmComment		Comment
	hi link	zmLineComment	Comment
    hi link zmSpecial Keyword
    
endif

let b:current_syntax = "zm"

" if you want to override default methods for highlighting
"hi Conditional	term=bold ctermfg=Cyan guifg=#80a0ff
