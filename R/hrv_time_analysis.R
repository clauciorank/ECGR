#' hrv_time_analysis
#'
#' Heart Rate Variability (HRV) time domain analysis from the sample (SDNN, pnn50, rMSSD, ...)
#'
#' @param sample numeric ecg register
#' @param Rpeaks numeric vector with R peak indexes (can be obtained from find_r_peaks())
#' @param sample_rate acquisition rate in Hz
#'
#' @return List with the quantified parameters for the analysis, could have missing information if the sample is small
#' @export
#'
#' @examples
#' data <- ECGexample1
#' data$filtered <- ecg_filter(data$raw_signal,sample_rate = 500, butter_low = 5, butter_high = 80)
#' peaks <- find_r_peaks(data$filtered, FCmax = 220, sample_rate = 500, threshold = .2)
#' hrv_time_analysis(data$filtered, peaks)
#'
hrv_time_analysis <- function(sample, Rpeaks, sample_rate=500){
  t <- seq(0,length(sample)/sample_rate, by = 1/sample_rate)[seq_len(length(sample))]
  df <- data.frame(index = seq_len(length(sample)), sample, t)
  df <- df[df$index %in% Rpeaks,]
  interval = df$t

  HRV <- RHRV::CreateHRVData() |>
    RHRV::LoadBeatVector(interval) |>
    RHRV::BuildNIHR() |>
    RHRV::CreateTimeAnalysis(size = max(t))

  return(HRV$TimeAnalysis[[1]])
}
