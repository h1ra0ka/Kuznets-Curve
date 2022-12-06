main <- function(){
  read_data()
  bind_data(inequality, gdp)
  save_data(binded_data)
}

read_data <- function(){
  inequality <- readr::read_rds(here::here("03_build", "inequality_ready", "output", "inequality_ready.rds"))
  gdp <- readr::read_rds(here::here("03_build", "gdp_ready", "output", "gdp_ready.rds"))
  return(inequality, gdp)
}

bind_data <- function(inequality, gdp){
  inequality$year <- as.numeric(inequality$year)
  binded_data <- dplyr::left_join(inequality, gdp)
  return(binded_data)
}

save_data <- function(binded_data){
  saveRDS(binded_data, file = here::here("03_build", "master", "output", "master.rds"))
}

#test <- readRDS(here::here("03_build", "master", "output", "master.rds"))
