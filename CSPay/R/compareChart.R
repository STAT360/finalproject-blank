library(forcats)
library(ggplot2)


#' Title
#'
#' @param school
#' @param whichPay
#'
#' @return
#' @export
#'
#' @examples
compareChart <- function(school='University of St Thomas (Minnesota)',whichPay="low_pay"){
  if(length(which(pay_by_school$School_Name==school))==0){
    stop("Error: School is not found")
  }
  if(identical(whichPay,"low_pay")==FALSE&&identical(whichPay,"high_pay")==FALSE){
    stop("Error: pay category is not found")
  }
  # if(whichPay=="low_pay"){
  #
  # }

  schoolPosition <- pay_by_school %>%
    arrange(desc(!! sym(whichPay)))

  lowvalue <- which(schoolPosition$School_Name == school)-5
  highvalue <- which(schoolPosition$School_Name == school)+5
  includetop <- 1
  includebottom <- dim(pay_by_school)[1]

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
    coord_flip()


}

