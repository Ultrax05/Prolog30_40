% ===============================================
% Autor: Ivan Jared Alvarez De Uña
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que cuenta los
%              nodos de un arbol multiway.
%              Se incluye una versión en python.
% ===============================================
% -------- Código en python ------------
%def contar_nodos(termino):
%    # Verificar si el término es una lista (nodo)
%    if not isinstance(termino, list):
%        return 0
%    
%    # El primer elemento es el nodo actual, contamos 1
%    contador = 1
%    
%    # Iterar sobre los hijos del nodo (a partir del segundo elemento)
%    for hijo in termino[1:]:
%        contador += contar_nodos(hijo)  # Sumar los nodos de los hijos
%    
%    return contador
%
%# Ejemplo de uso
%arbol_multiway = [1, [2, [4], [5]], [3, [6, [7], [8]]]]
%print("El número total de nodos en el árbol multiway es: ",contar_nodos(arbol_multiway))
% -------- Código en Prolog --------------------
main :-
    contar_nodos(nodo(a, [nodo(b, []), nodo(c, [nodo(d, []), nodo(e, [])]), nodo(f, [])]), Contador),
    write('Arbol: nodo(a, [nodo(b, []), nodo(c, [nodo(d, []), nodo(e, [])]), nodo(f, [])])| Nodos :'), write(Contador), nl.
% Funcion que cuenta los nodos en un árbol multiway.
contar_nodos(nodo(_, Hijos), Contador) :-
    contar_nodos_hijos(Hijos, ContadorHijos),  % Contar los nodos en la lista de hijos.
    Contador is 1 + ContadorHijos.  % Contar el nodo actual + nodos de los hijos.

% Funcion auxiliar que cuenta los nodos en la lista de hijos.
contar_nodos_hijos([], 0).  % Si no hay hijos, el contador es 0.
contar_nodos_hijos([H | T], Contador) :-
    contar_nodos(H, ContadorHijo),  % Contar el nodo hijo.
    contar_nodos_hijos(T, ContadorResto),  % Contar el resto de los nodos.
    Contador is ContadorHijo + ContadorResto.  % Sumar el contador del hijo con el resto.

%-------------------------------------
% Ejemplo de uso:
%?- contar_nodos(nodo(a, [nodo(b, []), nodo(c, [nodo(d, []), nodo(e, [])]), nodo(f, [])]), Contador).
%Contador = 6.