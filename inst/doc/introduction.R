## ----step2--------------------------------------------------------------------
Phi <- matrix(c(.4, .1, .2, .3), ncol = 2, byrow = T)
# The .2 refers to our standardized cross-lagged effect of interest
within_cor <- 0.3
ICC <- 0.5
RI_cor <- 0.3

## ----setup, message=FALSE-----------------------------------------------------
library(powRICLPM)

## ----step2-check--------------------------------------------------------------
# Check `Phi` argument
check_Phi(Phi)

## ----analysis, eval = F-------------------------------------------------------
#  # Set number of replications
#  n_reps <- 100
#  
#  output <- powRICLPM(
#    target_power = 0.8,
#    search_lower = 500,
#    search_upper = 1000,
#    search_step = 50,
#    time_points = c(3, 4),
#    ICC = ICC,
#    RI_cor = RI_cor,
#    Phi = Phi,
#    within_cor = 0.3,
#    reps = n_reps
#  )

## ----furrr-setup, eval = F----------------------------------------------------
#  # Load `future` and `progressr` packages
#  library(future)
#  library(progressr)
#  
#  # Check how many cores are available
#  future::availableCores()
#  
#  # Plan powRICLPM analysis to run on 1 core less than number of available cores
#  plan(multisession, workers = 7) # For the case of 8 available cores
#  
#  # Run the powRICLPM analysis
#  with_progress({ # Subscribe to progress updates
#    output <- powRICLPM(
#      target_power = 0.8,
#      search_lower = 500,
#      search_upper = 1000,
#      search_step = 50,
#      time_points = c(3, 4),
#      ICC = ICC,
#      RI_cor = RI_cor,
#      Phi = Phi,
#      within_cor = 0.3,
#      reps = n_reps
#    )
#  })
#  
#  # Revert back to sequential execution of code
#  plan(sequential)

## ----summary, eval = F--------------------------------------------------------
#  # Summary of study design
#  summary(output)
#  
#  # Summary of results for a specific parameter, across simulation conditions
#  summary(output, parameter = "wB2~wA1")
#  
#  # Summary of all parameter for a specific simulation condition
#  summary(output, sample_size = 500, time_points = 4, ICC = 0.5, reliability = 1)
#  

## ----give, eval = F-----------------------------------------------------------
#  # Extract experimental conditions
#  give(output, what = "conditions")
#  
#  # Extract estimation problems
#  give(output, what = "estimation_problems")
#  
#  # Extract results for cross-lagged effect "wB2~wA1"
#  give(output, what = "results", parameter = "wB2~wA1")
#  
#  # Extract parameter names
#  give(output, what = "names")

## ----plot, eval = FALSE-------------------------------------------------------
#  # Create basic plot of powRICLPM object
#  p <- plot(output, parameter = "wB2~wA1")
#  p
#  
#  # Adjust plot aesthetics
#  p2 <- p +
#    ggplot2::labs(
#      title = "Power analysis for RI-CLPM",
#      caption = paste0("Based on ", n_reps, " replications.")
#    ) +
#    ggplot2::scale_color_discrete("Time points") +
#    ggplot2::guides(
#      color = ggplot2::guide_legend(title = "Time points", nrow = 1),
#      shape = ggplot2::guide_legend(title = "Reliability", nrow = 1),
#      fill = "none"
#    ) +
#    ggplot2::scale_x_continuous(
#      name = "Sample size",
#      breaks = seq(500, 1000, 50),
#      guide = ggplot2::guide_axis(n.dodge = 2)
#    )
#  p2

