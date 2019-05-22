library(forcats)
library(ggplot2)

#' Title: GetPayFunction
#'
#' @param school Name
#' @return
#'
#' @examples: getGraph(University of St Thomas (Minnesota))

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

  ggplot(schoolPosition) + geom_col(aes(x=School_Name, y=!! sym(whichPay), fill=colhighlight)) +  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +coord_flip()

}

