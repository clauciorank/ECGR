#' plot_r_peaks
#'
#' Simple plot for visual identification of the R peaks that can be obtained from find_r_peaks()
#' Helpfull for visualization and parameters settings for the functions ecg_filter() and find_r_peaks()
#'
#' @param sample numeric ecg register
#' @param Rpeaks numeric vector with R peak indexes (can be obtained from find_r_peaks())
#'
#' @return Plot from the sample with R peak identification
#' @export
#'
#' @examples
#' data <- ECGexample1
#' data$filtered <- ecg_filter(data$raw_signal,sample_rate = 500, butter_low = 5, butter_high = 80)
#' peaks <- find_r_peaks(data$filtered, FCmax = 220, sample_rate = 500, threshold = .2)
#' plot_r_peaks(data$filtered, peaks)
#'
plot_r_peaks <- function(sample, Rpeaks){
  plot(sample, type = 'l')
  abline(v = Rpeaks, col='red', lty=2)
}
