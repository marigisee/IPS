function h2 = s2 (n,s)
    for k=2:length(n)
        h2(k)=(1/2).*s(k)-(1/2).*s(k-1);
    endfor
endfunction

