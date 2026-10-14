#include <avr/io.h>
.global ini
ini:
    sbi _SFR_IO_ADDR(DDRB),PB1
; ====== bucles FOR ===== 
for_1_value:
    ldi r21, 21
    ldi r20, 42
for_1:
    inc r21
    mov r22, r21
    rcall pulso
    rcall externo
    cp r21, r20
    brne for_1
for_2_value:
    ldi r21, 42
    ldi r30, 21
for_2:
    dec r21
    mov r22, r21
    rcall pulso
    rcall externo
    cp r21, r30
    brne for_2
    rjmp for_1_value
; ======= FIN BUCLES FOR ====== 
; ====== PULSO ====== 
pulso:
    sbi _SFR_IO_ADDR(PORTB),PB1
pausa:
    rcall bucle_2
    dec r22
    brne pausa 
    cbi _SFR_IO_ADDR(PORTB),PB1
    ret
; ======= FIN PULSO ======= 
; ====== BUCLES ======= 
externo:
    ldi r17, 0
medio:
    ldi r18, 0
interno:
    dec r18
    brne interno
    dec r17
    brne medio
    ret
bucle_2:
    ldi r16, 0
interno_2:
    dec r16
    brne interno_2
    ret
; ======== FIN BUCLES ======== 
