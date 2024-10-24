# Aprende a utilizar los flujos de análisis bioinformáticos internos del Inmegen
En este curso aprenderás a ejecutar los flujos de análisis bioinformáticos del Inmegen en los equipos de supercómputo del instituto
Consulta la información sobre estos flujos [aquí](https://serviciosbio.inmegen.gob.mx/)

## Clase 4 Flujo de trabajo **"Identificación de variantes somáticas (WES/WGS)"**
El archivo CPI_clase5.pdf contiene la presentación de esta clase

Recuerda que según la [definición del NIH](https://www.cancer.gov/espanol/publicaciones/diccionarios/diccionario-genetica/def/variante): Una variante es una alteración en la secuencia más común de nucleótidos del ADN. El término variante se usa para describir una alteración que puede ser benigna, patógena o de repercusión incierta. Este término se usa cada vez más en lugar del término mutación. También se llama variación de secuencia, variación genética, variante de secuencia y variante genética. Por lo que la indentificación de variantes es de los estudios más realizados hoy en día.

Una variante somática es una alteración del ADN que ocurre después de la concepción. Las variantes somáticas se pueden presentar en cualquiera de las células del cuerpo, excepto en las células germinativas (espermatozoides y óvulos), y, por lo tanto, no pasan a los hijos o hijas. En ocasiones, estas alteraciones causan cáncer u otras enfermedades. 
En el entorno de la genética del cáncer, una variante somática es aquella variante que se produce en el ADN antes de o durante la formación del tumor. También se llama mutación somática.

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

Ingresa al directorio VC-Somatic

¿Qué observas?

### Archivos suplementarios

Ingresa al directorio

		cd /STORAGE/servicios/2024-Curso

donde encontraras los siguientes subdirectorios.

2024-Curso/
├── VCS_files
├── bed_somatic
├── data_somatic

 - El subdirectorio VCS_files contiene los archivos **nextflow.config** y **sample_info.tsv** que necesitaras para ejecutar cada uno de los pipelines que componen el flujo  VC-Somatic.
   Sólo tienes que editar en el archivo nextflow.config el directorio de salida, modificando la N del campo alumnoN por el número que te tocó.  

 - El directorio bed_somatic contiene los archivos adicionales para correr los flujos de trabajo 

 - El directorio data_somatic contienen archivos alineados en formato bam que utilizaras en los flujos.

## Ejercicio

Realiza la indentificación de variantes somáticas siguiendo las instrucciones del [repositorio](https://github.com/INMEGEN/Pipelines_INMEGEN/tree/Principal/VC-Somatic).

Recuerda que primera parte de este análisis es utilizar el flujo [Data-preprocessing](https://github.com/INMEGEN/Pipelines_INMEGEN/tree/Principal/Data-preprocessing).

#### Opción 1
 
Utiliza el contenido de los archivos **sample_info.tsv** y **nextflow.config** para ejecutar cada flujo de trabajo.

Sólo susituye la N donde dice alumnoN con el número que te tocó.

#### Opción 2

Genera el archivo sample_info.tsv a partir de los datos que estan en /STORAGE/servicios/2024-Curso/data_DNA 

Modifica el archivo dde configuración.

Ejecuta el flujo de trabajo con:

	bash run_nextflow.sh /path/to/out/dir

 **Importante** Recuerda esperar hasta que se te indique que corras tu flujo.
