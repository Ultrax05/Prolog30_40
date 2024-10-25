% ===============================================
% Autor: Ivan Jared Alvarez De Uña
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que construya 
%              arbol binarios eequilibrados en
%              altura con N nodos.
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
%# Función para construir un árbol binario equilibrado en altura con un número dado de nodos
%def construir_arbol_equilibrado_nodos(n, valor_inicial=1):
%    if n == 0:
%        return None, valor_inicial
%    
%    # Determina la cantidad de nodos en el subárbol izquierdo y derecho
%    nodos_izq = (n - 1) // 2
%    nodos_der = n - 1 - nodos_izq
%    
%    # Crear el subárbol izquierdo y obtener el siguiente valor disponible
%    izquierda, siguiente_valor = construir_arbol_equilibrado_nodos(nodos_izq, valor_inicial)
%    
%    # Crear el nodo raíz con el valor actual
%    raiz = Nodo(siguiente_valor)
%    siguiente_valor += 1
%    
%    # Crear el subárbol derecho usando el siguiente valor disponible
%    derecha, siguiente_valor = construir_arbol_equilibrado_nodos(nodos_der, siguiente_valor)
%    
%    # Asignar los subárboles al nodo raíz
%    raiz.izquierda = izquierda
%    raiz.derecha = derecha
%    
%    return raiz, siguiente_valor
%
%# Función para imprimir el árbol en preorden
%def imprimir_arbol(raiz, nivel=0, lado="C"):
%    if raiz is None:
%        return
%    print(" " * (nivel * 4) + f"{lado}: Nodo({raiz.valor})")
%    imprimir_arbol(raiz.izquierda, nivel + 1, "Izq")
%    imprimir_arbol(raiz.derecha, nivel + 1, "Der")
%
%# Ejemplo de uso
%n = 7  # Número de nodos
%arbol_equilibrado, _ = construir_arbol_equilibrado_nodos(n)
%
%# Imprimir el árbol resultante
%print("Árbol binario equilibrado en altura con ",n," nodos:")
%imprimir_arbol(arbol_equilibrado)
% -------- Código en Prolog --------------------
main :-
    arbol_bin(7, Arbol),
    write('Res: '), write(Arbol), nl.
% Construir arboles binarios equilibrados en altura con N nodos.
arbol_bin(0, nil).  % Un arbol con 0 nodos es un arbol vacio.
arbol_bin(N, arbol(x, Izquierdo, Derecho)) :-
    N > 0,
    N1 is (N - 1) // 2,    % Dividir nodos entre subárbol izquierdo y derecho
    N2 is N - 1 - N1,
    arbol_bin(N1, Izquierdo),
    arbol_bin(N2, Derecho).
%-------------------------------------
% Ejemplo de uso:
%?- arbol_bin(7, Arbol).
%Arbol = arbol(x, arbol(x, arbol(x, nil, nil), arbol(x, nil, nil)), arbol(x, arbol(x, nil, nil), arbol(x, nil, nil))).