# install oiplot
devtools::document()
devtools::install_local(force = T)

library(tidyverse)

# run examples from readme
readr::read_file("README.md") %>%
  knitr::purl(text = .)  %>%
  parse(text = .) %>%
  eval()
