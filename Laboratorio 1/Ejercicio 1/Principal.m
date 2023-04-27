%%----Delta de Kronecker----%%
N = 10;
delta = [zeros(1,N),1,zeros(1,N)];
n = [-N:N];
%%----Generacion y plotteo de la señal----%%
[x,senialAl] = senial(023471);
(023471);
figure;
stem (x,senialAl,'filled');
title('Señal generada por senial.m');
%%----TFTD de la señal----%%
X = tftd(x,senialAl);
%%----Implementacion de los sistemas----%%
#{
Los sistemas se encuentran implementados mediante funciones.
Las respuestas impulsionales se obtienen evaluando a los sistemas implementados en funciones
en la delta de Kronecker definida anteriormente.
#}
%%----Respuestas impulsionales----%%

%%----SISTEMA 1----%%
figure;
aux=length(n);
subplot(2,2,1)
  h1=s1(n,delta);
  stem(n,h1,'filled',"m");
  title('h1[n]');
%%----SISTEMA 2----%%
subplot(2,2,2);
  h2=s2(n,delta);
  stem(n,h2,'filled',"m");
  title('h2[n]');
  ylim([-0.5,0.5]);
  yticks([-0.5,0.5]);
  yticklabels('auto');
%%----SISTEMA 3----%%
subplot(2,2,3);
  h3=s3(n,delta);
  stem(n,h3,'filled',"m");
  title('h3[n]');
%%----SISTEMA 4----%%
subplot(2,2,4);
   h4=s4(n,delta);
   stem(n,h4,'filled',"m");
   title('h4[n]');

%%----Respuesta en frecuencia de las respuestas impulsionales----%%
s=1:length(X);

%%----H1----%%
   H1=tftd(n,h1);
%%----H1----%%
   H2=tftd(n,h2);
%%----H1----%%
   H3=tftd(n,h3);
%%----H4----%%
   H4=tftd(n,h4);

%%----Señal de salida cuando le aplicamos la senialAl a cada sistema----%%
figure;
subplot(2,2,1);
   y1=s1(x,senialAl);
   stem(x,y1,'filled','b');
   title("Señal salida de s1 a la senial.m")
   xlabel("n");
   ylabel("y1[n]");
subplot(2,2,2);
   y2=s2(x,senialAl);
   stem(x,y2,'filled','b');
   title("Señal salida de s2 a la senial.m")
   xlabel("n");
   ylabel("y2[n]");
subplot(2,2,3);
   y3=s3(x,senialAl);
   stem(x,y3,'filled','b');
   title("Señal salida de s3 a la senial.m")
   xlabel("n");
   ylabel("y3[n]");
subplot(2,2,4);
   y4=s4(x,senialAl);
   stem(x,y4,'filled','b');
   title("Señal salida de s4 a la senial.m")
   xlabel("n");
   ylabel("y4[n]");
%%----Señal de salida cuando le aplicamos la senialAl a cada sistema----%%
   Y1=tftd(x,y1);
   Y2=tftd(x,y2);
   Y3=tftd(x,y3);
   Y4=tftd(x,y4);
