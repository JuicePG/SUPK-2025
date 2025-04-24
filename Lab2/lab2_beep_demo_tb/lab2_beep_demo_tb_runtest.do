# simulation run script for lab1_switch_led_tb
# to use in Avtive-HDL environment
SetActiveLib -work
comp -include "$dsn\src\switch_driver.vhd"
comp -include "$dsn\src\led_driver.vhd"
comp -include "$dsn\src\control_fsm.vhd"
comp -include "$dsn\src\switch_led_beep_tester.vhd"
comp -include "$dsn\src\lab2_beep_demo.vhd"
comp -include "$dsn\src\lab2_beep_demo_tb\lab2_beep_demo_tb.vhd"
asim +access +r lab2_beep_demo_tb
wave
wave -noreg clk
wave -noreg rst
wave -noreg swi
wave -noreg led
wave -noreg bpo
wave -divider "switch_driver"
wave -noreg "uut/unit1/U1/sw_state_shiftreg"
wave -noreg "uut/unit1/U1/sw_fsm_state"
wave -noreg "uut/unit1/U1/sw_scan_counter"
wave -noreg "uut/unit1/U1/shiftreg_en"
wave -noreg "uut/unit1/U1/rie"
wave -noreg "uut/unit1/U1/fae"
wave -noreg "uut/unit1/U1/lpr"
wave -noreg "uut/unit1/U1/long_press_counter"
wave -divider "control_fsm"
wave -noreg "uut/unit1/U2/fsm_state"
wave -noreg "uut/unit1/U2/led_mode_sig"
wave -divider "led_driver"
wave -noreg "uut/unit1/U3/counter_1"
wave -noreg "uut/unit1/U3/wave_1sec"	
wave -noreg "uut/unit1/U3/counter_2"
wave -noreg "uut/unit1/U3/wave_100ms"
wave -divider "beep_driver"
wave -noreg "uut/beep_drv/snd_state"
wave -noreg "uut/beep_drv/beep_counter"
wave -noreg "uut/beep_drv/snd_counter"
wave -noreg "uut/beep_drv/beep_en"
wave -noreg "uut/beep_drv/db_stage_count"
run 1600 us;
