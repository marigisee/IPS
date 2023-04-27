function f = filtro2 (x, n, deltas, val)
     f=[1:1:n];
     for k=1:n
        if (k<=3*deltas(2)) %%desde 1 hasta 26460
            f(k)=x(k);
            elseif ( (k > (3*deltas(2))) && (k <= (3*deltas(3))) ) %%desde 26461 hasta 52920
                 f(k)= x(k) + ( (1/8)*( x(k-3*deltas(2)) ));
                 else %%desde 52920
                     f(k)= x(k) + (1/8)*x(k-3*deltas(2)) + (1/64)* x(k-3*deltas(3));
        endif;
        k=k+1;
    endfor;
endfunction
