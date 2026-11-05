# Replace 'clk' with your exact module clock input port name
# -period is in nanoseconds (10.000 ns = 100 MHz target frequency)
create_clock -period 10.000 -name sys_clk -waveform {0.000 5.000} [get_ports clk]