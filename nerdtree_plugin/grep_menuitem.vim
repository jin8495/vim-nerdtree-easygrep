" Originally written by scrooloose
" (http://gist.github.com/205807)

if exists("g:loaded_nerdtree_grep_menuitem")
    finish
endif
let g:loaded_nerdtree_grep_menuitem = 1

call NERDTreeAddMenuItem({
            \ 'text': '(g)rep directory',
            \ 'shortcut': 'g',
            \ 'callback': 'NERDTreeGrep' })

function! NERDTreeGrep()
    let rootnode = b:NERDTree.getRoot()
    let dirnode = g:NERDTreeDirNode.GetSelected()

    let pattern = input("Enter the search pattern: ")
    if pattern == ''
        echo 'Aborted'
        return
    endif

    "use the previous window to jump to the first search result
    wincmd w

    exec 'GrepRoot ' . dirnode.path.str()
    exec 'Grep -r ' . pattern
    exec 'GrepRoot ' . rootnode.path.str()

endfunction
