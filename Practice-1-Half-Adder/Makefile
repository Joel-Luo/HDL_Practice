vvp=vvp
CC=iverilog

all: wave
	$(vvp) -n wave -lxt2

wave: clean	
	$(CC) -o wave testbench.v

.PHONY: clean
clean:
	rm -f wave wave.vcd
