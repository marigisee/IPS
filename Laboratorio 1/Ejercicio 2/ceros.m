function y = ceros(x,n)
  for k=1:n
    if (k<=length(x))
         y(k)=x(k);
    else
         y(k)=0;
    endif;
end;
endfunction