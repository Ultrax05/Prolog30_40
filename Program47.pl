% ===============================================
% Autor: Ivan Jared Alvarez De Uña
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que compruebe 
%              si un arbol binarios es simetrico.
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
%# Función para comprobar si dos subárboles son simétricos
%def son_simetricos(subarbol_izq, subarbol_der):
%    # Si ambos subárboles son nulos, son simétricos
%    if not subarbol_izq and not subarbol_der:
%        return True
%    # Si solo uno de ellos es nulo, no son simétricos
%    if not subarbol_izq or not subarbol_der:
%        return False
%    # Comprobar si los valores de los nodos coinciden y sus hijos son simétricos
%    return (subarbol_izq.valor == subarbol_der.valor and
%            son_simetricos(subarbol_izq.izquierda, subarbol_der.derecha) and
%            son_simetricos(subarbol_izq.derecha, subarbol_izq.izquierda))
%
%# Función para comprobar si un árbol es simétrico
%def es_simettrico(raiz):
%    # Un árbol vacío es simétrico
%    if not raiz:
%        return True
%    # Comprobar si los subárboles izquierdo y derecho son simétricos
%    return son_simetricos(raiz.izquierda, raiz.derecha)
%
%# Función auxiliar para crear un árbol de ejemplo
%def ejemplo_arbol():
%    raiz = Nodo(1)
%    raiz.izquierda = Nodo(2)
%    raiz.derecha = Nodo(2)
%    raiz.izquierda.izquierda = Nodo(3)
%    raiz.izquierda.derecha = Nodo(3)
%    raiz.derecha.izquierda = Nodo(3)
%    raiz.derecha.derecha = Nodo(3)
%    return raiz
%
%# Ejemplo de uso
%if es_simettrico(ejemplo_arbol()):
%    print("El árbol es simétrico")
%else:
%    print("El árbol no es simétrico")
% -------- Código en Prolog --------------------
% Punto de entrada principal.
main :-
    write('arbol(x, arbol(y, nil, nil), arbol(y, nil, nil)): '),
    arbol_simetrico(arbol(x, arbol(y, nil, nil), arbol(y, nil, nil))) -> write('Es simetrico'); write('No es simetrico'))
     , nl.

% Comprobar si un árbol es simétrico.
arbol_simetrico(nil).  % Un árbol vacío es simétrico.
arbol_simetrico(arbol(_, Izquierdo, Derecho)) :-
    espejo(Izquierdo, Derecho).

% Comprobar si dos árboles son espejos entre sí.
espejo(nil, nil).  % Dos árboles vacíos son espejos entre sí.
espejo(arbol(_, I1, D1), arbol(_, I2, D2)) :-
    espejo(I1, D2),  % El subárbol izquierdo de uno debe ser el espejo del subárbol derecho del otro.
    espejo(D1, I2).  % Y viceversa.

%-------------------------------------
% Ejemplo de uso:
%?- arbol_simetrico(arbol(x, arbol(y, nil, nil), arbol(y, nil, nil))).
%true.
