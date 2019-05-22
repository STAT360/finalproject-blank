#' Title: GetPayFunction
#'
#' @param url
#' @return
#'
#' @examples
getData <- function(url="https://www.payscale.com/college-salary-report/best-schools-by-majors/computer-science/", numberOfPages=30){
  library(stringr)
  library(readr)
  library(rvest)
  library(dplyr)
  library(purrr)
  library(beepr)
  beep()

  url_base <- url

  map_df(1:numberOfPages, function(i) {

    cat(".")

    pg <- read_html(paste0(url_base, i))
    tibble(pay_low=html_text(html_nodes(pg, ".text-center")))

  }) -> income

  beepwhat()

  map_df(1:numberOfPages, function(i) {

    cat(".")

    pg <- read_html(paste0(url_base, i))

    tibble(School_Name=html_text(html_nodes(pg, ".datatable-logo")))

  }) -> pay_by_school

  ##################------- PART 2-------#########################
  money<-income %>%mutate(as.character(pay_low)) %>%  filter(str_detect(pay_low, "\\$")) %>% mutate(pay_low=parse_number(pay_low)) %>% pull(pay_low)

  name <- pay_by_school$School_Name

  low_pay <- c()


  ##################------- PART 3-------#########################
  answer=c()
  answer2=c()
  for (i in 1:length(money)){
    if ((Mod(i)%%2) == 1) {
      answer[ceiling(i/2)]<-money[i]
    }
    else{
      answer2[i/2]<-money[i]
    }
  }
  pay_by_school$low_pay=answer
  pay_by_school$high_pay=answer2

}
