" when :make, then make -j<N+1> is run, where N is number of processor cores in your machine.
function! SetMakeprg()
    if !empty($NUMBER_OF_PROCESSORS)
        let n = $NUMBER_OF_PROCESSORS + 0
    elseif filereadable('/proc/cpuinfo')
        let n = system('grep -c ^processor /proc/cpuinfo') + 0
    else
        let n = 1
    endif
    let &makeprg = 'make' . (n > 1 ? (' -j'.(n + 1)) : '')
endfunction
call SetMakeprg()
