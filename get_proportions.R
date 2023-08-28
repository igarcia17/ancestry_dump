#For MDS:
# Load necessary library
library(cluster)

# Generate synthetic labeled data (replace with your actual data)
set.seed(42)
num_samples <- 100
num_features <- 2
num_clusters <- 11

# Create labeled data with features and cluster labels
labeled_data <- matrix(runif(num_samples * num_features), ncol = num_features)
cluster_labels <- sample(1:num_clusters, num_samples, replace = TRUE)

# Create unlabeled data point (replace with your actual data)
unlabeled_point <- c(0.4, 0.5)

# Train KMeans clustering model
kmeans_model <- kmeans(labeled_data, centers = num_clusters, nstart = 25)

# Predict cluster for the unlabeled point
predicted_cluster <- as.integer(predict(kmeans_model, newdata = matrix(unlabeled_point, ncol = num_features)))

cat("Predicted Cluster:", predicted_cluster, "\n")

# Optionally, get cluster assignment probabilities
cluster_probabilities <- as.vector(predict(kmeans_model, newdata = matrix(unlabeled_point, ncol = num_features), type = "probs"))
cat("Cluster Probabilities:", cluster_probabilities, "\n")


#For PCA:

library(mclust)

pca_data <- read.table("output_prefix.eigenvec", header = FALSE)

#Fit a Gaussian Mixture Model to your PCA data using the `Mclust` function from the `mclust` package:

model <- Mclust(pca_data[, 3:ncol(pca_data)], G = 11)  # Assuming the first two columns are labels and IDs

#`G` is the number of clusters, which is 11 in your case.

new_point <- c(x_coord, y_coord)
cluster_probs <- predict(model, new_point)$posterior

#Remember to adjust the column indices and the number of clusters (`G`) based on your data. The `Mclust` function also offers more advanced options for model selection, so you might want to explore those options if needed.

#assumes that the PCA dimensions are representative of the underlying data distribution, and the success of the estimation depends on the quality of the PCA and the distribution of your data points.