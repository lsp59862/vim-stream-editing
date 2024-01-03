" vim-stream-editing.vim

function! VimStreamEditingEnable()
    nnoremap <silent> <A-f> :call VimStreamEditingEditText()<CR>
    inoremap <silent> <A-f> <Esc>:call VimStreamEditingEditText()<CR>a
endfunction

function! VimStreamEditingEditText()
    let cursor_pos = getpos('.')
    let line = getline('.')
    let str_to_find = input('Enter text to find: ')

    " 获取搜索的起始位置
    let start_pos = col('.')

    " 初始化局部变量
    let l:index = 0

    " 逆序搜索
    let l:matches = []
    while l:index != -1
        let l:index = stridx( line, str_to_find, l:index)
        if l:index != -1
            call add(l:matches, l:index)
            " echo l:index
            let l:index += 1
        endif
    endwhile

    let l:matches_index = len(l:matches) - 1

    let should_continue = 1
    while should_continue
        let l:match_now = matchaddpos('Search', [[cursor_pos[1], l:matches[l:matches_index] + 1, len(str_to_find)]])
        redraw
        let command = getchar()
        " echo 'Enter [nibra]'
        " 接受指令 nibra[ni:'bra], nb是查找的惯用方法, ira是编辑的惯用方法
        if command ==# 98 " b 的ASCII码是98
            " echo 'you pressed b'
            call matchdelete(l:match_now)
            if matches_index ==# 0
                echo 'No previous match found.'
            else
                let l:matches_index -= 1
            endif
            let should_continue = 1
        elseif command ==# 110 " n 的ASCII码是110
            " echo 'you pressed n'
            call matchdelete(l:match_now)
            if matches_index ==# len(l:matches) - 1
                echo 'No next match found.'
            else
                let l:matches_index += 1
            endif
            let should_continue = 1
        elseif command ==# 105 " i 的ASCII码是105
            " echo 'you pressed i'
            let str_new = input('Enter text to insert: ')
            call matchdelete(l:match_now)
            let modified_line = strpart(line , 0, l:matches[l:matches_index]) . str_new . strpart(line, l:matches[l:matches_index])
            call setline(cursor_pos[1], modified_line)
            let cursor_pos[2] += len(str_new)
            let should_continue = 0
        elseif command ==# 114 " r 的ASCII码是114
            " echo 'you pressed r'
            let str_new = input('Enter text to replace: ')
            call matchdelete(l:match_now)
            let modified_line = strpart(line , 0, l:matches[l:matches_index]) . str_new . strpart(line, l:matches[l:matches_index] + len(str_to_find))
            call setline(cursor_pos[1], modified_line)
            let cursor_pos[2] += len(str_new) - len(str_to_find)
            let should_continue = 0
        elseif command ==# 97 " a 的ASCII码是97
            " echo 'you pressed a'
            let str_new = input('Enter text to append: ')
            call matchdelete(l:match_now)
            let modified_line = strpart(line , 0, l:matches[l:matches_index]+len(str_to_find)) . str_new . strpart(line, l:matches[l:matches_index] + len(str_to_find))
            call setline(cursor_pos[1], modified_line)
            let cursor_pos[2] += len(str_new)
            let should_continue = 0
        else
            call matchdelete(l:match_now)
            let should_continue = 0
        endif
    endwhile

    call setpos('.', cursor_pos)

    return
endfunction

if !exists('g:VimStreamEditing_enable')
    let g:VimStreamEditing_enable = 0
elseif g:VimStreamEditing_enable ==# 1
    call VimStreamEditingEnable()
endif
