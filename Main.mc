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

  1.002  MATH         MEM2 = 300

  1.003  IEEE         [@10]
  1.003  IEEE         SOUR:PRES [MEM2]
  1.004  IEEE         OUTP:MODE control
  1.005  IEEE         [I] MEAS:PRES?

  1.006  DISP         [MEM]
