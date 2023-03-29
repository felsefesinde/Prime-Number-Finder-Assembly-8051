		ORG 0
		MOV R0, #29      ; set the number (N) to check 
		MOV B, #1       ; set the divisor
	
		MOV R6, #01H; set the divisor
		MOV R7, #00H; set the square root result indicator
		MOV A, #36; input number for taking the closest square root of N
		
SQUARE_ROOT:	CLR C
		SUBB A, R6
		INC R7
		JZ ANSWER
		INC R6
		INC R6
		SJMP SQUARE_ROOT

		
ANSWER:		
		INC R7
		MOV A, R7
		MOV R4, A
		CLR A
		SJMP LOOP; square root of the number is stored in R7 AND R4

LOOP:
		INC B          ; increment the divisor
		DJNZ R7, CALCULATOR
		SJMP PRIME_RES
    
    
CALCULATOR: 
		MOV A, R0        ; move number to accumulator
		DIV AB      ; divide number by divisor
		MOV A, B
		JZ NOT_PRIME	  ; if remainder is not zero, go to not_prime
		JMP LOOP        ; repeat with the next divisor
		
NOT_PRIME:
		MOV R5, #0; set R5 to 0 indicating N is not a prime number
		SJMP END

PRIME_RES: 
		MOV R5, #1; set R5 to 1 indicating N is a prime number
		SJMP END
		
END:
    END; the program ends here, and the result in R5 indicates if the number is prime or not (R5=1: PRIME - R5=0: NOT PRIME)

