                                                            MET/CAL Procedure
=============================================================================
INSTRUMENT:            test
DATE:                  2024-03-05 09:32:26
AUTHOR:                Dan Erlandsen
REVISION:
ADJUSTMENT THRESHOLD:  70%
NUMBER OF TESTS:       2
NUMBER OF LINES:       42
=============================================================================
 STEP    FSC    RANGE NOMINAL        TOLERANCE     MOD1        MOD2  3  4 CON

#Header and range
  1.001  DISP         Test procedure for pressure calibration
  1.002  MATH         M[3] = 7000
  1.003  HEAD         {Pressure Test, [M3] mBar range}

#Setpoint and tolerance
  1.004  TOL          0.1/
  1.005  MATH         MEM1 = 300

#Tell the fluke its setpoint, then set it to control mode. 10 is its current GPIB address
  1.006  IEEE         [@10]
  1.006  IEEE         SOUR:PRES [MEM1]
  1.007  IEEE         OUTP:MODE control

#wait for pressure to stabilize
  1.008  WAIT         -t 30 Waiting for stabilization
  1.009  DISP         Wait until fluke 6270A displays the READY flag, then press "advance" or enter

#Ask Fluke for its current pressure reading, then store it in MEM1 register
  1.010  IEEE         MEAS?[I]
  1.011  MATH         MEM1 = MEM

#Prompt the operator for the current DUT reading, then evaluate with the MEM1 register, and the tolerence specified earlier
  1.012  MATH         MEM2 = M[3]
  1.013  MEMI         Please enter the DUT reading
  1.014  MEMCX  7000  mBarG          TOL

#stop regulating pressure, since test is finished
  2.001  IEEE         OUTP:MODE measure
