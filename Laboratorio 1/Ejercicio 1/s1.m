function h1 = s1 (n,s)
    for k=2:length(n)
        h1(k)=(1/2).*s(k)+(1/2).*s(k-1);
    endfor
endfunction

