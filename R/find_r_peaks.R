#' find_r_peaks
#'
#' Find R peaks from a ECG sample, strongly recommended to use data obtained from ecg_filter(),
#' can be checked with plot_r_peaks()
#'
#' @param sample numeric ecg register
#' @param sample_rate acquisition rate in Hz
#' @param threshold set minimum peak value, can be adjusted to avoid T-waves identification
#'
#' @return Numeric vector with peak indexes
#' @export
#'
#' @examples
#' data <- ECGexample1
#' data$filtered <- ecg_filter(data$raw_signal,sample_rate = 500, butter_low = 5, butter_high = 80)
#' peaks <- find_r_peaks(data$filtered, FCmax = 220, sample_rate = 500, threshold = .2)
#'
find_r_peaks <- function(sample, FCmax = 220, sample_rate = 500, threshold = .2){
  set <- 1/(FCmax/60)
  minpeakdistance_set <- set/(1/sample_rate)
  peaks <- data.frame(pracma::findpeaks(as.vector(sample), minpeakdistance = minpeakdistance_set, minpeakheight = threshold))
  return(peaks$X2)
}



