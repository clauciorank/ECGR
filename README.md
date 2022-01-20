# ECGR

## Overview

ECGR is a package to process and analyze Electrocardiogram (ECG) with the R language. 
This package (up to now) provides a simple way for filter signal and identify/visualize 
R peaks, calculate heart rate and some parameters from the time domain of Heart Rate Variability (HRV).

## Instalation 

```devtools::install_github('clauciorank/ECGR')```

## Usage

#### Here I'll a propose a step by step method that should be enough for R peak identification in a raw signal ECG obtained from [PhysioNet ECG-ID Database](https://physionet.org/content/ecgiddb/1.0.0/). The package comes with 2 examples pre-loaded: **ECGexample1** and **ECGexample2**.  





1.Load data - The package proposal is simplify the cardiac electric signal processing with R
so we will use some of the simplest data structures in R. (Yay!!).

``` data <- ECGR::ECGexample1 ```

2. Visualize ECG.

```plot(data$raw_signal, type = 'l')```


![plot](https://github.com/clauciorank/ECGR/blob/main/misc/image_raw.jpg?raw=true)


3.Signal filtering with butterfilter (optional but strongly recommended).


```data$filtered <- ECGR::ecg_filter(data$raw_signal, sample_rate = 500, butter_low = 5, butter_high = 80)```


Plot to see the the difference!


```plot(data$filtered, type = 'l')```


![plot2](https://github.com/clauciorank/ECGR/blob/main/misc/image_filtered.jpg?raw=true)


4.R peak indexes identification (threshold (y) should be adjusted to a number that include the R peaks).


``` peaks <- ECGR::find_r_peaks(data$filtered, sample_rate = 500, FCmax = 220, threshold = .2)```


5.Visualize the identified R peaks


``` plot_r_peaks(data$filtered, peaks)```


![plot3](https://github.com/clauciorank/ECGR/blob/main/misc/Rpeaks.jpg?raw=true)


6.Mean Heart rate


```ECGR::mean_heart_rate(sample = data$filtered, Rpeaks = peaks)```


```[1] 72.83859```


7.HRV parameters


```ECGR::hrv_time_analysis(data$filtered, peaks)```



