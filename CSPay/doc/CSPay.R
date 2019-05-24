## ---- include = FALSE----------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup---------------------------------------------------------------
library(CSPay)

## ------------------------------------------------------------------------
computerSciencePay <- getData()
head(computerSciencePay)

## ---- fig.width=5--------------------------------------------------------
compareChart(df = computerSciencePay, school = "Stanford University")

## ---- fig.width=5--------------------------------------------------------
compareChart(computerSciencePay)

## ---- fig.width=5--------------------------------------------------------
compareChart(df = computerSciencePay, school = "Ferrum College")

## ------------------------------------------------------------------------
low_budget <- getBudget(computerSciencePay) 
low_budget

## ------------------------------------------------------------------------
high_budget <- getBudget(computerSciencePay, low_pay = FALSE) 
high_budget

## ------------------------------------------------------------------------
beepyeah()
beepwhat()
beepokay()

