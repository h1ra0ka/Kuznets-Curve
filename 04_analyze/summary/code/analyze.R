main <- function(){
  read_master()
  summarize(master)
  make_table(JPN_summary, USA_summary)
}

read_master <- function(){
  master <- readRDS(here::here("03_build", "master", "output", "master.rds"))
  return(master)
}

summarize <- function(master){
  JPN_summary <- dplyr::filter(master, country == "JPN") %>%
    dplyr::select(-country, -year) %>%
      summary()
  
  return(JPN_summary, USA_summary)
}

make_table <- function(JPN_summary, USA_summary){
  kableExtra::kbl(JPN_summary)
}
