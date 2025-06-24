# 🎨 oiplot 🎨

## Installation 📦

You can install `oiplot` with `devtools`:

```r
# if necessary:
# install.packages('devtools')

devtools::install_github('opportunityinsights/oiplot')
```

## Usage 🖌️

This package exports `theme_oi()`, which one can use like any other `ggplot` theme.
To use the OI color scheme, you can add `scale_color_oi()` and/or `scale_fill_oi()` to your plot.

If you'd rather not manually specify these for every plot, you can call `set_oi_theme()`
at the top of your script. This will update the default theme and color scheme.

## Examples

### Simple plot

```{r}
library(tidyverse)
library(oiplot)

set_oi_theme()

plot <- ggplot(mtcars, aes(disp, mpg)) +
  geom_point() +
  geom_smooth() +
  labs(
    x = "Engine Displacement", y = "Miles Per Gallon",
    title = "Engine Size vs. MPG"
  )

print(plot)
```

### Aligning plot axes

```{r}
library(tidyverse)
library(oiplot)

set_oi_theme()

make_plot <- function(max_cyl) {
  mtcars %>%
  mutate(wt = ifelse(cyl <= max_cyl, wt, NA)) %>%
  ggplot(aes(wt, mpg, color = as.factor(cyl))) +
  geom_point() +
  geom_smooth(method = "lm", se = F, show.legend = F) +
  scale_x_continuous(labels = \(x) str_glue("{x}k")) +
  labs(
    title = "Car Weight vs. MPG",
    x = "Weight (lbs)",
    y = "Miles Per Gallon",
    color = "Cylinders"
  )
}

plots <- c(4, 6, 8) %>%
  map(make_plot) %>%
  align_axes()

plots
```

## Credits

This package is inspired by and repurposed from the BBC `bbplot` package.
