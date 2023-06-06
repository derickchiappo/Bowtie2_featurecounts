rule rseqc_strandness:
    input:
      bam = expand("workflow/data/sorted_reads/{sample}.bam",sample = samples)

    output:
      "workflow/data/Rseqc/strandness/{sample}_strandness.txt"

    conda:
      "../envs/rseqc.yaml"

    params:
      house_keeping = "workflow/data/mm10.HouseKeepingGenes.bed"

    shell:
       "infer_experiment.py -i {input.bam} \
       -r {params.house_keeping} > {output} "
