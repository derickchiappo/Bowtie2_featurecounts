rule rseqc_distribution:
    input:
      bam = expand("workflow/data/sorted_reads/{sample}.bam",sample = samples)

    output:
      "workflow/data/Rseqc/read_distribution/{sample}_coverage.txt"

    conda:
      "../envs/rseqc.yaml"

    params:
      house_keeping = config["house_keeping_gene_file"]

    shell:
       "read_distribution.py -i {input.bam} \
       -r {params.house_keeping} > {output} "
