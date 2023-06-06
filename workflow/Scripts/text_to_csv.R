
#Generation of csv file with raw counts
path_to_files <- "workflow/data/counts"

table1 <- read.table(paste0(path_to_files,"/","counts.txt"),skip =1,header = TRUE)

table1_df <- as.data.frame(table1)

write.csv(x = table1_df,file = "workflow/data/counts/counts.csv")


