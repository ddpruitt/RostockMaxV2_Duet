; Configuration file for dc42 Kossel
; Update for modified Rostock Max V2

; Communication and general
M111 S0                                     ; Debug off
M550 RostockMaxV2                           ; Machine name (can be anything you like)
M551 Preprap                                ; Machine password (used for FTP)
M540 P0xBE:0xEF:0xDE:0xAD:0xFE:0x42         ; MAC Address

;*** Adjust the IP address and gateway in the following 2 lines to suit your network
M552 P192.168.1.210                         ; IP address (0 = use DHCP)
M554 P192.168.1.1                           ; Gateway
M553 P255.255.255.0                         ; Netmask
M555 P2                                     ; Set output to look like Marlin
M575 P1 B57600 S1                           ; Set auxiliary serial port baud rate and require checksum (for PanelDue)

; Axis and motor configuration
M569 P0 S0                                  ; Drive 0 goes backwards (Z Tower)
M569 P1 S1                                  ; Drive 1 goes forwards  (Y Tower)
M569 P2 S0                                  ; Drive 2 goes backwards (X Tower)
M569 P3 S0                                  ; Drive 3 goes backwards
M569 P4 S0                                  ; Drive 4 goes backwards
M574 X2 Y2 Z2 S1                            ; set endstop configuration (all endstops at high end, active high)

M665 R171.64 L325.0 B150 H286.57 X0 Y0      ; set delta radius, diagonal rod length, printable radius, homed height and XY tower corrections
M666 X0 Y0 Z0                               ; put your endstop adjustments here, or use auto calibration to find them
M92 X80 Y80 Z80                             ; Set axis steps/mm
M906 X1000 Y1000 Z1000 E600                 ; Set motor currents (mA)
M201 X3000 Y3000 Z3000 E1000                ; Accelerations (mm/s^2)
M203 X18000 Y18000 Z18000 E3600             ; Maximum speeds (mm/min)
M566 X600 Y600 Z600 E600                    ; Maximum instant speed changes
G21                                         ; Work in millimetres
G90                                         ; Send absolute coordinates...
M83                                         ; ...but relative extruder moves

; Thermistors and heaters
M305 P0 T100000 B3950 R4700 H0 L0           ; Typical Chinese bed thermistor. Put your own H and/or L values here to set the bed thermistor ADC correction.
M305 P1 T100000 B4388 R4700 H0 L0           ; E3Dv6 hot end. Put your own H and/or L values here if necessary to set the first nozzle thermistor ADC correction.
M301 H0 P20 I0.5 D1000 T0.50 W150 B5        ; PID settings for the bed
M301 H1 P10 I0.10 D100 T0.50                ; PID settings for extruder 0
M570 S200                                   ; Allow extra heating time

; Tool definitions
M563 P0 D0 H1                               ; Define tool 0
G10 P0 S0 R0                                ; Set tool 0 operating and standby temperatures
M92 E447                                    ; Set extruder steps per mm for first and second extruders

; Z probe and compensation definition
; *** If you have an IR zprobe instead of a switch, change P4 to P1 in the following M558 command
M558 P4 X0 Y0 Z0 H3                         ; Z probe is a switch and is not used for homing any axes
G31 X0 Y0 Z-.05 P500                        ; Set the zprobe height and threshold (put your own values here)

;*** If you are using axis compensation, put the figures in the following command
M556 S78 X0 Y0 Z0                           ; Axis compensation here

M207 S7.0 F3600 Z0.1                        ; Set firmware retraction details
M572 D0 S0.1                                ; set pressure advance

T0                                          ; select first print head
