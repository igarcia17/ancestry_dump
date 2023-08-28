# Load the dplyr package
library(dplyr)

# Read the first file with 5 columns
file1 <- read.table("HM3_b37.bim", header = FALSE)
colnames(file1) <- c('chr', 'ids', 'algo', 'otra', 'cosa', 'si')

# Read the second file with 2 columns (A and B)
file2 <- read.table("just_ids.vcf", header = FALSE)
colnames(file2) <- c('ids', 'rs')

# Perform a left join based on column A
merged_data <- left_join(file1, file2, by = "ids")

# Save the updated dataframe to a new file
write.table(merged_data2, "updated_HM3_b37.bim", sep = "\t", row.names = FALSE)
