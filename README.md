# x86-led-control
Control a series of LED outputs using an ADC's inputs.

There are 4 or 2 different combinations for the 6 leds which can be controlled with 8bits and are connected to output 03.
The 4 combinations are stated in TABLE, along with the time they need to stay on (it's a number used in the delay subroutine).
Every time the combinations are displayed, the cpu checks the input 01, which has a photodiode connected to an ADC,
and if the input is below 0x05 uses the TABLE1 (2 combinations), otherwise uses the TABLE (4 combinations).
