# 🎨 Opportunity Insights Style for R Plots
*Updated: 2023-07-13*

## 🏅 Credit to the BBC Data Team
This package is inspired by and repurposed from the stellar BBC `bbplot` package, repackaged to facilitate creation of graphics in the OI style.

## 📦 How to Install the `oiplot` Package
As `oiplot` is not currently hosted on CRAN, it needs to be installed directly from GitHub using `devtools`. If you do not have the `devtools` package installed, you will need to run the first line in the code snippet below.

```r
# install.packages('devtools')
devtools::install_github('OpportunityInsights/oiplot')
```

For further information about oiplot, check out the package’s GitHub repository. The bulk of the details about how to use the package and its functions are detailed below.

Once you have downloaded and successfully installed the package, you are ready to create fantastic charts 🚀.

## 📝 Using the Functions
The package includes two core functions for plot styling: oi_style() and finalise_plot.

Detailed examples of how to use the functions from the bbplot package to produce graphics can be found in the R cookbook, which also provides a general reference manual for working with ggplot2.

Here's a brief summary and explanation:

## 🖌️ oi_style()
oi_style() does not require any arguments and is added to the ggplot chain after you have created a plot. It modifies the text size, font, colour, axis lines, axis text, and many other standard chart components to align with the OI style.

Please note, this function does not change based on the chart type you are making. In some cases, you will need to make additional theme arguments in your ggplot chain for any specific additions or changes to the style, such as adding or removing gridlines, etc. Colours for lines (for line charts) or bars (for bar charts) do not come predefined from the oi_style function, but need to be explicitly set in your other standard ggplot chart functions.

Here's an example of how it can be used in a standard workflow:
```r
# Create the scatter plot
scatter_plot <- ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point(size = 2, alpha = 0.8) +
  geom_smooth() +
  labs(x = "Weight", y = "Miles Per Gallon",
       title = "Scatterplot of Car Weight vs. MPG") +
  oi_style()
```
![image](https://github.com/OpportunityInsights/oiplot/assets/100818286/76ef65de-7b5d-4818-8372-2b0d28921f6a)

## 🎁 finalise_plot
finalise_plot allows you to save your plot adhering to the appropriate guidelines for publication. Currently, this function is identical to the 'bbplot' version, following BBC style. However, this is a work in progress. Here's an example of how the finalise_plot() function is used in a standard workflow:

```r
finalise_plot(
  plot_name = my_line_plot,
  source = "Source: ONS",
  save_filepath = "filename_that_my_plot_should_be_saved_to-nc.png",
  width_pixels = 640,
  height_pixels = 550
)
```
## 🎨 OI Facebook Colour Scheme
This package includes the set_oi_palette() function, which sets the OI Facebook colour scheme as the default palette for ggplots.

However, if a plot specifically sets a different colour or fill scale, that will override the defaults. The same is true if a plot sets a specific colour for a geom.
A workaround is to use the color scales directly in your plots, like so:

```r
## OI Facebook Colour Scheme
fb_palette <- c("#29B6A4", "#FAA523", "#003A4F", "#7F4892", "#A4CE4E", 
                "#2B8F43", "#0073A2", "#E54060", "#FFD400", "#6BBD45")

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
```

Let your data storytelling journey begin with oiplot! 🌈
