[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/4452lqlM)
Compilador CHILERO (primera fase)
=================================

Al iniciar la tarea, su repositorio debera contener los siguientes archivos y directorios importantes:

* Makefile
* README.md
* lexer-chilero
* lexer-chilero/src/main/java/gt/edu/url/compiler
* lexer-chilero/src/main/jflex
* cooltests

`Makefile` contiene objetivos para compilar y ejecutar su programa. NO MODIFICAR.

`README.md` contiene esta información. 

`lexer-chilero/src/main/jflex/simpletokenizer.lex` es un archivo esqueleto para la especificación del analizador léxico. Debera completarlo con expresiones, patrones y acciones.

Dentro de `cooltests` encontrará tres programas de prueba:

1. `test.cl` en el cual puede probar análisis léxico y recuperación de errores. Este programa NO es correcto y le puede servir para verificar que su analizador léxico detecte correctamente los errores. Así mismo debera modificarlo para que sea correcto.
2. `factloop.cl` es una calculadora de factorial.
3. `stack.cl` es una solución a la máquina de pila previamente elaborada en el laboratorio.

`lexer-chilero/src/main/java/gt/edu/url/TokenConstants.java` contiene definiciones de constantes que utilizan casi todas las partes del compilador. NO MODIFICAR.

`lexer-chilero/src/main/java/gt/edu/url/Table.java` y `lexer-chilero/src/main/java/gt/edu/url/Symbol.java` contienen tablas de cadenas y símbolos útiles en las siguientes fases del compilador NO MODIFICAR.

`lexer-chilero/src/main/java/gt/edu/url/Utilities.java` contiene varias funciones de soporte utilizadas por el controlador lexer principal (Lexer.java). NO MODIFICAR.

`mycoolc` es un script de shell que une las fases del compilador que utiliza pipes de Unix en lugar de vincular estáticamente el código.  Si bien es ineficiente, esta arquitectura facilita la combinación y combinación los componentes que escribe con los del compilador del curso. NO MODIFICAR.

Tareas principales
------------------

1. Implemente el analizador léxico para COOL y su dialecto CHILERO en el archivo `lexer-chilero/src/main/jflex/simpletokenizer.lex`.
2. En la última sección de este archivo debera redactar una explicación clara de su solución en lenguaje académico (formal, en tercera persona, directo). Debera explicar las decisiones de diseño, como implementó el soporte al dialecto, si necesitó estados intermedios en JFlex, explicar por qué su código es correcto y que modificaciones se realizaron sobre `test.cl` para que fuera un programa correcto.  Asi mismo debe comentar el código que considere conveniente en JFlex.
3. En el archivo `lexer-chilero/src/main/java/gt/edu/url/Lexer.java` encontrará una implementación de un método principal que invoca a su lexer e imprime los tokens que se detectan. Esta salida es obligatoria para las siguientes fases del proyecto. Debera escribir su propia versión utilizando PicoCLI tal y como se vio en el laboratorio. Esta versión también debera soportar análisis individual de Tokens.
4. El día de la entrega/calificación su instructor le indicará algunas modificaciones con pruebas adicionales (programas en español, ejecuciones de lexer en línea de comandos). El cual usted debera aceptar para comprobar el análisis de su solución.

Note que el autograder proporcionado con este repositorio incluye únicamente pruebas sobre stack y factorial

Instrucciones de uso del makefile
---------------------------------

El archivo Makefile incluido en su repositorio presenta algunas tareas útiles que pueden ser invocadas directamente en la línea de comandos.

Para compilar su programa ejecute

> make compile

Para generar un script `lexer` que ejecute su analizador léxico, ejecute

> make lexer

Para limpiar todo el proyecto ejecute:

> make clean

Así mismo existen dos fases adicionales que ejecutan en secuencia varios pasos para una prueba completa de su solución.

La primera es `make dofactorial` la cual limpia su proyecto, ejecuta la compilación, genera el lexer y ejecuta una prueba del programa `factloop.cl`.

La segunda es `make dostack` la cual limpia su proyecto, ejecuta la compilación, genera el lexer y ejecuta una prueba del programa `stack.cl`.

Si cree que su analizador léxico es correcto, puede ejecutar `mycoolc` el cual une SU analizador léxico con, los analizadores sintácticos, semánticos, generador de código y optimizador de cool. 

Si su analizador léxico se comporta de una manera inesperada, puede obtener errores en cualquier lugar, es decir, durante análisis sintáctico, durante el análisis semántico, durante la generación de código o solo cuando ejecuta el código producido en spim. 

¡Éxitos!

Redacción para primera fase
---------------------------
