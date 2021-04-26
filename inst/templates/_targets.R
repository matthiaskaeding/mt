library(here, include.only = "here")
library(targets)
library(tarchetypes)
library(data.table)
library(ggplot2)
library(purrr)

lapply(
  list.files(
    here("R"), pattern = "\\.R$", full.names = TRUE, all.files = FALSE
  ),
  source
)

c(
  ### Write targets here
)
