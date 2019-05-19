#' Title: GetPayFunction
#'
#' @param url
#' @return
#'
#' @examples
getData <- function(url="https://www.payscale.com/college-salary-report/best-schools-by-majors/computer-science"){
  library(stringr)
  library(readr)
  library(rvest)
  library(dplyr)
  library(purrr)
  library(beepr)
  beep()

  url_base <- url

  map_df(1:30, function(i) {

    cat(".")

    pg <- read_html(sprintf(url_base, i))

    data.frame(pay_low=html_text(html_nodes(pg, ".text-center")))

  }) -> income

  map_df(1:30, function(i) {

    cat(".")

    pg <- read_html(sprintf(url_base, i))

    data.frame(School_Name=html_text(html_nodes(pg, ".datatable-logo")))

  }) -> by_school

  beep()
  ##################------- PART 2-------#########################
  money<-income %>% filter(str_detect(pay_low, "\\$")) %>% mutate(pay_low=parse_number(as.character(pay_low))) %>% pull(pay_low)

  name <- by_school$School_Name

  low_pay <- c()

  beep()
  ##################------- PART 3-------#########################
  answer=c()
  answer2=c()
  for (i in 1:length(money)){
    if ((Mod(i)%%2) == 1) {
      answer[ceiling(i/2)]<-money[i]
      #append(low_pay, income$pay_low[i])
      #income$pay_low[i]
    }
    else{
      answer2[i/2]<-money[i]
    }
  }
  by_school$low_pay=answer
  by_school$high_pay=answer2

  beep("/CSpay/Audio/yeeeeeeeah.wav") #needs to work on a relative path level


}
