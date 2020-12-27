SRCDIR = ../../main/
SRCS  = $(SRCDIR)/top.sv
SRCS += $(SRCDIR)/prescaler.sv
SRCS += $(SRCDIR)/cpu.sv


PROJ = icestick
PIN_DEF = icestick.pcf
DEVICE = hx1k
PACKAGE = tq144

all: $(PROJ).rpt $(PROJ).bin

%.json: $(SRCS)
	yosys -p 'synth_ice40 -top top -json $@' $^

%.asc: %.json
	nextpnr-ice40 --$(DEVICE) --package $(PACKAGE) --pcf $(PIN_DEF) --json $< --asc $@

# Following old style using arachne-pnr
#%.blif: $(SRCS)
#	yosys -p 'synth_ice40 -top top -blif $@' $^
#
#%.asc: $(PIN_DEF) %.blif
#	arachne-pnr -d $(subst hx,,$(subst lp,,$(DEVICE))) -o $@ -p $^

%.bin: %.asc
	icepack $< $@

%.rpt: %.asc
	icetime -d $(DEVICE) -mtr $@ $<

prog: $(PROJ).bin
	iceprog $<

sudo-prog: $(PROJ).bin
	@echo 'Executing prog as root!!!'
	sudo iceprog $<

clean:
	rm -f $(PROJ).blif $(PROJ).json $(PROJ).asc $(PROJ).rpt $(PROJ).bin

.SECONDARY:
.PHONY: all prog clean
