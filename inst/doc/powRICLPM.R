## ----step2--------------------------------------------------------------------
Phi <- matrix(c(.4, .1, .2, .3), ncol = 2, byrow = T)
# The .2 refers to our standardized cross-lagged effect of interest
within_cor <- 0.3
ICC <- 0.5
RI_cor <- 0.3

## ----analysis, eval = F-------------------------------------------------------
#  output <- powRICLPM(
#    target_power = 0.8,
#    search_lower = 100,
#    search_upper = 1000,
#    search_step = 50,
#    time_points = c(3, 4, 5),
#    ICC = ICC,
#    RI_cor = RI_cor,
#    Phi = Phi,
#    within_cor = 0.3,
#    reps = 1000
#  )

## ----furrr-setup, eval = F----------------------------------------------------
#  # Load the furrr and progressr packages
#  library(furrr)
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
#      search_lower = 100,
#      search_upper = 1000,
#      search_step = 50,
#      time_points = c(3, 4, 5),
#      ICC = ICC,
#      RI_cor = RI_cor,
#      Phi = Phi,
#      within_cor = 0.3,
#      reps = 1000
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
#  summary(output, sample_size = 400, time_points = 4, ICC = 0.5)
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
#      caption = "Based on 1000 replications."
#    ) +
#    ggplot2::scale_x_continuous(
#      name = "Sample size",
#      breaks = seq(100, 1000, 100),
#      guide = ggplot2::guide_axis(n.dodge = 2)
#    )
#  p2

