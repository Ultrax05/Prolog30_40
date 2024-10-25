% ===============================================
% Autor: Ivan Jared Alvarez De Uña
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que reune los
%              nodos internos de un arbol binario.
%              Se incluye una versión en python.
% ===============================================
% -------- Código en python ------------
%# Definición del nodo del árbol
%class Nodo:
%    def __init__(self, valor):
%        self.valor = valor
%        self.izquierda = None
%        self.derecha = None
%
%# Función para recolectar los nodos internos de un árbol binario en una lista
%def colectar_nodos_internos(raiz):
%    # Lista para almacenar los nodos internos
%    nodos_internos = []
%
%    # Función recursiva auxiliar para recorrer el árbol y encontrar nodos internos
%    def recolectar_nodos(nodo):
%        if nodo is None:
%            return
%        # Si el nodo tiene al menos un hijo, es un nodo interno
%        if nodo.izquierda is not None or nodo.derecha is not None:
%            nodos_internos.append(nodo.valor)
%        # Continuar con los subárboles izquierdo y derecho
%        recolectar_nodos(nodo.izquierda)
%        recolectar_nodos(nodo.derecha)
%
%    # Llamar a la función auxiliar con la raíz del árbol
%    recolectar_nodos(raiz)
%    return nodos_internos
%
%# Función auxiliar para construir un árbol de ejemplo
%def ejemplo_arbol():
%    raiz = Nodo(1)
%    raiz.izquierda = Nodo(2)
%    raiz.derecha = Nodo(3)
%    raiz.izquierda.izquierda = Nodo(4)
%    raiz.izquierda.derecha = Nodo(5)
%    raiz.derecha.derecha = Nodo(6)
%    return raiz
%
%# Ejemplo de uso
%arbol = ejemplo_arbol()
%print("Los nodos internos del árbol son: ", colectar_nodos_internos(arbol))
% -------- Código en Prolog --------------------
main :-
    colectar_nodos(arbol(a, arbol(b, nil, nil), arbol(c, arbol(d, nil, nil), nil)), Nodos),
    write('Arbol: arbol(a, arbol(b, nil, nil), arbol(c, arbol(d, nil, nil), nil))| Nodos: '), write(Nodos), nl.
% Un arbol vacio no tiene nodos internos.
colectar_nodos(nil, []).

% Si un nodo tiene al menos un hijo, se añade a la lista de nodos internos.
colectar_nodos(arbol(Raiz, Izquierdo, Derecho), [Raiz | NodosInternos]) :-
    (   Izquierdo \= nil; Derecho \= nil  % Verifica que al menos uno de los hijos no sea nil.
    ),
    colectar_nodos(Izquierdo, NodosIzq),
    colectar_nodos(Derecho, NodosDer),
    append(NodosIzq, NodosDer, NodosInternos).

% Si un nodo es una hoja, no se añade a la lista.
colectar_nodos(arbol(_, nil, nil), NodosInternos) :-
    NodosInternos = [].  % Si es una hoja, la lista de nodos internos es vacia.
%-------------------------------------
% Ejemplo de uso:
%?- colectar_nodos(arbol(a, arbol(b, nil, nil), arbol(c, arbol(d, nil, nil), nil)), Nodos).
%Nodos = [a, c].