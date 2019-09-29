# Taller de análisis de imágenes por software

## Propósito

Introducir el análisis de imágenes/video en el lenguaje de [Processing](https://processing.org/).

## Tareas

Implementar las siguientes operaciones de análisis para imágenes/video:

* Conversión a escala de grises: promedio _rgb_ y [luma](https://en.wikipedia.org/wiki/HSL_and_HSV#Disadvantages).
* Aplicación de algunas [máscaras de convolución](https://en.wikipedia.org/wiki/Kernel_(image_processing)).
* (solo para imágenes) Despliegue del histograma.
* (solo para imágenes) Segmentación de la imagen a partir del histograma.
* (solo para video) Medición de la [eficiencia computacional](https://processing.org/reference/frameRate.html) para las operaciones realizadas.

Emplear dos [canvas](https://processing.org/reference/PGrapvshics.html), uno para desplegar la imagen/video original y el otro para el resultado del análisis.

## Integrantes

Completar la tabla:

| Integrante | github nick |
|------------|-------------|
| Laura Angélica Cárdenas Vargas | lacardenasv            |
| Joan Sebastian Contreras Peña  | jscontrerasp            |

## Discusión

(describa brevemente las actividades realizadas y los resultados obtenidos)

Para la sección del histograma, se muestra la imagen en escala de grises en la parte inferior izquierda, el histograma donde se puede seleccionar un rango de pixeles, y en la parte inferior derecha se muestran los pixeles que estén en el rango escogido, se aplica un fondo color blanco para detallar mejor los pixeles escogidos.

Para la sección de la escala de Grises y Luma se usaron los valores de conversión Y' = 0.299\*r + 0.587\*g + 0.114\*b extraidos de [Luma](https://es.wikipedia.org/wiki/Luma_(v%C3%ADdeo)) se puede observar en el archivo `luma.pde` 
Para algunas imágenes si se resalta la luminosidad o se aprecia un fondo más oscuro, en otras imágenes es muy similar a la escala de grises por promedio.

* Luma es un algoritmo para caracterizar pixeles de acuerdo a su limunosidad por medio una ecuación que nos describe los coeficientes para cada componente (Rojo, Verde, Azul) en el espacio dimensional de un video dependiendo del formato. Para el ejercicio hicimos uso del formato **UIT-R BT.601-7**
