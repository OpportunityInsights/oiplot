# install oiplot
# devtools::document()
# devtools::install_local(force = T)

library(oiplot)
library(tidyverse)

# --- basic test ---

scatter_plot <- ggplot(mtcars, aes(wt, mpg)) +
  geom_point() +
  geom_smooth() +
  labs(
    x = "Weight", y = "Miles Per Gallon",
    title = "Scatterplot of Car Weight vs. MPG"
  )

print(scatter_plot) # should be default theme

set_oi_theme(high_contrast = T)
print(scatter_plot) # should be oi them

# --- animation test ---

make_plot <- function(max_cyl) {
  mtcars %>%
  mutate(wt = ifelse(cyl <= max_cyl, wt, NA)) %>%
  ggplot(aes(wt, mpg, color = as.factor(cyl))) +
  geom_point() +
  geom_smooth(se = F, show.legend = F) +
  scale_x_continuous(labels = \(x) str_glue("{x}k")) +
  scale_y_log10() +
  labs(
    title = "Car Weight vs. MPG",
    x = "Weight (lbs)",
    y = "Miles Per Gallon",
    color = "Cylinders"
  )
}

plots <- c(4, 6, 8) %>% map(make_plot)
plots

align_axes(plots)
plots
