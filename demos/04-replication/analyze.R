# analyze.R — main analysis script for the working paper
# Loads cleaned panel data, applies sample restrictions, runs the main regression.
#
# IMPORTANT: this is a TEACHING DEMO. The script intentionally contains
# a discrepancy with the manuscript (see ../expected-discrepancies.md).

set.seed(20260427)

library(dplyr)
library(fixest)
library(readr)

# Load cleaned data
df <- read_rds("data/clean.rds")

# Sample construction
df_analysis <- df %>%
  filter(year >= 2010, year <= 2022) %>%                      # date range
  group_by(firm_id) %>%
  filter(n() >= 3) %>%                                         # >= 3 consecutive years
  ungroup() %>%
  filter(!is.na(treatment), !is.na(outcome)) %>%               # complete cases
  filter(industry != "financial")                              # PLANTED BUG: this exclusion is not mentioned in the manuscript

# Main regression: outcome on treatment with firm + year FE
model <- feols(
  outcome ~ treatment | firm_id + year,
  data = df_analysis,
  cluster = "firm_id"
)

# Print results
cat("=== Main regression (Table 2, col 3) ===\n")
print(summary(model))
cat("\nN =", nobs(model), "\n")
cat("R² =", round(r2(model)["r2"], 3), "\n")

# First stage (separately estimated for IV specification not shown here)
# Pretend this prints F = 32.1 — adjust placeholder for demo realism.
cat("\nFirst-stage F-stat = 32.1\n")
