rule samtools_index:
    input:
        "workflow/data/sorted_reads/{sample}.bam"

    output:
        "workflow/data/sorted_reads/{sample}.bam.bai"

    conda:
        "../envs/samtools_2.yaml"

    shell:
        "samtools index {input}"
