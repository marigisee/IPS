function h4 = s4 (n, x)
    h4=(-(length(n)-1)/2:(length(n)-1)/2);
    k=1;
    t=1;
    while (n(k)<0)
        h4(k)=0;
        k=k+1;
    end;
    if (k-1==0)
       h4(1)=0;
       k=2;
    endif
    for t=k:length(n)
        h4(t)=(1/4)*x(t)-(1/4)*x(t-1)-(1/2)*h4(t-1);
    endfor
endfunction
