SetActiveLib -work
comp -include "$dsn\src\kxx_module.vhd"
comp -include "$dsn\src\kxx_module_tb.vhd"
asim +access +r kxx_module_tb
wave
wave -noreg -decimal t_x
wave -noreg -decimal t_y
wave -noreg -decimal uut/int_x
wave -noreg -decimal uut/int_y
run 200 ns