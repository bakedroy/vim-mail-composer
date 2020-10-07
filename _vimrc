function! ComposeMessage(cmdpat)
    let [l:qr, l:qt] = [getreg('"'), getregtype('"')] 
    silent norm! gvy
    let l:body = substitute(@", '\n', '\r', 'g')
    let l:bodyfile= 'Path-To-Temp-File'
    if writefile([l:body], l:bodyfile)
        echom 'Failed to write to a temp file.'
    else
        let l:cmd = printf(a:cmdpat, l:bodyfile)
        call setreg('"', l:qr, l:qt)
        echo system(l:cmd)
        if v:shell_error
            echol ErrorMsg | echom 'Failed to run ' . l:cmd | echol NONE
        endif
    endif
endfunction
vnoremap ,th :<c-u>call ComposeMessage('"Path-To-Thunderbird-Exe" -compose "format=2,message=%s"')<CR>
