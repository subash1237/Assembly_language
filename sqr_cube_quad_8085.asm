; POINTS TO REMEMBER 
; REMEMBER TO SET MEMORY LOC TO 2000H; table .
; ANSWER MUST CONTAIN WITHIN 4 digit numbers.
; SET 2000H with value of  number to be powered and SET 2004H add with value of power.
; RESET OTHER unnecessary MEMORY and FLAGS BEFORE EXECUTION.
; ANSWER WILL BE DISPLAYED ON 2010H and 2011H; 
LDA 2004H;
MOV C,A;
LDA 2000H;
STA 2011H;
EIS0:LDA 2000H;
MOV E,A;
DCR  C;
LDA 2010H;
MOV L,A;
LDA 2011H;
MOV D,A;
JNZ cisnot0;
hlt;
cisnot0:DCR E;
EISNOT0:LDA 2011H;
ADD D;
JNC nocarry;
STA 2011H;
LDA 2010H;
CPI 001H;
JZ I0;
LDA 2010H;
ADD L;
STA 2010h;
I0:LDA 2010H;
INR A;
STA 2010H;
CMP A;
JZ ESCP;
nocarry:STA 2011H;
LDA 2010H;
ADD L;
STA 2010H;
ESCP:DCR E;
JZ EIS0;
JNZ EISNOT0;
