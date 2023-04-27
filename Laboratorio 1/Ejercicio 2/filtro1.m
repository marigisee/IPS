function f = filtro1 (x, n, deltas, val)
     f=[1:1:n];
     for k=1:n
        if (k<=2*deltas(2)) %%desde 1 hasta 17640
            f(k)=x(k);
            elseif ( (k > (2*deltas(2))) && (k <= (2*deltas(3))) ) %%desde 17641 hasta 35280
                 f(k)= x(k) - ( (1/4)*( x(k-2*deltas(2)) ));
                 else %%desde 35281
                     f(k)= x(k) - (1/4)*x(k-2*deltas(2)) - (1/8)* x(k-2*deltas(3));
        endif;
        k=k+1;
    endfor;
endfunction

