rule samtools_sort:
    input:
        "workflow/data/bam_files/{sample}.bam"

    output:
        "workflow/data/sorted_reads/{sample}.bam"

    conda:
        "../envs/samtools_2.yaml"

    shell:
        "samtools sort -T {input} \
        -O bam {input} > {output}"
