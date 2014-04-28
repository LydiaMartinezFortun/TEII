%Algoritmo de ordenación quick sort a partir de un vector de tamaño n y datos aleatorios
global vector;

function vectorOrdenado=quickSort(v)     
  vectorOrdenado = v;               
  n=length(v);
  if(n > 1)              
     pivote=v(round(n/2)+1);                     
     menores = find(vectorOrdenado < pivote); 
     iguales = find(vectorOrdenado == pivote);
     mayores=find(vectorOrdenado > pivote);
     vectorOrdenado  = [quickSort(vectorOrdenado(menores)); 							vectorOrdenado(iguales); 
     					quickSort(vectorOrdenado(mayores))];
  end
endfunction
 
function tiemposTam=tiempoQuickSort(maxTam)
	tiemposTam=zeros(1,0);
	tam=1;
	while(tam<=maxTam)
		vector=(rand(tam,1)*500);	
		tic,u=quickSort(vector); 
		tiemposTam(tam)=toc;
		if(length(vector)==20)
			disp('El vector inicial es el siguiente: ');
			printf(' %f ',vector);
			printf('\n');
			disp('El vector ordenado es el siguiente: ');
			printf(' %f ',u);
			printf('\n');
			tiemposTam(20)
		end
		tam=tam+1;
		endwhile

endfunction
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%						USO DE LAS FUNCIONES						%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Si se quiere que pida los valores por teclado DESCOMENTAR estas dos lineas => maxTam = input('Introduce el valor del tamaño maximo: ');

% =>  tiempos=tiempoQuickSort(maxTam);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%		Tamaño 20 elementos		 			  %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
tiempos20=tiempoQuickSort(20);
tiempos20(20);
plot(tiempos20,'m--');
title ("Tiempo de ejecucion de QuickSort");
xlabel ("Tam. del vector");
ylabel ("Tiempo");
print -dpng Grafica20.png 
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%		Tamaño 500 elementos		 		  %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

tiempos500_1=tiempoQuickSort(500);
tiempos500_2=tiempoQuickSort(500);
tiempos500_3=tiempoQuickSort(500);
plot(tiempos500_1,'m', tiempos500_2,'r--',tiempos500_3,'c+');
title ("Tiempo de ejecucion de QuickSort");
xlabel ("Tam. del vector");
ylabel ("Tiempo");
print -dpng Grafica500.png 
tiemposMedios=zeros(1,0);
for i = 1:500
     tiemposMedios(i) = (tiempos500_1(i) + tiempos500_2(i) +tiempos500_3(i))/3;
endfor;
plot(tiemposMedios,'b');
title ("Tiempo de medio ejecucion de QuickSort");
xlabel ("Tam. del vector");
ylabel ("Tiempo");
print -dpng tiemposMedios.png 
