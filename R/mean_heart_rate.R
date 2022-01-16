#' mean_heart_rate
#'
#' Identify the mean heart rate from an ECG sample
#'
#' @param sample numeric ecg register
#' @param Rpeaks numeric vector with R peak indexes (can be obtained from find_r_peaks())
#' @param sample_rate acquisition rate in Hz
#'
#' @return Float with the mean heart rate from the sample
#' @export
#'
#' @examples
#' data <- ECGexample1
#' data$filtered <- ecg_filter(data$raw_signal,sample_rate = 500, butter_low = 5, butter_high = 80)
#' peaks <- find_r_peaks(data$filtered, FCmax = 220, sample_rate = 500, threshold = .2)
#' mean_heart_rate(data$filtered, peaks)
#'
mean_heart_rate <- function(sample, Rpeaks, sample_rate=500){
  t <- seq(0,length(sample)/sample_rate, by = 1/sample_rate)[seq_len(length(sample))]
  df <- data.frame(index = seq_len(length(sample)), sample, t)
  df <- df[df$index %in% Rpeaks,]
  return(1/mean(diff(df$t))*60)
}
