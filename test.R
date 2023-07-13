#### Test ####

# Install oiplot
devtools::install_github("Tom-Harris-MIT/oiplot")

# Load the oiplot and ggplot2 packages
library(oiplot)
library(ggplot2)

# Setting default OI Facebook Palette
set_oi_palette()

# Create the scatter plot
scatter_plot <- ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point(size = 2, alpha = 0.8) +
  geom_smooth() +
  labs(
    x = "Weight", y = "Miles Per Gallon",
    title = "Scatterplot of Car Weight vs. MPG"
  ) +
  oi_style()

# Print the plot
scatter_plot


## OI Facebook Colour Scheme
fb_palette <- c(
  "#29B6A4", "#FAA523", "#003A4F", "#7F4892", "#A4CE4E",
  "#2B8F43", "#0073A2", "#E54060", "#FFD400", "#6BBD45"
)

scatter_plot <- ggplot(mtcars, aes(x = wt, y = mpg, colour = as.factor(cyl))) +
  geom_point(size = 2, alpha = 0.8) +
  geom_smooth() +
  labs(
    x = "Weight", y = "Miles Per Gallon",
    title = "Scatterplot of Car Weight vs. MPG"
  ) +
  oi_style() +
  scale_colour_manual(values = fb_palette) # Apply the color scale manually to the plot

print(scatter_plot)
