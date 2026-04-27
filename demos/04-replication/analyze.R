# analyze.R — main analysis script for the working paper
# Loads cleaned panel data, applies sample restrictions, runs the main DiD regression.
#
# IMPORTANT: this is a TEACHING DEMO. The script intentionally contains
# a discrepancy with the manuscript (see ../expected-discrepancies.md).

set.seed(20260427)

library(dplyr)
library(fixest)
library(readr)

# Load cleaned data (county-year panel, BFS small-business formation rates)
df <- read_rds("data/clean.rds")

# Sample construction
df_analysis <- df %>%
  filter(year >= 2009, year <= 2022) %>%                       # date range
  group_by(county_fips) %>%
  filter(n() >= 5) %>%                                          # >= 5 years of data
  ungroup() %>%
  filter(!is.na(treated), !is.na(formation_rate)) %>%           # complete cases
  filter(year < 2020)                                           # PLANTED BUG: COVID-era exclusion not mentioned in the manuscript

# Main DiD regression: small-business formation rate on treated x post, with county + year FE
model <- feols(
  formation_rate ~ treated_post | county_fips + year,
  data = df_analysis,
  cluster = "state_fips"
)

# Print results
cat("=== Main regression (Table 2, col 3) ===\n")
print(summary(model))
cat("\nN =", nobs(model), "\n")
cat("R² =", round(r2(model)["r2"], 3), "\n")

# Pre-trends sensitivity check (Roth 2022, Rambachan-Roth 2023)
# Pretend this prints the Honest-DiD bound — adjust placeholder for demo realism.
cat("\nFirst-stage F-stat (placebo IV in robustness) = 32.1\n")
