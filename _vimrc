function! ComposeMessage(cmdpat)
    let [l:qr, l:qt] = [getreg('"'), getregtype('"')] 
    silent norm! gvy
    let l:subject_pattern = "^\\(S\\|s\\)ubject\\(:\\|=\\)\\s*\\(.\\+\\)$"

    " Set the body message
    let l:body = split(@",  "\n")
    """ extract subject line (the 1st entry by default) then remove if match
    let l:_subject = string(l:body[0])
    let l:subject = substitute(l:body[0], l:subject_pattern, "\\3", '')
    if l:_subject !~ l:subject
        echom l:_subject . " does not contain subject line"
    else
        call remove(l:body, 0) " remove the subject line from the body
    endif
    map(l:body, v:val . '\r') " append CR to all lines

    " Set temp file path
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
