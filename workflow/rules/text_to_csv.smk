rule text_to_csv:
    input:
        "workflow/data/counts/counts.txt"

    output:
        "workflow/data/counts/counts.csv"

    conda:
        "../envs/text_to_csv.yaml"

    script:
        "../Scripts/text_to_csv.R"
