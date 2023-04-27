[n,he]=hcanald(023471);

%%%----PLOT DE LA RESPUESTA IMPULSIONAL----%%

figure;
stem(n,he,'filled');
title("Respuesta impulsional hA[n]");
xlabel("n");
ylabel("hA[n]");

%%%----Variables deltas----%%%

deltas=1:3; %% los puntos en n donde la señal ha[] tiene valor
deltasval=1:3; %% el valor de h[n] evaluada en los n que tienen valor
i=1;
N = length(n)/2;
delta = [1 ,zeros(1,N*2)];
%%--Determinamos los valores donde h[n] es distinto de cero--%%

for k=1:length(n)
    if (he(k)!=0)
         deltas(i)=k-1;
         deltasval(i)=he(k);
         i=i+1;
    endif
    k=k+1;
 end;



%%----SISTEMA IMPLEMENTAADO EN ECUACIONES EN DIFERENCIAS----%%

y = sistema(delta,length(n),deltas,deltasval);
figure;
    stem(n,y,'filled');
    title('Salida al ingresar una delta');
    xlabel("n");
    ylabel("y[n]");

%%%----PLOT DE LA SEÑAL DE AUDIO----%%

figure;
    [t,fs] = audioread('audio.wav');
    plot(t);
    title("audio.wav");

%%%----PLOT DE LA SALIDA DEL SISTEMA CUANDO INGRESA LA SEÑAL DE AUDIO----%%%%

figure;
    soporte=1:length(t);
    salida = sistema(t,length(t),deltas,deltasval);
    plot(soporte,salida);
    title("audio.wav al ingresar al sistema y[n]");
    xlabel("n");


%----------------FILTROS ECHO CANCELLER----------------%
#delta de Kronecker
deltaKronecker = [1 (zeros(1, (length(soporte)-1))) ];


%------Filtro con una rama de retardo------%
#resp impulsional filtro1.m
hf1 = filtro1(deltaKronecker,length(soporte),deltas,deltasval);
dimension = ((length(hf1) + length(salida))-1);
soportef=[1:1:dimension];
salidac = ceros(salida,dimension);
hf1c= ceros(hf1,dimension);
YE = fft(salidac);
HF1c = fft(hf1c);
ysf1 = ifft(YE.*HF1c);


figure ;
  plot(soportef,ysf1);
  set(gca,'FontSize',20);
  xlim([1,403000]);
  title("Señal obtenida con el filtro con una rama de retardo","fontsize",30);
  xlabel("n","fontsize",25);


%------Filtro con dos ramas de retardo------%
#resp impulsional filtro2.m
hf2 = filtro2(deltaKronecker,length(soporte),deltas,deltasval);
hf2c= ceros(hf2,dimension);
HF2c = fft(hf2c);
ysf2 = ifft(YE.*HF2c);


figure ;
  plot(soportef,ysf2);
  xlim([1,403000]);
  title("Señal obtenida con el filtro con dos ramas de retardo","fontsize",30);
  xlabel("n","fontsize",25);
  set(gca,'FontSize',20);
%------Filtro con tres ramas de retardo------%

#resp impulsional filtro3.m
hf3 = filtro3(deltaKronecker,length(soporte),deltas,deltasval);
hf3c= ceros(hf3,dimension);
HF3c = fft(hf3c);
ysf3 = ifft(YE.*HF3c);
figure ;
    plot(soportef,ysf3);
    xlim([1,403000]);
    title("Señal obtenida con el filtro con tres ramas de retardo","fontsize",30);
    xlabel("n","fontsize",25);
    set(gca,'FontSize',20);



