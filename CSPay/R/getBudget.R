
#' getBudget
#'
#' This function gives a tibble that contains variables of different spending catagories and values based on a budget suggested by thebalance.com https://www.thebalance.com/how-to-figure-out-budget-percentages-for-money-goals-4171689
#' @param df The dataframe of pay amount by different universities
#' @param school The school of the average graduate you would like to generate a budget for
#' @param low_pay True if the generator should use low_pay false if high_pay
#'
#' @return A tibble of the budget
#' @export
#'
#' @examples getBudget(df = computerSciencePay, school = "University of St Thomas (Minnesota)", low_pay = FALSE)
getBudget <- function(df, school = 'University of St Thomas (Minnesota)', low_pay = TRUE){
  library(dplyr)
  if(length(which(df$School_Name==school))==0){
    stop("Error: School is not found")
  }

  if(low_pay){
    print("Generating reccomended budget for low_pay salary")
    budget <- df %>% filter(df$School_Name==school) %>% mutate(Housing = low_pay * .3) %>%
      mutate(Insurance = low_pay * .15) %>%
      mutate(Food = low_pay * .1) %>%
      mutate(Transportation = low_pay * .1) %>%
      mutate(Utilities = low_pay*.05) %>%
      mutate(Savings = low_pay*.15) %>%
      mutate(Fun = low_pay*.05) %>%
      mutate(Clothing = low_pay*.05) %>%
      mutate(Personal = low_pay*.05)
    return(budget)

      }

  if(!low_pay){
    print("Generating reccomended budget for high_pay salary")
    budget <- df %>% filter(df$School_Name==school) %>% mutate(Housing = high_pay * .3) %>%
      mutate(Insurance = high_pay * .15) %>%
      mutate(Food = high_pay * .1) %>%
      mutate(Transportation = high_pay * .1) %>%
      mutate(Utilities = high_pay*.05) %>%
      mutate(Savings = high_pay*.15) %>%
      mutate(Fun = high_pay*.05) %>%
      mutate(Clothing = high_pay*.05) %>%
      mutate(Personal = high_pay*.05)
    return(budget)

  }

}
