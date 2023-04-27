function f = filtro3 (x, n, deltas, val)
     f=[1:1:n];
     for k=1:n
        if (k<=4*deltas(2)) %%desde 1 hasta 35280
            f(k)=x(k);
            elseif ( (k > (4*deltas(2))) && (k <= (4*deltas(3))) ) %%desde 35281 hasta 70560
                 f(k)= x(k) - ( (1/16)*( x(k-4*deltas(2)) ));
                 else %%desde 70560
                     f(k)= x(k) - (1/16)*x(k-4*deltas(2)) - (1/256)* x(k-4*deltas(3));
        endif;
        k=k+1;
    endfor;
endfunction

