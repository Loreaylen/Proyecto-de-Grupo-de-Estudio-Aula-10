
"""Valoración final del módulo programador: Ejercicio de Python """

"""Ejercicio 4: Crear una lista en Python denominada 'Perro2'.
 Recorrer la lista con un bucle y mostrar sus elementos por pantalla, comenzando desde el último hasta el primero."""

Perro2 = [14, "Fido", "12/12/2012", "Macho", 23546987]
PLargo = len(Perro2)


for i in range(len(Perro2)):
    print(Perro2[PLargo-i-1])
