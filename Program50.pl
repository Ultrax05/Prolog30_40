% ===============================================
% Autor: Ivan Jared Alvarez De Uña
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que construya 
%              arbol binarios eequilibrados en
%              altura.
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
%# Función para construir un árbol binario equilibrado en altura a partir de una lista ordenada
%def construir_arbol_equilibrado(lista):
%    # Caso base: Si la lista está vacía, devolver None
%    if not lista:
%        return None
%    
%    # Encontrar el índice del elemento medio de la lista
%    medio = len(lista) // 2
%    
%    # Crear el nodo raíz con el valor medio
%    raiz = Nodo(lista[medio])
%    
%    # Recursivamente construir el subárbol izquierdo y derecho
%    raiz.izquierda = construir_arbol_equilibrado(lista[:medio])  # Subárbol izquierdo
%    raiz.derecha = construir_arbol_equilibrado(lista[medio + 1:])  # Subárbol derecho
%    
%    return raiz
%
%# Función para imprimir el árbol en preorden
%def imprimir_arbol(raiz, nivel=0, lado="C"):
%    if raiz is None:
%        return
%    print(" " * (nivel * 4) + "",lado,": Nodo(",raiz.valor,")")
%    imprimir_arbol(raiz.izquierda, nivel + 1, "Izq")
%    imprimir_arbol(raiz.derecha, nivel + 1, "Der")
%
%# Ejemplo de uso
%lista = [1, 2, 3, 4, 5, 6, 7, 8, 9] 
%# Imprimir el árbol resultante
%print("Árbol binario equilibrado en altura:")
%imprimir_arbol(construir_arbol_equilibrado(lista))
% -------- Código en Prolog --------------------
main :-
    arbol_altura(3, Arbol),
    write('Res: '), write(Arbol), nl.
% Construir arboles binarios equilibrados en altura de una altura H.
arbol_altura(0, nil).  % Un arbol de altura 0 es un arbol vacio.
arbol_altura(H, arbol(x, Izquierdo, Derecho)) :-
    H > 0,
    H1 is H - 1,
    H2 is H - 2,
    (
        % Elegir el subarbol izquierdo con altura H1 y el derecho con altura H2.
        (arbol_altura(H1, Izquierdo), arbol_altura(H2, Derecho));
        % O viceversa.
        (arbol_altura(H2, Izquierdo), arbol_altura(H1, Derecho))
    ).

%-------------------------------------
% Ejemplo de uso:
%?- arbol_altura(3, Arbol).
%Arbol = arbol(x, arbol(x, arbol(x, nil, nil), arbol(x, nil, nil)), arbol(x, nil, arbol(x, nil, nil))).
