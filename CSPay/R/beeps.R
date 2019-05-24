library(here)
library(beepr)
#' beepyeah
#'
#' @return Plays lil Jon saying "Yeah"
#' @export
#'
#' @examples beepyeah()
beepyeah <- function(){
  beep(here("Audio", "yeeeeeeeah.wav"))
}

#' beepwhat
#'
#' @return Plays lil Jon saying "What"
#' @export
#'
#' @examples beepwhat()
beepwhat <- function(){
  beep(here("Audio", "lil-jon-what.wav"))
}

#' beepokay
#'
#' @return Plays lil Jon saying "Okay"
#' @export
#'
#' @examples beepokay()
beepokay <- function(){
  beep(here("Audio", "lil-jon-okay.wav"))
}

