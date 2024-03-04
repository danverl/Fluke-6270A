The intention for this repo is to be an easy to use IEEE reference guide for use with Fluke 6270A in MET/CAL procedures.

All information is from MET/CAL Reference guide Rev 7 and Fluke 6270A Programmers guide June 2015. These documents belong to fluke, and are copyrighted.

Fluke IEEE Commands are constructed with three parts. These are category, command and variables. 
Each command ios structured like this, with a few exceptions. See Fluke 6270A programmers manual for more detail on these commands and their use 
CATEgory:COMMand <variables>

- SOURce
  - PRESsure
    - CLIMit
    - SLEW
    - SLIMit
    - STATic
    - TOLerance
    - [:LEVel][:IMMediate][:AMPLitude]
- CALCulate
  - ATMosphere
  - LIMit
    - LOWer
    - SLEW
    - UPPer
    - VENT
  - TARE
    - STATe
    - VALue
- CALibration
  - MODE
  - PRESSURE
    - DATA
      - CALibration
        - POINts
        - VALue
    - DATE
    - SAVE
    - TIME
    - VALue
    - ZERO
      - AUTO
      - INITiate
      - RUN
      - STOP
- DISPlay
- MEASure
- SENse
- STATus
- SYSTem
- TEST
- UNIT 

- Others
  - *CLS
  - *ESE
  - *ESR
  - *IDN
  - *OPC
  - *OPC?
  - *OPT?
  - *RST
  - *SRE
  - *STB
  - *TST
  - *WAI
