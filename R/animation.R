#' Aligns plot axes
#'
#' Useful when giving a talk and adding elements to the same set of axes
#' in subsequent slides.
#' 
#' Operates in place (meaning that the original plots are themselves updated).
#' 
#' @examples
#' plots <- c(4, 6, 8) %>% map(make_plot)
#' align_axes(plots)
#' 
#' @importFrom purrr map map_dfr
#' @import ggplot2
#' @export
align_axes <- function(unaligned_plots) suppressWarnings({

  # get the extent of the plots
  lims <- unaligned_plots %>%
    map(ggplot_build) %>%
    map_dfr(~ list(
      x = .x$layout$panel_scales_x[[1]]$range$range,
      y = .x$layout$panel_scales_y[[1]]$range$range
    )) %>% 
    summarize(across(c(x, y), c(min, max)))

  unaligned_plots %>%
    patchwork::align_plots() %>%
    map(~ set_limits(.x,
      xlim = c(lims$x_1, lims$x_2),
      ylim = c(lims$y_1, lims$y_2)
    ))

  unaligned_plots
})

get_scale <- function(plot, axis) {
  s <- plot$scales$get_scales(axis)

  if (is.null(s)) {
    plot <- plot + if (axis == "x") scale_x_continuous() else scale_y_continuous()
    s <- plot$scales$get_scales(axis)
  }
  
  s
}

set_limits <- function(plot, xlim, ylim) {
  x <- get_scale(plot, "x")
  x$limits <- xlim

  y <- get_scale(plot, "y")
  y$limits <- ylim
}
