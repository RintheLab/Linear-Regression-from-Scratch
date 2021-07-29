
# Plotting the S(betas) function ------------------------------------------

library(plot3D)

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

# Error function S(betas)
S <- function(beta0, beta1) {
  bs <- c(beta0, beta1)
  ep <- Y - X %*% bs
  sq_ep <- t(ep) %*% ep
  as.numeric(sq_ep)
}

# Define vectors to different beta0 and beta1
b0 <- seq(0, 5, by = 0.1)
b1 <- seq(2, 7, by = 0.1)
betas <- expand.grid(b0 = b0, b1 = b1)

# Define diferent results (as a matrix) for the error function
S_grid <- mapply(S, betas$b0, betas$b1)
S_grid <- matrix(S_grid, nrow = length(b0), byrow = FALSE)
  
# Make contour and 3D plot with the previous grid
jpeg(filename = "plots/contour_error.jpg", 
     width = 750, height = 600, quality = 400,
     pointsize = 15)
contour(
  b0, b1, S_grid,
  levels = c(70, 200, 500, 1000, 3000, 5000, 10000), 
  xlab = "β0", ylab = "β1",
  cex.lab = 1.5,
  labcex = 0.7,
  cex.axis = 1
  )
dev.off()

jpeg(filename = "plots/3D_error.jpg",
     width = 750, height = 600, quality = 400,
     pointsize = 15)
persp3D(
  b0, b1, S_grid, 
  xlab = "β0", ylab = "β1", zlab = "S(β)", clab = c("S(β)", "value"),
  contour = TRUE,
  cex.lab = 1.5,
  labcex = 1,
  cex.axis = 1,
  phi = 10, theta = 50
  )
dev.off()
