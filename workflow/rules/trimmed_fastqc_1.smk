rule trimmed_fastq_qc_1:
    input:
       fq1 = "workflow/data/trimgalore/{sample}/{sample}_1_val_1.fq.gz"

    output:
      "workflow/data/fastqc_files/{sample}_1_val_1_fastqc.zip"

    conda:
      "../envs/fastqc.yaml"

    resources:
      walltime="2:00:00",
      select=1,
      ncpus=32,
      mem="40gb"

    params:
        outdir="workflow/data/fastqc_files/"

    shell:
       "fastqc -o {params.outdir} {input} "
