# Set the candidate thresholds to test
thresholds <- seq(30, 45, by = 0.5)
# Read the env_samples.csv and nc_samples.csv files into data frames
env_samples <- read.csv("env_samples.csv")
nc_samples <- read.csv("nc_samples.csv")


calculate_sensitivity_specificity <- function(tp, fn, fp, tn) {
  sensitivity = tp / (tp + fn)
  specificity = tn / (tn + fp)
  return(list(sensitivity, 1 - specificity))
}

# Store the sensitivity and specificity values for each threshold in separate vectors
sensitivities <- numeric(length(thresholds))
specificities <- numeric(length(thresholds))

for (i in 1:length(thresholds)) {
  
  tp <- sum(apply(env_samples, 1, mean) > thresholds[i])
  fn <- sum(apply(env_samples, 1, mean) < thresholds[i])
  fp <- sum(apply(nc_samples, 1, mean) > thresholds[i])
  tn <- sum(apply(nc_samples, 1, mean) <= thresholds[i])
  
  ss <- calculate_sensitivity_specificity(tp, fn, fp, tn)
  sensitivity <- ss[[1]]
  specificity <- ss[[2]]
  
  sensitivities[i] <- sensitivity
  specificities[i] <- specificity
  
  # Print the specificity and 1 - specificity values for this threshold
  cat(sprintf("Threshold: %.1f, Sensitivity: %.2f, 1-Specificity: %.2f\n", thresholds[i], sensitivity, specificity))
  
}

# Plot a curve of sensitivity vs specificity
plot(specificities, sensitivities, type = "l", xlab = "False Positive Rate",
     ylab = "True Positive Rate", main = "ROC Curve")



# Define a function to calculate Youden's J statistic for a given threshold
calculate_j_statistic <- function(tp, fn, fp, tn) {
  sensitivity = tp / (tp + fn)
  specificity = tn / (tn + fp)
  j_statistic = sensitivity + specificity - 1
  return(list(threshold = thresholds[i], j_statistic = j_statistic))
}
# Initialize variables to keep track of the optimal threshold and J statistic
optimal_threshold <- NA
max_j_statistic <- -Inf

# Loop over candidate thresholds and calculate Youden's J statistic for each one
for (i in 1:length(thresholds)) {
  tp <- sum(apply(env_samples, 1, mean) >= thresholds[i])
  fn <- sum(apply(env_samples, 1, mean) < thresholds[i])
  fp <- sum(apply(nc_samples, 1, mean) >= thresholds[i])
  tn <- sum(apply(nc_samples, 1, mean) < thresholds[i])
  
  j_statistic <- calculate_j_statistic(tp, fn, fp, tn)$j_statistic
  
  if (j_statistic > max_j_statistic) {
    optimal_threshold <- calculate_j_statistic(tp, fn, fp, tn)$threshold
    max_j_statistic <- j_statistic
  }
}
cat(sprintf("Optimal threshold: %.1f, Youden's J statistic: %.2f\n", optimal_threshold, max_j_statistic))