// Proceso FastQC
process fastqc {
  cache 'lenient'
  publishDir params.out + "/fastqc", mode:'copy'

  input:
  tuple val(sample), path(reads)

  output:
  path("calidad_sample1"), emit: fq_files

  script:
  """
   fastqc -v
  """
}

// Proceso Fastp
process fastp {
  cache 'lenient'
  publishDir params.out + "/trimmed_files", mode:'copy'
  
  input:
  tuple val(sample), path(reads)

  output:
  tuple val(sample), path("trimming_file_R2"), path("trimming_file_R1"), emit: trim_fq

  script:
  """
   fastp
  """
}

// Proceso MultiQC
process multiqc {
  cache 'lenient'
  container 'pipelinesinmegen/pipelines_inmegen:public'
  publishDir params.out, mode: 'copy'

  input:
  val(dir_fastqc)
  val(dir_fastp)
  path(dir_all)

  output:
  path("multiqc/*")   , emit: multiqc_fq_data

  script:
  """
    mkdir -p multiqc

    multiqc -o multiqc/ ${dir_all}
  """
}
