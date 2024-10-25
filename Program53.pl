% ===============================================
% Autor: Ivan Jared Alvarez De Uña
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que reune las
%              hojas de un arbol binario en una lista.
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
%# Función para recolectar las hojas de un árbol binario en una lista
%def reunir_hojas(raiz):
%    # Lista para almacenar las hojas
%    hojas = []
%    
%    # Función recursiva auxiliar para recorrer el árbol y encontrar las hojas
%    def recolectar_hojas(nodo):
%        if nodo is None:
%            return
%        # Si el nodo es una hoja, agregarlo a la lista de hojas
%        if nodo.izquierda is None and nodo.derecha is None:
%            hojas.append(nodo.valor)
%        else:
%            # Continuar con los subárboles izquierdo y derecho
%            recolectar_hojas(nodo.izquierda)
%            recolectar_hojas(nodo.derecha)
%
%    # Llamar a la función auxiliar con la raíz del árbol
%    recolectar_hojas(raiz)
%    return hojas
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
%print("Las hojas del árbol son: ", reunir_hojas(arbol))
% -------- Código en Prolog --------------------
main :-
    reunir_hojas(arbol(a, arbol(b, nil, nil), arbol(c, arbol(d, nil, nil), nil)), Hojas),
    write('Arbol: arbol(a, arbol(b, nil, nil), arbol(c, arbol(d, nil, nil), nil))| Hojas: '), write(Hojas), nl.
% Un arbol vacio tiene una lista de hojas vacia.
reunir_hojas(nil, []).

% Si el nodo no tiene hijos izquierdo ni derecho, es una hoja, asi que se añade a la lista.
reunir_hojas(arbol(Hoja, nil, nil), [Hoja]).

% Reunir las hojas de los subarboles izquierdo y derecho.
reunir_hojas(arbol(_, Izquierdo, Derecho), Hojas) :-
    reunir_hojas(Izquierdo, HojasIzq),
    reunir_hojas(Derecho, HojasDer),
    append(HojasIzq, HojasDer, Hojas).

%-------------------------------------
% Ejemplo de uso:
%?- reunir_hojas(arbol(a, arbol(b, nil, nil), arbol(c, arbol(d, nil, nil), nil)), Hojas).
%Hojas = [b, d].
