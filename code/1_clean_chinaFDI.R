rm(list = ls())
source("_functions.R")
packs <- c("haven", "plyr", "dplyr")
f_install_and_load(packs)

d_raw <- read_dta("../data_raw/China-2012-full ES N2700 data999.dta")

d_FIE <- d_raw %>% filter(b2b >= 25)


f_replace_dontknow_with_NA <- function(x) {
  replace(x, which(x == attr(x, "labels")["Don't know"]), NA)
}


table(d_FIE$a4b)

tmp <- d_FIE %>%
  filter(a17 != attr(a17, "labels")["Are arbitrary and unreliable numbers"]) %>%
  select(b6, n6a, n6b, n7a, n7b) %>%
  mutate_each(funs(new = f_replace_dontknow_with_NA),
              b6, n6a, n6b, n7a, n7b)

d_FIE %>% select(n7a, n7b) %>%
  mutate_each(funs(blah = min))


  summarise_each(funs(percentile25 = quantile(., probs = c(0.25), na.rm=T),
                      percentile50 = quantile(., probs = c(0.5), na.rm=T),
                      percentile75 = quantile(., probs = c(0.75), na.rm=T)),
                 n7a, n7b)

d_whollyFIE <- d_raw %>% filter(b2b == 100)

N7a current cost of machinery, vehicles and equipments
N7b current cost of land and building

