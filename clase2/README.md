# Aprende a utilizar los flujos de análisis bioinformáticos internos del Inmegen
En este curso aprenderás a ejecutar los flujos de análisis bioinformáticos del Inmegen en los equipos de supercómputo del instituto
Consulta la información sobre estos flujos [aquí](https://serviciosbio.inmegen.gob.mx/)

## Clase 2 Flujo de trabajo cuantificación y análisis de expresión diferencial (pipeline Q&DEA)
El archivo CPI_clase2.pdf contiene la presentación de esta clase

## Parte práctica
### Conéctate al servidor de enseñanza del Inmegen Drona

Utilizando el comando **ssh** conectate a la dirección drona.inmegen.gob.mx o a la idrección IP:

Por ejemplo:

	ssh alumnoN@10.0.15.11 

Sustituye la N de "alumnoN" por el número que te tocó.

### Actualiza este repositorio

Como ya clonaste este repositorio lo único que tienes que hacer es actualizarlo con el comando:

	git pull

### Clona el repositorio pipelines Inmegen

Recuerda colocarte en tu home con el comando cd

Clona el repositorio utilizando el comando:

	git clone https://github.com/INMEGEN/Pipelines_INMEGEN.git

Ingresa al directorio QDEA-RNAseq 

¿Qué observas?

### Archivos suplementarios

Ingresa a la [liga](https://drive.google.com/drive/folders/1W2nWkeT5ggAV8bMk95LhwmST-5CtKUnt?usp=sharing) y descarga el archivo comprimido ref_c2.tar, este archivo contiene el índice de kallisto y la referencia de STAR, archivos impresindibles para el funcionamiento del flujo de trabajo.

 - Crea un directorio en tu home llamado references

		mkdir references

 - Copia desde tu computadora el archivo ref_c2.tar al directorio references utilizando el comando 

		scp ref_c1.tar alumnoN@10.0.15.11:/home/alumnoN/references/

Sustituye la N de "alumnoN" por el número que te tocó, para que este comando funcione debes ejecutarlo en el directorio donde se encuentra el archivo ref_c2.tar.

 - Para descomprimir el archivo utiliza:

		tar -xvf ref_c2.tar

La bandera -x se usa para descomprimir, la -v imprime la salida y la -f es para apuntar al archivo HBR_UHR_ERCC_ds_5pc.tar

## Ejercicio
Realiza el análisis de expresión diferenial de los archivos descargados en la clase 1 siguiendo las instrucciones del [repositorio](https://github.com/INMEGEN/Pipelines_INMEGEN/tree/Principal/QDEA-RNAseq).
