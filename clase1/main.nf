#!/usr/bin/env nextflow

nextflow.enable.dsl=2

// Importar los procesos del archivo modules.nf
include { fastqc;
          multiqc } from "./modules.nf"

workflow {
    // Define el canal de entrada con los datos que alimentarán al primer proceso

    data_fq = Channel.fromFilePairs("${params.reads}")
                     .ifEmpty { error "Cannot find any reads matching: ${params.reads}"  }

    // Ejecuta el fasstq usando el canal de entrada
    fastqc(canal_de_entrada)

    // Ejecuta el fastp usando el canal de entrada
    //procesoA(canal_de_entrada)

    // Ejecuta multiqc con los datos de salida de fastqc y fastp
    multiqc(fastqc.out.fq_files.collect(),fastp.out.trim_fq.collect() ,"${params.out}")
}
