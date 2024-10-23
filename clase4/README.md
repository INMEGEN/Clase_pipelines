# Aprende a utilizar los flujos de análisis bioinformáticos internos del Inmegen
En este curso aprenderás a ejecutar los flujos de análisis bioinformáticos del Inmegen en los equipos de supercómputo del instituto
Consulta la información sobre estos flujos [aquí](https://serviciosbio.inmegen.gob.mx/)

## Clase 4 Flujo de trabajo **"Identificación conjunta de variantes germinales (WES/WGS)"**
El archivo CPI_clase4.pdf contiene la presentación de esta clase

Recuerda que según la [definición del NIH](https://www.cancer.gov/espanol/publicaciones/diccionarios/diccionario-genetica/def/variante): Una variante es una alteración en la secuencia más común de nucleótidos del ADN. El término variante se usa para describir una alteración que puede ser benigna, patógena o de repercusión incierta. Este término se usa cada vez más en lugar del término mutación. También se llama variación de secuencia, variación genética, variante de secuencia y variante genética. Por lo que la indentificación de variantes es de los estudios más realizados hoy en día.

## Parte práctica
### Conéctate al servidor de lg

Utilizando el comando **ssh** conectate a la idrección IP:


	ssh alumnoN@10.0.15.6 

Sustituye la N de "alumnoN" por el número que te tocó.

### Actualiza este repositorio

Para clonar este repositorio utiliza el comando git clone

	git clone https://github.com/INMEGEN/Clase_pipelines.git

Si ya clonaste este repositorio lo único que tienes que hacer es actualizarlo con el comando:

	git pull

### Clona el repositorio pipelines Inmegen

Recuerda colocarte en tu home con el comando cd

Clona el repositorio utilizando el comando:

	git clone https://github.com/INMEGEN/Pipelines_INMEGEN.git

Si ya clonaste este repositorio lo único que tienes que hacer es actualizarlo con el siguiente comando:

        git pull

Ingresa al directorio VC-Germline

¿Qué observas?

### Archivos suplementarios

En el directorio: /STORAGE/servicios/2024-Curso, se encuentras los siguientes subdirectorios.

2024-Curso/
├── VCG_files
├── bed_files
├── data_DNA

El subdirectorio VCG_files contiene los archivos **nextflow.config** y **sample_info.tsv** que necesitaras para ejecutar el pipeline VC-Germline.
Sólo tienes que editar en el archivo nextflow.config el directorio de salida, modificando la N del campo alumnoN por el número que te tocó.  

## Ejercicio
Realiza la indentificación conjunta de variantes germinales siguiendo las instrucciones del [repositorio](https://github.com/INMEGEN/Pipelines_INMEGEN/tree/Principal/VC-Germline).

#### Opción 1 
Utiliza el contenido de los archivos **sample_info.tsv** y **nextflow.config** para ejecutar el flujo de trabajo.

Sólo susituye la N donde dice alumnoN con el número que te tocó.

#### Opción 2
Genera el archivo sample_info.tsv a partir de los datos que estan en /STORAGE/servicios/2024-Curso/data_DNA 

Modifica el archivo dde configuración.

Ejecuta el flujo de trabajo con:

	bash run_nextflow.sh /path/to/out/dir

 **Importante** Recuerda esperar hasta que se te indique que corras tu flujo.
