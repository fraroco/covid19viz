#' @title jhu sitrep data management and visualization
#'
#' @description clean and plot jhu sitrep
#'
#' @describeIn jhu_sitrep_import import data from github
#'
#' @param source string of source to use: "confirmed","deaths" or "recovered"
#'
#' @import readr
#' @import dplyr
#' @import tidyr
#'
#' @return import and cleaned jhu dataset
#'
#' @export jhu_sitrep_import
#' @export jhu_sitrep_cleandb
#'
#' @examples
#'
#' library(covid19viz)
#' library(tidyverse)
#'
#' jhu_sitrep <- jhu_sitrep_import(source = "confirmed")
#'
#' jhu_sitrep %>%
#'   jhu_sitrep_cleandb() %>%
#'   filter(country_region=="Peru") %>%
#'   arrange(desc(dates))
#'

jhu_sitrep_import <- function(source) {
  if (source=="confirmed") {
    path_start <- "https://raw.github.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_19-covid-Confirmed.csv"
    jhu_sitrep <- read_csv(file = path_start) %>%
      mutate(source=source) %>%
      select(source,everything())
  }

  if (source=="deaths") {
    path_start <- "https://raw.github.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_19-covid-Deaths.csv"
    jhu_sitrep <- read_csv(file = path_start) %>%
      mutate(source=source) %>%
      select(source,everything())
  }

  if (source=="recovered") {
    path_start <- "https://raw.github.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_19-covid-Recovered.csv"
    jhu_sitrep <- read_csv(file = path_start) %>%
      mutate(source=source) %>%
      select(source,everything())
  }
  jhu_sitrep
}

#' @describeIn jhu_sitrep_import clean jhu dataset
#' @inheritParams jhu_sitrep_import
#' @param data input of raw jhu dataset

jhu_sitrep_cleandb <- function(data) {
  data %>%
    pivot_longer(cols = -c(source,`Province/State`,`Country/Region`,Lat,Long),
                 names_to = "dates",values_to = "value") %>%
    janitor::clean_names() %>%
    mutate(dates=lubridate::mdy(dates)) %>%
    select(source,country_region,province_state,everything())
}
