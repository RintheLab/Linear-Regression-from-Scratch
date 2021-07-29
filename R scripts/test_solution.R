
# Testing solution obtained by matrix algebra -----------------------------

# Import data
data <- read.csv(file = "data/data.csv")

# X matrix 
X <- matrix(
  c(rep(1, length(data$x)), data$x), 
  nrow = length(data$x), ncol = 2
  )

# Response matrix (Y)
Y <- matrix(
  data$response, 
  nrow = length(data$response)
)

# Calculate beta0 and beta1
betas <- solve(t(X) %*% X) %*% t(X) %*% Y