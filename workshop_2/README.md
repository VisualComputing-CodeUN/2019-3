# Taller ilusiones visuales

## Propósito

Comprender algunos aspectos fundamentales de la [inferencia inconsciente](https://github.com/VisualComputing/Cognitive) de la percepción visual humana.

## Tareas

Implementar al menos 6 ilusiones de tres tipos distintos (paradójicas, geométricas, ambiguas, etc.), al menos dos con movimiento y dos con interactividad.

*Recomendación:* implementar el código desde ceros.

## Integrantes

Complete la tabla:

| Integrante | github nick |
|------------|-------------|
| Laura Angélica Cárdenas Vargas | lacardenasv            |
| Joan Sebastian Contreras Peña  | jscontrerasp            |

## Discusión

1. Complete la tabla

| Ilusión | Categoria | Referencia | Tipo de interactividad (si aplica) | URL código base (si aplica) |
|---------|-----------|------------|------------------------------------|-----------------------------|
|Creación de imagenes en "baja calidad" por division simetrica de imagen original|           | https://www.youtube.com/watch?v=f1fXCRtSUWU&fbclid=IwAR0MzWONPESL6aNynfyjep1i7roO3MYKLqeJ0u_qrzRAjUbfzUBGJKFyxlc           |Se puede cambiar la imagen y la cantidad de columnas y filas a dividir                                    |                             |
|confusion al saber si linea es recta o curva|Ceguera de curvatura|https://www.playgroundmag.net/comunidad/ceguera-curvatura-ilusion-optica-detectarla_30452490.html            |Se puede variar el ancho de las lineas y su color para notar el efecto|                             |
|Imagenes en movimiento|Kinegramas o Scanimation |https://michaelbach.de/ot/mot-scanimation/index.html           |Se puede mover la grilla para tapar secciones de la imagen, se puede cambiar el grosor y el espacio entre lineas, se puede cambiar la imagen|                                    |
|Propagación del color de neón    | Geométrica          |    https://www.businessinsider.es/fotos-ilusiones-opticas-alucinantes-explicacion-como-funcionan-393039        |   Se puede cambiar de rango las líneas que estan de color neón lo que nos permite poder observar desde varias perspectivas el círculo "blanco" que nuestro cerebro percibe haciendo click encima de la imagen, en el lugar donde queremos que se cambie el color.                            |                             |
|Ilusión cromática de la prisión      | Ambiguas          | https://www.youtube.com/watch?v=vtw7nNMSrWM           |  Al deslizar el mouse, una grilla dividida en dos colores se transpone a la imagen original, donde podemos observar la ilusión de la transformación del color de las figuras en la imagen.                          |                             |
|Ilusión de gradiente         |     Percepción de ligereza      |  https://www.dailymail.co.uk/sciencetech/article-6065035/The-incredible-color-changing-gradient-illusion-break-brain.html          |  Al mantener el click presionado en la imagen el gradiente del background desaparece y se puede observar que el color de la barra central es el mismo en todos los puntos.                                 |   https://processing.org/examples/lineargradient.html                          |

2. Describa brevememente las referencias estudiadas y los posibles temas en los que le gustaría profundizar

En la sección de división de fotos, como solo dividiendo la imagen, como el cerebro hace ara realizar imagenes de una manera no exacta la replica de la original, seria interesante profundizar en esta sección de cómo o porque el cerebro puede hacer eso, o tambien la composición de la imagen tratada.
El efecto de kinegrama, es complejo implementar la manera de generar la imagen, todas las imágenes usadas, son de internet y por ende cada una tiene su patrón, ya se la anchura de las barras grises o el espaciado entre ellas, una malla no funciona para cualquier kinegrama, debe ajustarse (para eso se deja interactiva esa parte).
Para la ilusión de la ceguera de curvatura se intentó realizar el efecto que aparece en el video de la referencia pero en processing es algo complejo realizar ese efecto de cambio de color fluido.
Con respecto a la propagación del color neón, un tema de investigación abierto son las causas del efecto en sí, existen varias teorías pero ninguna es satisfactoria ante los ojos de los académicos.
La causa del por qué vemos la barra central de diferentes colores en la ilusión del gradiente, es un fenómeno llamado *lightness perception* en donde nuestros ojos perciben los colores de manera diferente basado en la sombra del objeto en el fondo o en el frontier.
En la ilusión cromática se da porque nuestro cerebro interpreta el color de un objeto basándose en los colores que lo rodean.

## Entrega

* Plazo para hacer _push_ del repositorio a github: ~~6/10/19~~ 14/10/19 a las 24h.
