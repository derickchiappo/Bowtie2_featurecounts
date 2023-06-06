rule generate_counts:
    input:
        bam = expand("workflow/data/sorted_reads/{sample}.bam",sample = samples),
        annot = config["annotation_file"],
        bai = expand("workflow/data/sorted_reads/{sample}.bam.bai",sample = samples),

    output:
        "workflow/data/counts/counts.txt"

    conda:
        "../envs/generate_counts.yaml"

    shell:
        " featurecounts -p -B -M -O --fraction -a {input.annot} \
        -g gene_id \
        -o {output} {input.bam}"
