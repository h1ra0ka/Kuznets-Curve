main <- function(){
  get_gini_ready()
  make_figures(JPN, USA)
}

get_gini_ready <- function(){
  master <- readRDS(here::here("03_build", "master", "output", "master.rds"))
  JPN <- dplyr::filter(master, country == "JPN") %>%
    dplyr::select(year, gini)
  USA <- dplyr::filter(master, country == "USA") %>%
    dplyr::select(year, gini)
  return(JPN, USA)
}

make_figures <- function(JPN, USA){
  #ggplot2でaesが見つからないエラー　plotの使用も視野
  ggplot2::ggplot(data = JPN, mapping = aes(x=year, y=gini)) + geom_line()
  }