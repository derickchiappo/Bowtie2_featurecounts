rule bowtie2_reference:
    input:
      ref= config["genome_fasta_file"]

    output:
        multiext(
            config["strain"],
            ".1.bt2",
            ".2.bt2",
            ".3.bt2",
            ".4.bt2",
            ".rev.1.bt2",
            ".rev.2.bt2",
        ),
    log:
        "logs/bowtie2_build/build.log",
        
    threads: 8
    wrapper:
        "v1.31.1/bio/bowtie2/build"
