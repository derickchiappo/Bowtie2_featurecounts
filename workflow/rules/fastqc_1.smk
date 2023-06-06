rule fastq_qc_1:
    input:
       fq1 = "workflow/data/fastq/{sample}/{sample}_1.fastq.gz"

    output:
      "workflow/data/fastqc_files/{sample}_1_fastqc.zip"

    conda:
      "../envs/fastqc.yaml"

    params:
        outdir="workflow/data/fastqc_files/"

    shell:
       "fastqc -o {params.outdir} {input} "
