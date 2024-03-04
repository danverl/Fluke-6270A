                                                            MET/CAL Procedure
=============================================================================
INSTRUMENT:            test
DATE:                  2024-03-04 14:27:05
AUTHOR:                Dan Erlandsen
REVISION:
ADJUSTMENT THRESHOLD:  70%
NUMBER OF TESTS:       1
NUMBER OF LINES:       21
=============================================================================
 STEP    FSC    RANGE NOMINAL        TOLERANCE     MOD1        MOD2  3  4 CON

  1.001  DISP         Test procedure for pressure testing development

  1.002  MATH         MEM2 = 300 #Pressure value for setpoint

  1.003  IEEE         [@10] #Set IEE GPIB Adress that we are communicating with
  1.003  IEEE         SOUR:PRES [MEM2] #Set source pressure to the value of M2
  1.004  IEEE         OUTP:MODE control #Set the controller to control mode. [CONTROL:MEASURE:VENT]
  1.005  IEEE         [I] MEAS:PRES? #Query the instrument for the current pressure and store it in [MEM]

  1.006  DISP         [MEM] #Display the pressure 
