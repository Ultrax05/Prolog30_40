% ===============================================
% Autor: Ivan Jared Alvarez De Uña
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que cuenta las 
%              hojas de un arbol binario.
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
%# Función para contar las hojas de un árbol binario
%def contar_hojas(raiz):
%    # Si el nodo está vacío, no hay hojas
%    if raiz is None:
%        return 0
%    # Si el nodo es una hoja (sin hijos), contar como 1
%    if raiz.izquierda is None and raiz.derecha is None:
%        return 1
%    # Si no es una hoja, contar las hojas en los subárboles izquierdo y derecho
%    return contar_hojas(raiz.izquierda) + contar_hojas(raiz.derecha)
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
%print("El arbol tiene ",contar_hojas(arbol)," hojas.")
% -------- Código en Prolog --------------------
main :-
    contar_hojas(arbol(a, arbol(b, nil, nil), arbol(c, arbol(d, nil, nil), nil)), TotalHojas).
    write('Arbol: a, arbol(b, nil, nil), arbol(c, arbol(d, nil, nil), nil)| Total: '), write(TotalHojas), nl.
% Un arbol vacío tiene 0 hojas.
contar_hojas(nil, 0).

% Un nodo sin hijos izquierdo ni derecho es una hoja.
contar_hojas(arbol(_, nil, nil), 1).

% Contar las hojas en los subarboles izquierdo y derecho.
contar_hojas(arbol(_, Izquierdo, Derecho), TotalHojas) :-
    contar_hojas(Izquierdo, HojasIzq),
    contar_hojas(Derecho, HojasDer),
    TotalHojas is HojasIzq + HojasDer.
%-------------------------------------
% Ejemplo de uso:
%?- contar_hojas(arbol(a, arbol(b, nil, nil), arbol(c, arbol(d, nil, nil), nil)), TotalHojas).
%TotalHojas = 2.