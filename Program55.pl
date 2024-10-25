% ===============================================
% Autor: Ivan Jared Alvarez De Uña
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que colecta los
%              nodos de un nivel dado en una lista.
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
%# Función para recolectar los nodos en un nivel dado
%def colectar_nodos_en_nivel(raiz, nivel):
%    nodos_en_nivel = []
%
%    # Función recursiva auxiliar para recorrer el árbol y recolectar nodos
%    def recolectar_nodos(nodo, nivel_actual):
%        if nodo is None:
%            return
%        # Si estamos en el nivel deseado, agregar el nodo a la lista
%        if nivel_actual == nivel:
%            nodos_en_nivel.append(nodo.valor)
%        else:
%            # Continuar con los subárboles izquierdo y derecho
%            recolectar_nodos(nodo.izquierda, nivel_actual + 1)
%            recolectar_nodos(nodo.derecha, nivel_actual + 1)
%
%    # Llamar a la función auxiliar con la raíz del árbol y nivel inicial
%    recolectar_nodos(raiz, 0)
%    return nodos_en_nivel
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
%nivel_deseado = 2
%print("Los nodos en el nivel ", nivel_deseado, " son: ", colectar_nodos_en_nivel(arbol, nivel_deseado))
% -------- Código en Prolog --------------------
main :-
    ?- nodos_en_nivel(arbol(a, arbol(b, nil, nil), arbol(c, arbol(d, nil, nil), nil)), 1, Nodos),
    write('Arbol: arbol(a, arbol(b, nil, nil), arbol(c, arbol(d, nil, nil), nil))| En nivel 1| Nodos: '), write(Nodos), nl.
% Un arbol vacio no tiene nodos.
nodos_en_nivel(nil, _, []).

% Cuando el nivel solicitado es 0, devuelve la raiz del arbol.
nodos_en_nivel(arbol(Raiz, _, _), 0, [Raiz]).

% Si el nivel solicitado es mayor que 0, busca en los subarboles.
nodos_en_nivel(arbol(_, Izquierdo, Derecho), Nivel, Nodos) :-
    Nivel > 0,
    NuevoNivel is Nivel - 1,  % Reduce el nivel en 1 para buscar en los hijos.
    nodos_en_nivel(Izquierdo, NuevoNivel, NodosIzq),  % Busca en el subarbol izquierdo.
    nodos_en_nivel(Derecho, NuevoNivel, NodosDer),      % Busca en el subarbol derecho.
    append(NodosIzq, NodosDer, Nodos).  % Combina los resultados.

%-------------------------------------
% Ejemplo de uso:
%?- nodos_en_nivel(arbol(a, arbol(b, nil, nil), arbol(c, arbol(d, nil, nil), nil)), 1, Nodos).
%Nodos = [b, c].