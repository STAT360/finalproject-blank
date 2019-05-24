library(forcats)
library(ggplot2)


#' compareChart
#'
#' This function is used to generate a bar chart of the indicated salary type (low or high) of schools that are closest to it as well as the school with the highest and lwoest average salay
#' @param school The school you would like to compare to others
#' @param whichPay either "low_pay" or "high_pay"
#' @param df The dataframe of pay amount by different universities
#'
#' @return NULL #Displays graph
#' @export
#'
#' @examples: compareChart(df = computerSciencePay,"Stanford University","low_pay")
compareChart <- function(df, school='University of St Thomas (Minnesota)',whichPay="low_pay"){
  if(length(which(df$School_Name==school))==0){
    stop("Error: School is not found")
  }
  if(identical(whichPay,"low_pay")==FALSE&&identical(whichPay,"high_pay")==FALSE){
    stop("Error: pay category is not found")
  }
  # if(whichPay=="low_pay"){
  #
  # }

  schoolPosition <- df %>%
    arrange(desc(!! sym(whichPay)))

  lowvalue <- which(schoolPosition$School_Name == school)-5
  highvalue <- which(schoolPosition$School_Name == school)+5
  includetop <- 1
  includebottom <- dim(df)[1]

  if(lowvalue<0){
    lowvalue <- 1
    includetop <- NA
  }
  if(highvalue>includebottom){
    includebottom <- NA
  }

  schoolPosition <- schoolPosition %>%
    slice(includetop, lowvalue:highvalue, includebottom)
  schoolPosition <- schoolPosition %>%
    mutate(colhighlight = if_else(School_Name == school, TRUE, FALSE))
  schoolPosition <- schoolPosition %>%
    mutate(School_Name = fct_reorder(School_Name, !! sym(whichPay)))

  ggplot(schoolPosition, aes(x=School_Name, y=!! sym(whichPay), label =!! sym(whichPay), fill=colhighlight)) +
    geom_col() +
    geom_text(hjust=1.5, position = position_dodge(0.9))+
    theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
    coord_flip() + scale_fill_discrete(guide = FALSE)

}

