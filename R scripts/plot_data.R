
# Plot the data -----------------------------------------------------------

library(ggplot2)

# Import data
data <- read.csv(file = "data/data.csv")

# Plot the data
data_plot <- ggplot(data, aes(x, response)) +
  geom_point(color = "blue") +
  xlab("[Sucrose]") +
  ylab("Alcohol yield (%)") +
  theme_classic(base_size = 22)

# Export data_plot to a JPEG file
ggsave("plots/plot.jpeg", plot = data_plot)
