# Taller raster

## Propósito

Comprender algunos aspectos fundamentales del paradigma de rasterización.

## Tareas

Emplee coordenadas baricéntricas para:

1. Rasterizar un triángulo.
2. Sombrear su superficie a partir de los colores de sus vértices.
3. Implementar un [algoritmo de anti-aliasing](https://www.scratchapixel.com/lessons/3d-basic-rendering/rasterization-practical-implementation/rasterization-practical-implementation) para sus aristas.

Referencias:

* [The barycentric conspiracy](https://fgiesen.wordpress.com/2013/02/06/the-barycentric-conspirac/)
* [Rasterization stage](https://www.scratchapixel.com/lessons/3d-basic-rendering/rasterization-practical-implementation/rasterization-stage)

Implemente la función ```triangleRaster()``` del sketch adjunto para tal efecto, requiere la librería [nub](https://github.com/visualcomputing/nub/releases) (versión >= 0.2).

## Integrantes

Complete la tabla:

| Integrante | github nick |
|------------|-------------|
| Laura Angélica Cárdenas Vargas | lacardenasv            |
| Joan Sebastian Contreras Peña  | jscontrerasp            |

## Discusión

Describa los resultados obtenidos. En el caso de anti-aliasing describir las técnicas exploradas, citando las referencias.

El taller se empezó entendiendo las formulas para hayar los pesos, determinantes y normalizaciones desde la referencia [The barycentric conspiracy](https://fgiesen.wordpress.com/2013/02/06/the-barycentric-conspirac/); ya con esto en mente se plantearon que todos los rellenos de los triangulos iban a tener la técnica de sombreado.

Según la teoría el determinante de los puntos que se encuentren dentro del triangulo debe dar un resultado positivo, tambien contando 0 como positivo, pero al estar realizando este cálculo nos dimos cuenta que en processing **los valores de los determinantes de los puntos internos del triangulo daban negativo**, esto puesto que el plano en processing tiene una transformación lineal con respecto a la teoria y la [documentación](https://fgiesen.wordpress.com/2013/02/06/the-barycentric-conspirac/): lo que sucede es que los vlaores en el plano Y en processing aumentan hacia la parte inferior de la pantalla, obviamente viendolo como plano en 2 dimensiones, esta transformación hace que se inviertan los valores del determinante.

## Entrega

* Plazo: ~~20/10/19~~ 27/10/19 a las 24h.
