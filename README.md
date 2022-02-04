Las secciones transversales de las líneas de intensidad de la escala se pueden modelar con una función gaussiana. 
Para este modelo, la determinación del centro de la línea a nivel de sub-píxel viene dado por un parámetro de la función gaussiana. 
Una función gaussiana tiene tres parámetros importantes: el centro “b” (centro de la lí-nea), la amplitud a (altura de la función) y el ancho de la campana “c”.

Ver: https://en.wikipedia.org/wiki/Gaussian_function

Interesa en este caso el centro de la función “b” de la ecuación gaussiana conocida.
Este parámetro se encuentra analizando la matriz de intensidades de la imagen en busca de valores máximos. 
Alrededor de cada uno de los píxeles de mayor intensidad, se extrae una vecindad lineal, ortogonal a cada posición de línea detectada. 
El centro de  segmento  está  ubicado  en  el  máximo  de  la  sección  transversal  ajustada  a  una  función  gaussiana. 

Finalmente, al obtener todos los centros de la escala a la misma vez, se puede construir una curva cuya pendiente otorgue la distancia 
promedio entre segmentos de la misma. Este procedimiento se aplica en ambos ejes de la escala (X, Y).
