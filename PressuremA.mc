                                                          MET/CAL Procedure
=============================================================================
INSTRUMENT:            Pressure
DATE:                  2024-08-23 13:28:38
AUTHOR:                Dan Erlandsen
REVISION:
ADJUSTMENT THRESHOLD:  70%
NUMBER OF TESTS:       2
NUMBER OF LINES:       51
CONFIGURATION:         Fluke 8558A
=============================================================================
 STEP    FSC    RANGE NOMINAL        TOLERANCE     MOD1        MOD2  3  4 CON

  1.001  ASK-   R     N                            M
  1.002  8558A        +Current = 24mA; Setup

  1.001  IEEE         SENS:PRES:MODE ABS
  1.001  IEEE         OUTP:MODE vent
  1.011  IEEE         MEAS?[I]
  1.001  IEEE         CALC:ATM [MEM]

  1.001  IEEE         SENS:PRES:MODE GAUG


  1.001  IEEE         UNIT:PRES [S14]


#Tell the fluke its setpoint, then set it to control mode. 10 is its current GPIB address
  1.003  IEEE         [@10]
  1.004  IF           (M[1] == 0)
  1.005  IEEE         OUTP:MODE vent
  1.006  ELSE
  1.007  IEEE         SOUR:PRES [M1]
  1.008  IEEE         OUTP:MODE control
  1.009  ENDIF


#wait for pressure to stabilize
  1.010  WAIT         -t [M9] Waiting for stabilization
 # 1.011  DISP         Wait until fluke 6270A displays the READY flag, then press "advance" or enter

#Ask Fluke for its current pressure reading, then store it in MEM1 register
  1.011  IEEE         MEAS?[I]
##  1.007  RSLT         =[MEM] mBar
  1.012  MATH         M[11] = MEM

#Calulate corresponding mA value
  1.013  MATH         MEM1 = ((MEM - M[7]) / (M[8] - M[7]) * (M[6] - M[5]) + M[5])

#Read current mA value
  1.014  8558A        +Current = [MEM1]mA; Read
  1.015  VSET         TDESC = [M11] [S14]
  1.016  MEMCX  20    mA             TOL

#stop regulating pressure, since test is finished
  2.001  IF           (M[1] == 0)
  2.002  IEEE         OUTP:MODE vent
  2.003  ELSE
  2.004  IEEE         OUTP:MODE measure
  2.005  ENDIF

  2.006  END
