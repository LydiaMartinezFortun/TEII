%Algoritmo de ordenación quick sort a partir de un vector de tamaño n y datos aleatorios
%disp('Este programa ordena un vector de tamaño n, con numeros aleatorios.');
global vector;%=(rand(n,1)*500);			%rellena el vector de tamaño n con numeros aleatorios entre cero y uno y los multiplica por 500
%disp('El vector es el siguiente: ');
%printf(' %f ',vector);

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
	while(tam<maxTam)
		vector=(rand(tam,1)*500);			%rellena el vector de tamaño n con numeros aleatorios entre cero y uno y los multiplica por 500
		%disp('El vector es el siguiente: ');
		%printf(' %f ',vector);
		tic,u=quickSort(vector); 
		tiemposTam(tam)=toc;

		%disp('El vector ordenado es el siguiente: ');
		%printf(' %f ',u);
		%printf('\n');
		%printf('El tiempo de ejecion con tamaño %d es: %f ',tam,tiemposTam(tam));
		tam=tam+1;
		endwhile

endfunction

maxTam = input('Introduce el valor del tamaño maximo: ');
tiempos=tiempoQuickSort(maxTam);
%printf('El tiempo de ejecion con tamaño : %f ',tiempos);
%printf('\n');
plot(tiempos,'m');
