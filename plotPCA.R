library(ggplot2)  
library(dplyr)    

eigenvals <- read.table("resultados/res_prueba5/prueba5.eigenval", header = FALSE)
eigenvecs <- read.table("resultados/res_prueba5/prueba5.eigenvec", header = TRUE)

eigen_data <- cbind(eigenvals, eigenvecs)
colnames(eigen_data) <- c("Eigenvalue", paste0("PC", 1:ncol(eigenvecs)))

sample_ids <- read.table("prueba5.rel.id", header = FALSE)
phenotype_data <- read.table("phenotype_data.txt", header = TRUE)  # Adjust the file name

eigen_data <- merge(sample_ids, eigen_data, by.x = "V1", by.y = "V2", sort = FALSE)
eigen_data <- merge(eigen_data, phenotype_data, by.x = "V1", by.y = "Sample_ID", sort = FALSE)

ggplot(eigen_data, aes(x = PC1, y = PC2, color = Phenotype)) +
  geom_point() +
  labs(title = "PCA Plot of Genomic Data",
       x = "Principal Component 1",
       y = "Principal Component 2",
       color = "Phenotype") +
  theme_minimal()
