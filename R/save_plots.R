#' @export
save_plots <- function(plots, path, size = c(8, 5)) {
  pdf(path, width = size[1], height = size[2])
  print(plots)
  dev.off()
}
