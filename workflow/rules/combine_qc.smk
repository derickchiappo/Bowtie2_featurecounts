rule combine_qc:
    input:
          strand=expand("workflow/data/Rseqc/strandness/{sample}_strandness.txt",sample = samples),
          distribution=expand("workflow/data/Rseqc/read_distribution/{sample}_coverage.txt",sample = samples),
          bam_stats=expand("workflow/data/Rseqc/bam_stats/{sample}_bamstats.txt",sample = samples),
          counts="workflow/data/counts/counts.txt",
          body_coverage="workflow/data/Rseqc/",
          fastq=expand(["workflow/data/fastqc_files/{sample}_1_fastqc.zip",
                        "workflow/data/fastqc_files/{sample}_2_fastqc.zip"],sample = samples),
          trimmed_fastqc = expand(["workflow/data/fastqc_files/{sample}_1_val_1_fastqc.zip",
                                  "workflow/data/fastqc_files/{sample}_2_val_2_fastqc.zip"],sample = samples)


    output:
      "workflow/data/Rseqc/multiqc/multiqc_report.html"

    conda:
      "../envs/multiqc.yaml"

    shell:
        """
         multiqc {input} -o workflow/data/Rseqc/multiqc/ --cl-config "log_filesize_limit: 2000000000"

         """
