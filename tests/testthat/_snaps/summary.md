# powRICLPM_summary() works

    Code
      summary(out1)
    Output
      powRICLPM (0.1.1) simulated power for 2 experimental conditions:
      
       Sample size    Time points   ICC   Errors   Non-convergence    Inadmissible results
      -------------  ------------  ----  -------  -----------------  ---------------------
           300                  3   0.5        0          0                              0
           400                  3   0.5        0          0                              0

---

    Code
      summary(out1, parameter = "wB2~wA1")
    Output
      Results for wB2~wA1 across conditions:
      
         N    T   ICC   Err   NC   IR    PV     Avg     Min      SD   SE Avg     MSE   Accuracy   Coverage   Power
      ----  ---  ----  ----  ---  ---  ----  ------  ------  ------  -------  ------  ---------  ---------  ------
       300    3   0.5     0    0    0   0.2   0.245   0.215   0.042    0.128   0.003      0.501          1     0.5
       400    3   0.5     0    0    0   0.2   0.233   0.158   0.107    0.093   0.007      0.365          1     0.5

