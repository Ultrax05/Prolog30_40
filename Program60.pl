% ===============================================
% Autor: Ivan Jared Alvarez De Uña
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que verifica que
%              una sentencia sea un arbol multiway.
%              Se incluye una versión en python.
% ===============================================
% -------- Código en python ------------
%def es_arbol_multiway(termino):
%    # Función recursiva para verificar la estructura del árbol
%    def verificar(nodo):
%        # Si el nodo no es una lista, no es un árbol multiway válido
%        if not isinstance(nodo, list):
%            return False
%        # El primer elemento debe ser el valor del nodo
%        if len(nodo) == 0:
%            return False  # Nodo vacío
%        # Verificar los hijos del nodo
%        for hijo in nodo[1:]:  # Ignoramos el primer elemento que es el valor
%            if not verificar(hijo):
%                return False
%        return True
%
%    return verificar(termino)
%
%# Ejemplo de uso
%termino_arbol = [1, [2, [4], [5]], [3, [6]]]
%termino_no_arbol = [1, [2, [4]], 3, [5]]  # Estructura incorrecta
%
%print(f"El término ",termino_arbol," representa un árbol multiway: ",es_arbol_multiway(termino_arbol))
%print(f"El término ",termino_no_arbol," representa un árbol multiway: ",es_arbol_multiway(termino_no_arbol))
% -------- Código en Prolog --------------------
main :-
    write('Arbol: nodo(a, [nodo(b, []), nodo(c, [nodo(d, [])])])|'),
    es_arbol_multiway(nodo(a, [nodo(b, []), nodo(c, [nodo(d, [])])])), nl.
% Un nodo vacío no es un arbol multiway.
es_arbol_multiway(nil) :- !, fail.

% Un arbol multiway debe tener una raiz y una lista de hijos.
es_arbol_multiway(nodo(Raiz, Hijos)) :-
    atom(Raiz),          % La raiz debe ser un atomo.
    es_lista_hijos(Hijos).  % Verifica que los hijos sean una lista valida.

% Verifica si una lista de hijos es valida.
es_lista_hijos([]).  % Una lista vacia es valida.

es_lista_hijos([H | T]) :-  % Un nodo en la lista de hijos.
    es_arbol_multiway(H),    % Verifica que H sea un arbol multiway.
    es_lista_hijos(T).       % Verifica el resto de la lista.
%-------------------------------------
% Ejemplo de uso:
%?- es_arbol_multiway(nodo(a, [nodo(b, []), nodo(c, [nodo(d, [])])])).
%true.
%?- es_arbol_multiway(nodo(a, [nodo(b, []), 5])).
%false.