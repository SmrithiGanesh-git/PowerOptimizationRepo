# Clock Constraint
create_clock -period 10 [get_ports clk]   # The clock setting with a period of 10 ns 

set_property UPF_FILE {Unsupported Constraints/powerGating.upf} [current_project] #the .upf file is included to decide the on and off state behaviour

# Input Delay Constraints
set_input_delay -clock [get_ports clk] -max 2 [get_ports rst]#2ns delay
set_input_delay -clock [get_ports clk] -max 2 [get_ports enable_clk]#2ns delay
set_input_delay -clock [get_ports clk] -max 2 [get_ports power_enable]#2ns delay

# Output Delay Constraint
set_output_delay -clock [get_ports clk] -max 2 [get_pins u1/I]

# False Path Constraints (if applicable)
# no timing requirements between count and other signals
set_false_path -from [get_registers count] -to *

# Clock Gating Constraint
# the clock gating enable signal (enable_clk) has a setup time of 2 ns
set_input_delay -clock [get_ports clk] -max 2 [get_ports enable_clk]

# Power Gating Constraint
# the power enable signal (power_enable) has a setup time of 2 ns
set_input_delay -clock [get_ports clk] -max 2 [get_ports power_enable]
