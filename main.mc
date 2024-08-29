                                                          MET/CAL Procedure
=============================================================================
INSTRUMENT:            Main
DATE:                  2024-08-28 09:21:08
AUTHOR:                Dan Erlandsen
REVISION:
ADJUSTMENT THRESHOLD:  70%
NUMBER OF TESTS:       1
NUMBER OF LINES:       161
=============================================================================
 STEP    FSC    RANGE NOMINAL        TOLERANCE     MOD1        MOD2  3  4 CON
  1.001  DISP         Calibration of mA Based Pressure sensors
  1.002  LABEL        Test_Setup
#======================================================================
# ABS or GAUGE
  1.003  LABEL        TEST
  1.004  OPBR         Choose yes for GAUGE pressure
  1.004  OPBR         Choose no for ABSOLUTE pressure

  1.005  IF           (MEM1 == 1)
  1.006  MATH         M[21] = 1
  1.007  ELSEIF       (MEM1 == -1)
  1.008  MATH         M[21] = 0
  1.009  ENDIF

  1.010  DISP         Remember to add "A" at the end of unit designation if you chose ABSOLUTE

#Signal LRV
  1.011  MATH         M[5] = 4
#Signal URV
  1.012  MATH         M[6] = 20


  1.013  MEM2         Enter Unit
  1.014  MATH         S[14]= MEM2
#Pressure LRV
  1.015  MEM2         Enter LRV in [S14]
  1.016  MATH         M[7] = MEM2
#Pressure URV
  1.017  MEM2         Enter URV in [S14]
  1.018  MATH         M[8] = MEM2
#Stabilization time (seconds)

  1.019  MATH         M[9] = 120

  1.020  MEM2         Enter FS Tolerance
  1.021  MATH         M[14]= MEM2

#Test tolerance
  1.022  TOL          M14/

#Get ATM Reading

  1.023  IEEE         [@10]
  1.024  IEEE         SENS:PRES:MODE ABS
  1.024  IEEE         OUTP:MODE vent
  1.025  WAIT         -t 20 Waiting for ATM reading
  1.026  IEEE         MEAS?[I]
  1.027  MATH         M[91] = MEM
  1.028  DISP         [M91]
  1.029  MATH         M[92] = FRND(M[91], 6)
  1.030  DISP         [M92]
  1.031  IEEE         CALC:ATM [M92]

  1.032  IF           (M[21] == 1)
  1.033  IEEE         SENS:PRES:MODE GAUG
  1.034  ENDIF

#=======================================================================
  1.035  LABEL        Find_Test_Points

  1.036  MATH         L[1] = M[7]
  1.037  MATH         L[2]= (((M[8]+ABS(M[7]))/4) + M[7])
  1.038  MATH         L[3] = (((M[8]+ABS(M[7]))/2) + M[7])
  1.039  MATH         L[4] = ((((M[8]+ABS(M[7]))/4)*3)+ M[7])
  1.040  MATH         L[5] = M[8]
#=======================================================================
  1.041  LABEL        TEST
  1.042  OPBR         Choose yes to show post test dialouge on fail
  1.042  OPBR         Choose no to hide post test dialouge

  1.043  IF           (MEM1 == 1)
  1.044  ASK+                                                     F
  1.045  ELSEIF       (MEM1 == -1)
  1.046  ASK-                                                     A
  1.047  ENDIF

  1.048  OPBR         Choose yes to use Fluke6270A as pressure source
  1.048  OPBR         Choose no to use DWT or manual pump as pressure source

  1.049  IF           (MEM1 == 1)
  1.050  JMPL         AUTOMATIC
  1.051  ELSEIF       (MEM1 == -1)
  1.052  JMPL         MANUAL
  1.053  ENDIF

  1.054  LABEL        AUTOMATIC
  1.055  LABEL        Rising_Pressure
  1.056  MATH         M[1] = L[1]
  1.057  CALL         Pressure

  1.058  MATH         M[1] = L[2]
  1.059  CALL         Pressure

  1.060  MATH         M[1] = L[3]
  1.061  CALL         Pressure

  1.062  MATH         M[1] = L[4]
  1.063  CALL         Pressure

  1.064  MATH         M[1] = L[5]
  1.065  CALL         Pressure

  1.066  LABEL        Falling_Pressure

  1.067  MATH         M[1] = L[4]
  1.068  CALL         Pressure

  1.069  MATH         M[1] = L[3]
  1.070  CALL         Pressure

  1.071  MATH         M[1] = L[2]
  1.072  CALL         Pressure

  1.073  MATH         M[1] = L[1]
  1.074  CALL         Pressure
  1.075  END


  1.076  LABEL        MANUAL
 # 1.020  LABEL        Rising_Pressure
  #1.021  MATH         M[1] = L[1]
# 1.022  CALL         ManPressure

#  1.023  MATH         M[1] = L[2]
 # 1.024  CALL         ManPressure

  #1.025  MATH         M[1] = L[3]
  #1.026  CALL         ManPressure

  #1.027  MATH         M[1] = L[4]
 # 1.028  CALL         ManPressure

  #1.029  MATH         M[1] = L[5]
  #1.030  CALL         ManPressure

  #1.031  LABEL        Falling_Pressure

  #1.032  MATH         M[1] = L[4]
  #1.033  CALL         ManPressure

  #1.034  MATH         M[1] = L[3]
  #1.035  CALL         ManPressure

 # 1.036  MATH         M[1] = L[2]
  #1.037  CALL         ManPressure

 # 1.038  MATH         M[1] = L[1]
 # 1.039  CALL         ManPressure

  1.077  END
