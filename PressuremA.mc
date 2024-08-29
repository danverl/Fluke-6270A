                                                          MET/CAL Procedure
=============================================================================
INSTRUMENT:            Pressure
DATE:                  2024-08-29 09:00:15
AUTHOR:                Dan Erlandsen
REVISION:
ADJUSTMENT THRESHOLD:  70%
NUMBER OF TESTS:       2
NUMBER OF LINES:       58
CONFIGURATION:         Fluke 8558A
=============================================================================
 STEP    FSC    RANGE NOMINAL        TOLERANCE     MOD1        MOD2  3  4 CON

  1.001  ASK-   R     N                            M
  1.002  8558A        +Current = 24mA; Setup


#Tell the fluke its setpoint, then set it to control mode. 10 is its current GPIB address
  1.003  IEEE         [@10]
  1.004  IF           (M[1] == 0)
#IF GAUGE and set point is 0, vent to atm. Else, if mode is ABS and setpoint is 0, set mode to control
  1.005  IF           (M[21] == 1)
  1.006  IEEE         OUTP:MODE vent
  1.007  ELSE
  1.008  IEEE         SOUR:PRES [M1]
  1.009  IEEE         OUTP:MODE control
  1.010  ENDIF
  1.011  ELSE
  1.012  IEEE         SOUR:PRES [M1]
  1.013  IEEE         OUTP:MODE control
  1.014  ENDIF


#wait for pressure to stabilize
  1.015  WAIT         -t [M9] Waiting for stabilization
 # 1.011  DISP         Wait until fluke 6270A displays the READY flag, then press "advance" or enter

#Ask Fluke for its current pressure reading, then store it in MEM1 register
  1.016  IEEE         MEAS?[I]
##  1.007  RSLT         =[MEM] mBar
  1.017  MATH         M[11] = MEM

#Calulate corresponding mA value
  1.018  MATH         MEM1 = ((MEM - M[7]) / (M[8] - M[7]) * (M[6] - M[5]) + M[5])

#Read current mA value
  1.019  8558A        +Current = [MEM1]mA;AverageCount = 4; Read
  1.020  VSET         TDESC = [M11] [S14]
  1.021  MEMCX  20    mA             TOL

#stop regulating pressure, since test is finished
  2.001  IF           (M[1] == 0)
  2.002  IEEE         OUTP:MODE vent
  2.003  ELSE
  2.004  IEEE         OUTP:MODE measure
  2.005  ENDIF

  2.006  END
