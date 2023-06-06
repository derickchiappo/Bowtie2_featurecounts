rule rseqc_rRNA:
    input:
      bam = expand("workflow/data/sorted_reads/{sample}.bam",sample = samples)

    output:
      "workflow/data/Rseqc/bam_stats/{sample}_bamstats.txt"

    params:
        outdir = "workflow/data/Rseqc/bam_stats/"

    conda:
      "../envs/rseqc.yaml"

    shell:
       "bam_stat.py -i {input.bam} > {output} "
