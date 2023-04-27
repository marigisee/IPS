function X = tftd(x,y)
%%script TFTD%%
  ds = 0.01;
  s = [-10:ds:10];
  X = zeros(size(s));
for k=1:length(s)
  %%y = valor de la señal a calcular TFTD%%
  X(k)=sum(y.*exp(-1i*2*pi*s(k)*x));
end;
%%--------PLOTEO DE LA TFTD--------%%
  absoluto=abs(X);
  fase=angle(X);
%%PLOT VALOR ABSOLUTO DE X%%
  figure
  subplot(2,1,1);
    plot(s,absoluto,"r");
    title('Modulo de X(s)');
    ylabel("|X(s)|");
    xlabel("s");
    xlim([-0.5,0.5]);
    subplot(2,1,2);
%%PLOT FASE DE X%%
    subplot(2,1,2);
    plot(s,fase,"r");
    title('Fase de X(s)');
    xlim([-0.5,0.5]);
endfunction
