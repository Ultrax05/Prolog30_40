% ===============================================
% Autor: Ivan Jared Alvarez De Uña
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que construye 
%              arboles binarios completamente equilibrados.
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
%# Función para construir árboles binarios completamente equilibrados
%def construir_arboles_equilibrados(n):
%    if n == 0:
%        return [None]
%    if n == 1:
%        return [Nodo(0)]
%    
%    arboles = []
%    
%    # Intentar diferentes particiones de nodos entre el subárbol izquierdo y derecho
%    for i in range(n):
%        subarboles_izq = construir_arboles_equilibrados(i)
%        subarboles_der = construir_arboles_equilibrados(n - 1 - i)
%        
%        # Combinar los subárboles izquierdo y derecho
%        for izq in subarboles_izq:
%            for der in subarboles_der:
%                raiz = Nodo(0)
%                raiz.izquierda = izq
%                raiz.derecha = der
%                arboles.append(raiz)
%    
%    return arboles
%
%# Función para imprimir el árbol
%def imprimir_arbol(raiz, nivel=0, lado="C"):
%    if raiz is None:
%        return
%    print(" " * (nivel * 4) + f"{lado}: Nodo({raiz.valor})")
%    imprimir_arbol(raiz.izquierda, nivel + 1, "Izq")
%    imprimir_arbol(raiz.derecha, nivel + 1, "Der")
%
%# Ejemplo de uso
%n = 3  # Número de nodos
%print("Se han construido ",len(construir_arboles_equilibrados(n))," rboles binarios equilibrados con ",n," nodos.")
%for i, arbol in enumerate(construir_arboles_equilibrados(n), 1):
%    print("\nÁrbol ",i,":")
%    imprimir_arbol(arbol)
% -------- Código en Prolog --------------------
main :-
    arbol_bin_equ(5, X),
    write('5: '), write(X), nl.
% Construir árboles binarios completamente equilibrados de tamaño N.
arbol_bin_equ(0, nil).  % Un arbol vacío es un arbol equilibrado de tamaño 0.
arbol_bin_equ(N, arbol(x, Izquierdo, Derecho)) :-
    N > 0,
    N1 is (N - 1) // 2,
    N2 is N - 1 - N1,
    arbol_bin_equ(N1, Izquierdo),
    arbol_bin_equ(N2, Derecho).
%-------------------------------------
% Ejemplo de uso:
%?- arbol_bin_equ(5, Arbol).
%Arbol = arbol(x, arbol(x, nil, nil), arbol(x, arbol(x, nil, nil), arbol(x, nil, nil))).