main <- function(){
  read_master()
  summarize(master)
  make_table(both_summary, JPN_summary, USA_summary)
}

read_master <- function(){
  master <- readRDS(here::here("03_build", "master", "output", "master.rds"))
  return(master)
}

summarize <- function(master){
  both_summary <- dplyr::select(master, gini) %>%
    summary() %>%
    as.vector()
  JPN_summary <- dplyr::filter(master, country == "JPN") %>%
    dplyr::select(gini) %>%
      summary()
  USA_summary <- dplyr::filter(master, country == "USA") %>%
    dplyr::select(gini) %>%
    summary()
    
  return(both_summary, JPN_summary, USA_summary)
}

make_table <- function(both_summary, JPN_summary, USA_summary){
  both_numbers <- strsplit(both_summary, ":")
  both_min <- both_numbers[[1]]
  both_1Q <- both_numbers[[2]]
  both_median <- both_numbers[[3]]
  both_mean <- both_numbers[[4]]
  both_3Q <- both_numbers[[5]]
  both_max <- both_numbers[[6]]
  
  both_numbers2 <- c(both_min[[2]],both_1Q[[2]], both_median[[2]], both_mean[[2]], both_3Q[[2]], both_max[[2]])
  
}