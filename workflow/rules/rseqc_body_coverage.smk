rule rseqc_body_coverage:
    input:
      bam_folder = "workflow/data/sorted_reads/"

    output:
      out_pdf = "out.geneBodyCoverage.curves.pdf",
      out_ext = "workflow/data/Rseqc/out"


    conda:
      "../envs/rseqc.yaml"

    params:
      house_keeping = "workflow/data/mm10.HouseKeepingGenes.bed"

    shell:
       "geneBody_coverage.py -i {input.bam_folder} -r {params.house_keeping} -o {output.out_ext}"
