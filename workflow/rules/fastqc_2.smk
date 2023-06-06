rule fastq_qc_2:
    input:
       fq1 = "workflow/data/fastq/{sample}/{sample}_2.fastq.gz"

    output:
      "workflow/data/fastqc_files/{sample}_2_fastqc.zip"

    conda:
      "../envs/fastqc.yaml"

    params:
        outdir="workflow/data/fastqc_files/"

    shell:
       "fastqc -o {params.outdir} {input} "
