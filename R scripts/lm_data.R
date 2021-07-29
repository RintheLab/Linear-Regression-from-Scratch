
# Using lm() to adjust the data -------------------------------------------

# Import data 
data <- read.csv(file = "data/data.csv")

# Adjust the data using lm()
data_lm <- lm(response ~ x, data = data)
lm_sum <- summary(data_lm)

# Export the results of the previous function
capture.output(lm_sum, file = "data/lm_sum.txt")