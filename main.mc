                                                         MET/CAL Procedure
=============================================================================
INSTRUMENT:            Main
DATE:                  2024-08-23 10:09:08
AUTHOR:                Dan Erlandsen
REVISION:
ADJUSTMENT THRESHOLD:  70%
NUMBER OF TESTS:       1
NUMBER OF LINES:       130
=============================================================================
 STEP    FSC    RANGE NOMINAL        TOLERANCE     MOD1        MOD2  3  4 CON
  1.001  DISP         Calibration of mA Based Pressure sensors
  1.002  LABEL        Test_Setup
#======================================================================
#Signal LRV
  1.003  MATH         M[5] = 4
#Signal URV
  1.004  MATH         M[6] = 20


  1.005  MEM2         Enter Unit
  1.006  MATH         S[14]= MEM2
#Pressure LRV
  1.007  MEM2         Enter LRV in [S14]
  1.008  MATH         M[7] = MEM2
#Pressure URV
  1.009  MEM2         Enter URV in [S14]
  1.010  MATH         M[8] = MEM2
#Stabilization time (seconds)

  1.011  MATH         M[9] = 80

  1.012  MEM2         Enter FS Tolerance
  1.013  MATH         M[14]= MEM2

#Test tolerance
  1.014  TOL          M14/
#=======================================================================
  1.015  LABEL        Find_Test_Points

  1.016  MATH         L[1] = M[7]
  1.017  MATH         L[2]= M[8]/4
  1.018  MATH         L[3] = M[8]/2
  1.019  MATH         L[4] = M[8]/4*3
  1.020  MATH         L[5] = M[8]
#=======================================================================
  1.021  LABEL        TEST
  1.022  OPBR         Choose yes to show post test dialouge on fail
  1.022  OPBR         Choose no to hide post test dialouge

  1.023  IF           (MEM1 == 1)
  1.024  ASK+                                                     F
  1.025  ELSEIF       (MEM1 == -1)
  1.026  ASK-                                                     A
  1.027  ENDIF

  1.028  OPBR         Choose yes to use Fluke6270A as pressure source
  1.028  OPBR         Choose no to use DWT or manual pump as pressure source

  1.029  IF           (MEM1 == 1)
  1.030  JMPL         AUTOMATIC
  1.031  ELSEIF       (MEM1 == -1)
  1.032  JMPL         MANUAL
  1.033  ENDIF

  1.034  LABEL        AUTOMATIC
  1.035  LABEL        Rising_Pressure
  1.036  MATH         M[1] = L[1]
  1.037  CALL         Pressure

  1.038  MATH         M[1] = L[2]
  1.039  CALL         Pressure

  1.040  MATH         M[1] = L[3]
  1.041  CALL         Pressure

  1.042  MATH         M[1] = L[4]
  1.043  CALL         Pressure

  1.044  MATH         M[1] = L[5]
  1.045  CALL         Pressure

  1.046  LABEL        Falling_Pressure

  1.047  MATH         M[1] = L[4]
  1.048  CALL         Pressure

  1.049  MATH         M[1] = L[3]
  1.050  CALL         Pressure

  1.051  MATH         M[1] = L[2]
  1.052  CALL         Pressure

  1.053  MATH         M[1] = L[1]
  1.054  CALL         Pressure
  1.055  END


  1.056  LABEL        MANUAL
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

  1.057  END
