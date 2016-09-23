; Auto calibration routine for delta printers
; Before running this, you should have set up your zprobe Z offset to suit your build, in the G31 command in config.g.

M561                  	; clear any bed transform, otherwise homing may be at the wrong height
G31 X0 Y0               ; don't want any probe offset for this
G28                     ; home the printer

; Probe the bed and do auto calibration
G1 X0 Y0 Z10 F15000		; go to just above the first probe point to speed up probing

; Probe the bed and do 6- or 7-factor auto calibration
G30 P0 X-86.60 Y-50.00 Z-99999 ; X tower
G30 P1 X0.00 Y-100.00 Z-99999  ; between X-Y towers

G30 P2 X86.60 Y-50.00 Z-99999  ; Y tower
G30 P3 X86.60 Y50.00 Z-99999   ; between Y-Z towers

G30 P4 X0.00 Y100.00 Z-99999   ; Z tower
G30 P5 X-86.60 Y50.00 Z-99999  ; between Z-X towers

G30 P6 X-43.30 Y-25.00 Z-99999 ; X tower
G30 P7 X0.00 Y-50.00 Z-99999   ; between X-Y towers

G30 P8 X43.30 Y-25.00 Z-99999  ; Y tower
G30 P9 X43.30 Y25.00 Z-99999   ; between Y-Z towers

G30 P10 X0.00 Y50.00 Z-99999   ; Z tower
G30 P11 X-43.30 Y25.00 Z-99999 ; between Z-X towers

G30 P12 X0 Y0 Z-99999 S6       ; center and auto-calibrate 6 factors

G1 X0 Y0 Z150 F15000           ; get the head out of the way of the bed

