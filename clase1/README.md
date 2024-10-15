# Aprende a utilizar los flujos de análisis bioinformáticos internos del Inmegen
En este curso aprenderás a ejecutar los flujos de análisis bioinformáticos del Inmegen en los equipos de supercómputo del instituto
Consulta la información sobre estos flujos [aquí](https://serviciosbio.inmegen.gob.mx/)

## Clase 1 Introducción a NextFlow y Docker
El archivo CPI_clase1.pdf contiene la presentación de esta clase

## Parte práctica
### Conéctate al servidor de enseñanza del Inmegen Drona
Utilizando el comando **ssh** conectate a la dirección drona.inmegen.gob.mx o a la idrección IP:

Por ejemplo:

	ssh alumnoN@10.0.15.11 

Sustituye la N de "alumnoN" por el número que te tocó.

### Clona este repositorio
Para clonar este repositorio utiliza el comando git clone

	git clone https://github.com/INMEGEN/Clase_pipelines.git


### Obtén los datos de prueba

 - Crea el directorio data/ en tu home:

		mkdir data

 - Entra al directorio con:

		cd data/

 - Obtén los datos de prueba con:

		wget http://genomedata.org/rnaseq-tutorial/HBR_UHR_ERCC_ds_5pc.tar

 - Para descomprimirlos utiliza:

		tar -xvf HBR_UHR_ERCC_ds_5pc.tar

La bandera -x se usa para descomprimir, la -v imprime la salida y la -f es para apuntar al archivo HBR_UHR_ERCC_ds_5pc.tar

### Ejercicio 

Modifica los archivos main.nf, modules.nf y nextflow.config para automatizar las tareas que realizan FASTQC, FASTP y MULTIQC 

#### Forma de correr FASTQC

1. Colócate en tu home y crea el directorio ej_fastqc/

		cd
		mkdir ej_fastqc

3. Ejecuta el comando fastqc para el archivo que inicia con **HBR_Rep1**

		fastqc -o ej_fastqc -t 1 -f fastq -q data/HBR_Rep1_ERCC-Mix2_Build37-ErccTranscripts-chr22.read1.fastq.gz data/HBR_Rep1_ERCC-Mix2_Build37-ErccTranscripts-chr22.read2.fastq.gz 

Revisa la salida que obtuvimos en la carpeta ej_fastqc

3. Modificamos el comando de fastqc para utilizarlo en un proceso de NextFlow

- Entrada del proceso fastqc: tupla [sample,[read1,read2]]

		tuple val(sample), path(reads)

- Salida el proceso fastqc: diretorio sample

		path("${sample}/*"), emit: fq_files

- Script del proceso: comando fastqc

		mkdir -p ${sample}
  		fastqc -o ${sample} -t ${params.ncrs} -f fastq -q ${reads[0]} ${reads[1]}


4. Modifica el proceso fastqc en el archivo modules.nf 

5. Modifica el archivo main.nf y nextflow.config 

6. Corre NextFlow con el comando:

		nextflow run main.nf

¿Qué observas en el directorio resultados/out?

#### Forma de correr FASTP 

1. Colócate en tu home y crea el directorio ej_fastqc/

		cd
		mkdir ej_fastp

3. Ejecuta el comando fastqc para el archivo que inicia con **HBR_Rep1**

		fastp --in1 data/HBR_Rep1_ERCC-Mix2_Build37-ErccTranscripts-chr22.read1.fastq.gz --in2 data/HBR_Rep1_ERCC-Mix2_Build37-ErccTranscripts-chr22.read2.fastq.gz --out1 ej_fastp/HBR_Rep1_ERCC-Mix2_Build37_R1.trimmed.fq.gz --out2 ej_fastp/HBR_Rep1_ERCC-Mix2_Build37_R2.trimmed.fq.gz -g 10 -q 20 -l 50 -h HBR_Rep1_fastp.html

Como el archivo json tiene un nombre genérico, modificamos su nombre para que contenga el nombre de la muestra a la que pertenece con:

	mv fastp.json HBR_Rep1_fastp.json

3. Modificamos el comando de fastp para correrlo en un proceso de NextFlow

- Entrada del proceso fastp: tupla [sample,[read1,read2]]

		tuple val(sample), path(reads)

- Salida el proceso fastqc: archivos trimeados por muestra y los reportes en json y html

		tuple val(sample), path("${sample}_R1.trimmed.fq.gz"), path("${sample}_R2.trimmed.fq.gz"), emit: trim_fq
  		tuple path("${sample}_fastp.html"), path("${sample}_fastp.json")

- Script del proceso: comando fastqc

		fastp --in1 ${reads[0]} --in2 ${reads[1]} --out1 ${sample}_R1.trimmed.fq.gz --out2 ${sample}_R2.trimmed.fq.gz -g 9 -q 20 -l 50 -h ${sample}_fastp.html
  		mv fastp.json ${sample}_fastp.json

4. Modifica el proceso fastqc en el archivo main.nf y modules.nf 

6. Corre NextFlow con el comando:

		nextflow run main.nf

¿Qué observas en el directorio resultados/out?

Si ejecutaste todo bien debes de obtener un archivo similar al archivo que se encuentra en la carpeta resultados_esperados de este repositorio.

