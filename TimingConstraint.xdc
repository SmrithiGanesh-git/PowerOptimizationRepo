# Clock Constraint
create_clock -period 10 [get_ports clk]   

# Input Delay Constraints
set_input_delay -clock [get_ports clk] -max 2 [get_ports rst]
set_input_delay -clock [get_ports clk] -max 2 [get_ports enable_clk]
set_input_delay -clock [get_ports clk] -max 2 [get_ports power_enable]

# Output Delay Constraint
set_output_delay -clock [get_ports clk] -max 2 [get_pins u1/I]

# False Path Constraints (if applicable)
# Assuming no specific timing requirements between count and other signals
set_false_path -from [get_registers count] -to *

# Clock Gating Constraint
# Assuming the clock gating enable signal (enable_clk) has a setup time of 2 ns
set_input_delay -clock [get_ports clk] -max 2 [get_ports enable_clk]

# Power Gating Constraint
# Assuming the power enable signal (power_enable) has a setup time of 2 ns
set_input_delay -clock [get_ports clk] -max 2 [get_ports power_enable]
