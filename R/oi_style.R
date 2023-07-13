#' Add oi theme to ggplot chart
#'
#' This function allows you to add the oi theme to your ggplotgraphics.
#' @keywords oi_style
#' @export
#' @examples
#' line <- ggplot(line_df, aes(x = year, y = lifeExp)) +
#'   geom_line(colour = "#007f7f", size = 1) +
#'   geom_hline(yintercept = 0, size = 1, colour = "#333333") +
#'   oi_style()

#' Set global color options
#' @export
set_oi_palette <- function() {
  my_palette <- c(
    "#29B6A4", "#FAA523", "#003A4F", "#7F4892", "#A4CE4E",
    "#2B8F43", "#0073A2", "#E54060", "#FFD400", "#6BBD45"
  )

  # Update the default settings
  update_geom_defaults("point", list(colour = my_palette[1]))
  update_geom_defaults("smooth", list(colour = my_palette[1]))
  update_geom_defaults("line", list(colour = my_palette[2]))

  # Set global color options
  scale_colour_discrete <- function(...) scale_colour_manual(values = my_palette, ...)
  scale_fill_discrete <- function(...) scale_fill_manual(values = my_palette, ...)
}


#' The OI plot style
#' @export
oi_style <- function() {
  font <- "Helvetica"
  ggplot2::theme_classic(base_family = font) %+replace%
    ggplot2::theme(
      plot.title = ggplot2::element_text(
        size = 16,
        face = "bold",
        color = "#222222",
        margin = ggplot2::margin(0, 0, 15, 0),
        hjust = 0.5
      ),
      plot.subtitle = ggplot2::element_text(
        size = 12,
        margin = ggplot2::margin(9, 0, 9, 0)
      ),
      legend.position = "bottom",
      legend.text = ggplot2::element_text(
        size = 12,
        color = "#222222"
      ),
      axis.title = ggplot2::element_text(
        size = 12,
        color = "#747577"
      ),
      axis.text = ggplot2::element_text(
        size = 12,
        color = "#747577"
      ),
      axis.ticks = ggplot2::element_line(color = "#747577"),
      axis.line = ggplot2::element_line(color = "#747577"),
      strip.text = ggplot2::element_text(size = 12, hjust = 0),
      panel.background = ggplot2::element_rect(fill = "white", color = NA),
      plot.margin = ggplot2::margin(0.5, 0.5, 0.5, 0.5, "cm")
    )
}
