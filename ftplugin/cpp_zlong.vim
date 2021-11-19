func! ZLONG_CPPALL()
  wa
  make all -s
endfunc
func! ZLONG_CPPLINK()
  wa
  make LINK -s
endfunc
func! ZLONG_CPPOBJ()
  wa
  make OBJ -s
endfunc
func! ZLONG_CPPCUROBJ()
  w
  !g++ -std=c++0x -O2 -I ./include -c %
endfunc

""定义函数SetTitle，自动插入文件头 

func! ZLONG_SetTitle() 
  call setline(1, " /*************************************************************************") 
  call append(line("."), "    > File Name: ".expand("%")) 
  call append(line(".")+1, "    > Author: Long Zichao")
  call append(line(".")+2, "    > Mail: zlong@pku.edu.cn") 
  call append(line(".")+3, "    > Created Time: ".strftime("%F")) 
  call append(line(".")+4, " ************************************************************************/") 
  call append(line(".")+5, "")
endfunc

func! ZLONG_SetSource()
  if &filetype == 'cpp'
    call ZLONG_SetTitle()
    call append(line(".")+6, "#include<iostream>")
    call append(line(".")+7, "#include<cmath>")
    call append(line(".")+8, "using std::cout; using std::endl; using std::ends;")
    call append(line(".")+9, "")
    call append(line(".")+10, "")
    call append(line(".")+11, "int ".expand("%:r"). "( )")
    call append(line(".")+12, "{")
    call append(line(".")+13, "return 0;")
    call append(line(".")+14, "}")
    normal! =G
    normal! Gkkkf(l

  endif
  if &filetype == 'c'
    call ZLONG_SetTitle()
    call append(line(".")+6, "#include<stdio.h>")
    call append(line(".")+7, "#include<math.h>")
    call append(line(".")+8, "")
    call append(line(".")+9, "")
    call append(line(".")+10, "int ".expand("%:r"). "( )")
    call append(line(".")+11, "{")
    call append(line(".")+12, "return 0;")
    call append(line(".")+13, "}")
    normal! =G
    normal! Gkkkf(l
  endif
endfunc

func! ZLONG_SetHeadGate()
  call ZLONG_SetTitle()
  let gatename = substitute(toupper(expand("%:t")), "\\.", "_", "g")
  call append(line(".")+6, "#ifndef " .gatename) 
  call append(line(".")+7, "#define " .gatename)
  call append(line(".")+8, "")
  call append(line(".")+9, "")
  call append(line(".")+10, "#endif // " .gatename)
  normal! =G
  normal! Gkk
endfunc


nnoremap <buffer> <silent> <F3> :!cscope -Rb<CR>
nnoremap <buffer> <silent> <F5> :call ZLONG_CPPALL()<CR>
nnoremap <buffer> <silent> <F6> :call ZLONG_CPPLINK()<CR>
nnoremap <buffer> <silent> <F7> :call ZLONG_CPPCUROBJ()<CR>
nmap <silent> <Leader>t <C-t>



