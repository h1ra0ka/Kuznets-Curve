main <- function(){
  read_master()
  summarize(master)
  make_table(both_summary, JPN_summary, USA_summary)
  make_image(table)
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
  
  JPN_numbers <- strsplit(JPN_summary, ":")
  JPN_min <- JPN_numbers[[1]]
  JPN_1Q <- JPN_numbers[[2]]
  JPN_median <- JPN_numbers[[3]]
  JPN_mean <- JPN_numbers[[4]]
  JPN_3Q <- JPN_numbers[[5]]
  JPN_max <- JPN_numbers[[6]]
  
  JPN_numbers2 <- c(JPN_min[[2]], JPN_1Q[[2]], JPN_median[[2]], JPN_mean[[2]], JPN_3Q[[2]], JPN_max[[2]])
  
  USA_numbers <- strsplit(USA_summary, ":")
  USA_min <- USA_numbers[[1]]
  USA_1Q <- USA_numbers[[2]]
  USA_median <- USA_numbers[[3]]
  USA_mean <- USA_numbers[[4]]
  USA_3Q <- USA_numbers[[5]]
  USA_max <- USA_numbers[[6]]
  
  USA_numbers2 <- c(USA_min[[2]], USA_1Q[[2]], USA_median[[2]], USA_mean[[2]], USA_3Q[[2]], USA_max[[2]])
  
  table <- as.data.frame(t(data.frame(both_numbers2, JPN_numbers2, USA_numbers2)))
  colnames(table) <- c("min", "1Q", "median", "mean", "3Q", "max")
  rownames(table) <- c("Both", "JPN", "USA")
  
  return(table)
}

make_image <- function(table){
  #表の出力で悩んでいる　kableの利用がうまくいかない　bothの欄は不要か
}

main()