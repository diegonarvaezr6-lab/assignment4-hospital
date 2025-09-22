
R version 4.5.1 (2025-06-13) -- "Great Square Root"
Copyright (C) 2025 The R Foundation for Statistical Computing
Platform: aarch64-apple-darwin20

R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under certain conditions.
Type 'license()' or 'licence()' for distribution details.

  Natural language support but running in an English locale

R is a collaborative project with many contributors.
Type 'contributors()' for more information and
'citation()' on how to cite R or R packages in publications.

Type 'demo()' for some demos, 'help()' for on-line help, or
'help.start()' for an HTML browser interface to help.
Type 'q()' to quit R.

[R.app GUI 1.82 (8536) aarch64-apple-darwin20]

[Workspace restored from /Users/diegonarvaez/.RData]
[History restored from /Users/diegonarvaez/.Rapp.history]

> # Define the vectors
> Frequency     <- c(0.6, 0.3, 0.4, 0.4, 0.2, 0.6, 0.3, 0.4, 0.9, 0.2)
> BloodPressure <- c(103, 87, 32, 42, 59, 109, 78, 205, 135, 176)
> FirstAssess   <- c(1, 1, 1, 1, 0, 0, 0, 0, NA, 1)   # bad=1, good=0
> SecondAssess  <- c(0, 0, 1, 1, 0, 0, 1, 1, 1, 1)    # low=0, high=1
> FinalDecision <- c(0, 1, 0, 1, 0, 1, 0, 1, 1, 1)    # low=0, high=1
> 
> # Build the dataframe
> df_hosp <- data.frame(
+   Frequency, BloodPressure, FirstAssess,
+   SecondAssess, FinalDecision,
+   stringsAsFactors = FALSE
+ )
> 
> # Inspect data
> summary(df_hosp)
   Frequency    BloodPressure     FirstAssess      SecondAssess FinalDecision
 Min.   :0.20   Min.   : 32.00   Min.   :0.0000   Min.   :0.0   Min.   :0.0  
 1st Qu.:0.30   1st Qu.: 63.75   1st Qu.:0.0000   1st Qu.:0.0   1st Qu.:0.0  
 Median :0.40   Median : 95.00   Median :1.0000   Median :1.0   Median :1.0  
 Mean   :0.43   Mean   :102.60   Mean   :0.5556   Mean   :0.6   Mean   :0.6  
 3rd Qu.:0.55   3rd Qu.:128.50   3rd Qu.:1.0000   3rd Qu.:1.0   3rd Qu.:1.0  
 Max.   :0.90   Max.   :205.00   Max.   :1.0000   Max.   :1.0   Max.   :1.0  
                                 NA's   :1                                   
> 
> # Handle missing values (drop row with NA)
> df_hosp <- na.omit(df_hosp)
> 
> # First Assessment
> boxplot(
+   BloodPressure ~ FirstAssess,
+   data = df_hosp,
+   names = c("Good","Bad"),
+   ylab = "Blood Pressure",
+   main = "BP by First MD Assessment"
+ )
> 
> # Second Assessment
> boxplot(
+   BloodPressure ~ SecondAssess,
+   data = df_hosp,
+   names = c("Low","High"),
+   ylab = "Blood Pressure",
+   main = "BP by Second MD Assessment"
+ )
> 
> # Final Decision
> boxplot(
+   BloodPressure ~ FinalDecision,
+   data = df_hosp,
+   names = c("Low","High"),
+   ylab = "Blood Pressure",
+   main = "BP by Final Decision"
+ )
> 
> png("Barplot-1.png")
> boxplot(BloodPressure ~ FinalDecision, data=df_hosp,
+         names=c("Low","High"), ylab="Blood Pressure",
+         main="BP by Final Decision")
> dev.off()
null device 
          1 
> 
> hist(
+   df_hosp$Frequency,
+   breaks = seq(0, 1, by = 0.1),
+   xlab = "Visit Frequency",
+   main = "Histogram of Visit Frequency"
+ )
> 
> hist(
+   df_hosp$BloodPressure,
+   breaks = 8,
+   xlab = "Blood Pressure",
+   main = "Histogram of Blood Pressure"
+ )
> 
> png("histogram-1.png")
> hist(df_hosp$BloodPressure, breaks=8,
+      xlab="Blood Pressure",
+      main="Histogram of Blood Pressure")
> dev.off()
null device 
          1 
> 
> 