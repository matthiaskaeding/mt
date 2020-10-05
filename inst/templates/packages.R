options(conflicts.policy = list(error = TRUE, warn = FALSE))

library(dplyr, include = c("select", "filter",
                           "slice", "mutate", "summarize"))
library(drake)
library(here)
library(purrr, exclude = c("transpose"))
library(stringi)
library(matthiastools)
suppressPackageStartupMessages(
  library(data.table, mask.ok = c("between", "first", "last"))
  )


