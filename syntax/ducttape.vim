" Vim syntax file
" Language:	Ducttape
" Maintainer:	Xutai Ma
" Last Change:	2018 September 28
"

" TODO
" - options X: y=z (highlight ":") (note:conflicts with dtVarDefinition)
" - definitions :: x=y (hightlight "=") (note: can have multiple definitions)

" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

syn keyword Statement global group func using branchpoint baseline branch switch default
syn keyword Statement task package summary scheduler plan versioner action of nextgroup=Definition skipwhite
syn keyword Keyword while for do reach via done if fi else then contained
syn keyword Keyword rm cp ln head tail cat set qsub nextgroup=CmdOptions contained
syn keyword dtConstant true false contained

syn match Comment "#.*$"
syn match Number "\<[0-9]\+\>" contained
syn match Number "\<\d\+..\d\+\>"
syn match Variable "\${*\w*}*" nextgroup=Pointer
syn match Pointer "@\w\+" nextgroup=Branch contained
syn match Branch "\[.*:.*\]"
syn match CmdOptions "-\w\+"
syn match Operator "::" nextgroup=VarDefinition skipwhite
syn match Operator "<" nextgroup=VarDefinition skipwhite
syn match Operator ">" nextgroup=VarDefinition skipwhite
syn match VarOperator "=" nextgroup=dtVariable,dtNumber,dtString skipwhite contained
" syn match Variable \"\$\w\+"
" syn match dtVariable \"\${\w\+}"
" syn match dtVariable \"$\w\+@\w\+"
" syn match dtVariable \"$\w\+@\w\+\[\w\+:\w\+\]"

" task my_task ::
syn match Definition "[a-zA-Z]\w*" nextgroup=Operator skipwhite contained
" < x=$y
syn match VarDefinition "\w\+" nextgroup=VarOperator skipwhite contained
syn match VarDefinition "\.\w\+" nextgroup=VarOperator skipwhite contained

syn region String start=/"/ skip=/\\"/ end=/"/ contains=Variable
syn region String start=/'/ skip=/\\'/ end=/'/ contains=Variable
syn region Block start="{" end="}" contains=Variable,Keyword,Constant,Number,Comment,String,Block,Statement,CmdOptions
syn region OptionBlock start="(" end=")" contains=Number
" syn region VarBlock1 start="<" end="\=" contains=VarDefinition
" syn region VarBlock1 start=">" end="\=" contains=VarDefinition

let b:current_syntax = "ducttape"

hi def link Statement    Type
hi def link Keyword      Keyword
hi def link Comment      Comment
hi def link Number       Constant
hi def link Constant     Constant
hi def link Variable     Identifier
hi def link Pointer      Type
hi def link Operator     Operator
hi def link String       String
hi def link Definition   PreProc
hi def link VarOperator  Operator
hi def link Option       PreProc
hi def link Branch       Todo
hi def link CmdOptions   Type

set expandtab
set shiftwidth=2
set softtabstop=2
