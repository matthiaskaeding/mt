library(here, include.only = "here")
library(targets)
library(tarchetypes)
library(data.table)
library(ggplot2)
library(purrr)

files <- list.files(here("R"), pattern = "\\.R$", full.names = TRUE)
lapply(files[!startsWith(files, ".")], source)

c(
  ### Write targets here
)
