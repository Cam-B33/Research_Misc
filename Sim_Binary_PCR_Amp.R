# Define a function to generate binary values that sum to a given total
generate_binary_sum <- function(total) {
  # Initialize an array of zeros
  values <- rep(0, 8)
  # While the total sum is less than the desired total, randomly assign 1s to the array
  while(sum(values) < total) {
    values[sample(1:8, 1)] <- 1
  }
  return(values)
}
# Create a new dataframe to hold the binary values
df_all_binary <- data.frame()
# Loop over each row in df_all_samples
for (i in 1:nrow(df_all_samples)) {
  total_sum <- df_all_samples$Positive_PCR[i]  # Get the total sum for the current row
  # Generate 8 binary values that sum to the total for the current row
  binary_values <- generate_binary_sum(total_sum)
  # Add the binary values as a new row to the dataframe
  df_all_binary <- rbind(df_all_binary, binary_values)
}
# Add the new binary columns to the original dataframe
df_all_samples$col1 <- df_all_binary[, 1]
df_all_samples$col2 <- df_all_binary[, 2]
df_all_samples$col3 <- df_all_binary[, 3]
df_all_samples$col4 <- df_all_binary[, 4]
df_all_samples$col5 <- df_all_binary[, 5]
df_all_samples$col6 <- df_all_binary[, 6]
df_all_samples$col7 <- df_all_binary[, 7]
df_all_samples$col8 <- df_all_binary[, 8]