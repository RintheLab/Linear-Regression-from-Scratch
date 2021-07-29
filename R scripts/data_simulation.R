
# Data simulation ---------------------------------------------------------

# Linear response 
y <- function(interp, coeff, x) {
  interp + coeff * x + rnorm(length(x), mean = 1.5, sd = 1.5)
}

# Independent variable
x <- rep(0:10, 4)

# Data
set.seed(1)

data <- data.frame(
  x = x,
  response = y(0.5, 5.1, x)
)

# Export data to a CSV file
write.csv(data, file = "data/data.csv", row.names = FALSE)