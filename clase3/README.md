# Aprende a utilizar los flujos de análisis bioinformáticos internos del Inmegen
En este curso aprenderás a ejecutar los flujos de análisis bioinformáticos del Inmegen en los equipos de supercómputo del instituto
Consulta la información sobre estos flujos [aquí](https://serviciosbio.inmegen.gob.mx/)

## Clase 3 Flujo de trabajo 
El archivo CPI_clase3.pdf contiene la presentación de esta clase

Recuerda que según la [definición del NIH](https://www.cancer.gov/espanol/publicaciones/diccionarios/diccionario-genetica/def/variante): Una variante es una alteración en la secuencia más común de nucleótidos del ADN. El término variante se usa para describir una alteración que puede ser benigna, patógena o de repercusión incierta. Este término se usa cada vez más en lugar del término mutación. También se llama variación de secuencia, variación genética, variante de secuencia y variante genética. Por lo que la indentificación de variantes es de los estudios más realizados hoy en día.

## Parte práctica
### Conéctate al servidor de lg

Utilizando el comando **ssh** conectate a la idrección IP:


	ssh alumnoN@10.0.15.6 

Sustituye la N de "alumnoN" por el número que te tocó.

### Actualiza este repositorio

Para clonar este repositorio utiliza el comando git clone

	git clone https://github.com/INMEGEN/Clase_pipelines.git

Si ya clonaste este repositorio lo único que tienes que hacer es actualizarlo con el comando dentro del directorio Clase_pipelines:

	git pull

### Clona el repositorio pipelines Inmegen

Recuerda colocarte en tu home con el comando cd

Clona el repositorio utilizando el comando:

	git clone https://github.com/INMEGEN/Pipelines_INMEGEN.git

Ingresa al directorio VC-RNAseq 

¿Qué observas?

### Archivos suplementarios

En la carpeta nextflow_files de esta clase encontraras los archivos de necesarios para correr el flujo de trabajo **VC-RNAseq**.

## Ejercicio
Realiza la indentificación de variantes de datos de RNAseq siguiendo las instrucciones del [repositorio](https://github.com/INMEGEN/Pipelines_INMEGEN/tree/Principal/VC-RNAseq).

Copia el contenido de los archivos **sample_info.tsv** y **nextflow.config**

Sólo susituye la N donde dice alumnoN con el número que te tocó.

Ejecuta el flujo de trabajo con:

	bash run_nextflow.sh /path/to/out/dir

 **Importante** Recuerda esperar hasta que se te indique que corras tu flujo.
