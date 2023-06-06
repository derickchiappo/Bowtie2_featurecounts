rule bowtie2_align:
    input:
      fq1 = "workflow/data/trimgalore/{sample}/{sample}_1_val_1.fq.gz",
      fq2 = "workflow/data/trimgalore/{sample}/{sample}_2_val_2.fq.gz",
      idx = multiext(
          config["strain"],
          ".1.bt2",
          ".2.bt2",
          ".3.bt2",
          ".4.bt2",
          ".rev.1.bt2",
          ".rev.2.bt2",
      ),

    output:
      "workflow/data/bam_files/{sample}.bam"

    conda:
      "../envs/bowtie2.yaml"

    params:
      index = config["strain"]

    shell:
      " bowtie2 --no-unal -x {params.index} -1 {input.fq1} -2 {input.fq2} | samtools view -bS > {output}"
