function! ZLONG_SetPyScript()
  0r ${HOME}/.vim/ftplugin/python/template/pyhead
  normal! G
  normal! kkk
endfunc
function! ZLONG_BasicLib()
  r ${HOME}/.vim/ftplugin/python/template/basiclib
endfunc
function! ZLONG_PreprocessLib()
  r ${HOME}/.vim/ftplugin/python/template/preprocesslib
endfunc
function! ZLONG_Utilies()
  r ${HOME}/.vim/ftplugin/python/template/utilies
endfunc
function! ZLONG_DebugLib()
  r ${HOME}/.vim/ftplugin/python/template/debuglib
endfunc

command! Utilies :call ZLONG_Utilies()
command! BasicLib :call ZLONG_BasicLib()
command! PreprocessLib :call ZLONG_PreprocessLib()
command! DebugLib :call ZLONG_DebugLib()


