function y = sistema (x, n, deltas, val)
  for k=1:n
      y(k)=val(1)*x(k);
    if (k > deltas(2)) && (k <= deltas(3)) % k desde 8000 y algo hasta 17000
      y(k)=(val(1)).*x(k) + (val(2)).*(x(k-(deltas(2))));
    elseif (k > deltas(3)) % desde 17000 hasta aprox 27000
       y(k)=val(1)*x(k) + (val(2))*x(k-(deltas(2))) + (val(3))*(x(k-deltas(3)));
    endif;
    k=k+1;
  end;
endfunction

