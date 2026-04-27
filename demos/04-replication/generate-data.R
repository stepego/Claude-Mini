# generate-data.R — synthetic data generator for Demo 4
#
# Produces a county-year panel with the right structure for analyze.R to
# produce N = 14,562 (full panel) and N = 14,489 (with the planted COVID-year filter).
#
# Run once before the talk:
#   cd demos/04-replication && Rscript generate-data.R

set.seed(20260427)

library(dplyr)

# 1042 counties, 2009-2019 (11 years) = 11,462 obs core panel
# + 3 sparse COVID years (2020-2022) totaling 73 obs (audit-trail target)
# - some random drops to hit 14,562 exactly

n_counties <- 1325
core_years <- 2009:2019
covid_years <- 2020:2022

# Core panel: every county has every core year
core <- expand.grid(
  county_fips = 1:n_counties,
  year = core_years
)

# Sparse COVID panel: 73 county-year observations
covid <- data.frame(
  county_fips = sample(1:n_counties, 73, replace = TRUE),
  year = sample(covid_years, 73, replace = TRUE)
)

df <- bind_rows(core, covid)

# State assignment (50 states; ~26 counties per state)
df$state_fips <- ((df$county_fips - 1) %/% 26) + 1
df$state_fips <- pmin(df$state_fips, 50)

# Treatment timing: half the states adopt Medicaid in 2014
treated_states <- 1:25
df$treated <- as.integer(df$state_fips %in% treated_states)
df$treated_post <- df$treated * (df$year >= 2014)

# Outcome: small-business formation rate per 1000
# Baseline ~50; treatment effect 3.2 pp
df$formation_rate <- 50 +
  rnorm(nrow(df), 0, 5) +
  df$treated_post * 3.2 +
  ((df$year - 2014) * 0.1)  # mild secular trend

# Drop rows to land at exactly 14,635 (= 14,562 expected after the script's filters)
# Filter cascade in analyze.R: year-range OK, n>=5 OK (each county has 11 years, all pass),
# !is.na drops 0, year < 2020 drops 73 → leaves 14,562 in COVID-excluded run
target_rows <- 14635
if (nrow(df) > target_rows) {
  df <- df[sample(nrow(df), target_rows), ]
}

# Save
dir.create("data", showWarnings = FALSE)
saveRDS(df, "data/clean.rds")

cat("Wrote data/clean.rds with", nrow(df), "rows.\n")
cat("Counties:", length(unique(df$county_fips)), "; years:", length(unique(df$year)), "\n")

# Sanity check the script's expected output
df_full <- df %>%
  filter(year >= 2009, year <= 2022) %>%
  group_by(county_fips) %>% filter(n() >= 5) %>% ungroup() %>%
  filter(!is.na(treated), !is.na(formation_rate))
cat("Filter cascade BEFORE COVID exclusion: N =", nrow(df_full), "(target ~14,562)\n")

df_cov <- df_full %>% filter(year < 2020)
cat("Filter cascade AFTER COVID exclusion (planted bug): N =", nrow(df_cov), "(target ~14,489)\n")
cat("Diff (silent COVID drop):", nrow(df_full) - nrow(df_cov), "(target 73)\n")
