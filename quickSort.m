%Algoritmo de ordenación quick sort a partir de un vector de tamaño n y datos aleatorios
disp('Este programa ordena un vector de tamaño n, con numeros aleatorios.');
global n = input('Introduce el valor de n: ');
global vector=(rand(n,1)*500);			%rellena el vector de tamaño n con numeros aleatorios entre cero y uno y los multiplica por 500
disp('El vector es el siguiente: ');
printf(' %f ',vector);

function vectorOrdenado=quickSort(v)     
  vectorOrdenado = v;               
  n=length(v);
  if(n > 1)              
     pivote=v(round(n/2)+1);                     
     menores = find(vectorOrdenado < pivote); 
     iguales = find(vectorOrdenado == pivote);
     mayores=find(vectorOrdenado > pivote);
     vectorOrdenado  = [quickSort(vectorOrdenado(menores)); vectorOrdenado(iguales); quickSort(vectorOrdenado(mayores))];
  end
endfunction
 
tic,u=quickSort(vector); t=toc
disp('El vector ordenado es el siguiente: ');

printf(' %f ',u)
t
