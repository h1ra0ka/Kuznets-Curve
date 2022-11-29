main <- function(){
  read_data <- function(){
    inequality <- readr::read_rds(here::here("03_build", "inequality_ready", "output", "inequality_ready.rds"))
    gdp <- readr::read_rds(here::here("03_build", "gdp_ready", "output", "gdp_ready.rds"))
  }
}