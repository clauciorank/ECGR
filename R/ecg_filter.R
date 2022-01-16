#' ecg_filter
#'
#' Filter ECG noise and establish a baseline with butterfilter
#'
#' @param sample numeric ecg register
#' @param sample_rate acquisition rate in Hz
#' @param butter_low low-pass butterfilter param Hz
#' @param butter_high high-pass butterfilter param Hz
#'
#' @return Numeric vector with filtered data
#' @export
#'
#' @examples
#' data <- ECGexample1
#' data$filtered <- ecg_filter(data$raw_signal,sample_rate = 500, butter_low = 5, butter_high = 80)
#'
ecg_filter <- function(sample, sample_rate = 500, butter_low = 5, butter_high = 80){
  y <- sample
  butterf <- signal::butter(1, c(butter_low/sample_rate, butter_high/sample_rate))
  with_filter <- signal::filter(butterf, y)
  return(with_filter)
}
