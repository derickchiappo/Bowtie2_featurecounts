rule trimgalore:
    input:
      fq1="workflow/data/fastq/{sample}/{sample}_1.fastq.gz",
      fq2="workflow/data/fastq/{sample}/{sample}_2.fastq.gz"

    output:
      "workflow/data/trimgalore/{sample}/{sample}_1_val_1.fq.gz",
      "workflow/data/trimgalore/{sample}/{sample}_2_val_2.fq.gz",
      "workflow/data/trimgalore/{sample}/{sample}_1.fastq.gz_trimming_report.txt",
      "workflow/data/trimgalore/{sample}/{sample}_2.fastq.gz_trimming_report.txt"

    conda:
      "../envs/trimgalore.yaml"

    params:
        outdir="workflow/data/trimgalore/{sample}"

    shell:
     " trim_galore -j 2 -phred33 --paired -q 20 \
     -o {params.outdir} \
      {input.fq1} {input.fq2} "
