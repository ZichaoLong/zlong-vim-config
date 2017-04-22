function! ZLONG_ReportTemplate()
  0r ${HOME}/.vim/ftplugin/tex/template/Template.tex
endfunc
function! ZLONG_InitialsetTemplate()
  0r ${HOME}/.vim/ftplugin/tex/template/initialset.tex
endfunc
function! ZLONG_SlideTemplate()
  0r ${HOME}/.vim/ftplugin/tex/template/slide.tex
endfunc

command! ReportTemplate :call ZLONG_ReportTemplate()
command! InitialsetTemplate :call ZLONG_InitialsetTemplate()
command! SlideTemplate :call ZLONG_SlideTemplate()

nnoremap <buffer> <silent> <Leader>ll :update!<ESC>:!xelatex -interaction=nonstopmode %<CR>
nnoremap <buffer> <silent> <Leader>lb :!bibtex %:r<CR>

call textobj#user#plugin('tex', {
\   'code': {
\     'pattern': ['\\begin{\l*\*\?}', '\\end{\l*\*\?}'],
\     'select-a': 'ae',
\     'select-i': 'ie',
\   },
\ })


