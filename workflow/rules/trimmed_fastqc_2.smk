rule trimmed_fastq_qc_2:
    input:
       fq2 = "workflow/data/trimgalore/{sample}/{sample}_2_val_2.fq.gz"

    output:
      "workflow/data/fastqc_files/{sample}_2_val_2_fastqc.zip"

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
