library(here)
library(beepr)
#' Title
#'
#' @return
#' @export
#'
#' @examples beepyeah()
beepyeah <- function(){
  beep(here("Audio", "yeeeeeeeah.wav"))
}

#' Title
#'
#' @return
#' @export
#'
#' @examples beepwhat()
beepwhat <- function(){
  beep(here("Audio", "lil-jon-what.wav"))
}

#' Title
#'
#' @return
#' @export
#'
#' @examples beepokay()
beepokay <- function(){
  beep(here("Audio", "lil-jon-okay.wav"))
}

