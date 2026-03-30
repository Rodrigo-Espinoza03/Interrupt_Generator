# Usage with Vitis IDE:
# In Vitis IDE create a Single Application Debug launch configuration,
# change the debug type to 'Attach to running target' and provide this 
# tcl script in 'Execute Script' option.
# Path of this script: C:\Users\ER250\OneDrive\Documents\ECE520_SOC\ECE520_SandBox\int_gen_soc_re\int_gen_soc_vitis\int_gen_app2_system\_ide\scripts\debugger_int_gen_app2-default.tcl
# 
# 
# Usage with xsct:
# To debug using xsct, launch xsct and run below command
# source C:\Users\ER250\OneDrive\Documents\ECE520_SOC\ECE520_SandBox\int_gen_soc_re\int_gen_soc_vitis\int_gen_app2_system\_ide\scripts\debugger_int_gen_app2-default.tcl
# 
connect -url tcp:127.0.0.1:3121
targets -set -nocase -filter {name =~"APU*"}
rst -system
after 3000
targets -set -filter {jtag_cable_name =~ "Digilent Zybo Z7 210351BE7A49A" && level==0 && jtag_device_ctx=="jsn-Zybo Z7-210351BE7A49A-13722093-0"}
fpga -file C:/Users/ER250/OneDrive/Documents/ECE520_SOC/ECE520_SandBox/int_gen_soc_re/int_gen_soc_vitis/int_gen_app2/_ide/bitstream/int_gen_bd_re_wrapper.bit
targets -set -nocase -filter {name =~"APU*"}
loadhw -hw C:/Users/ER250/OneDrive/Documents/ECE520_SOC/ECE520_SandBox/int_gen_soc_re/int_gen_soc_vitis/int_gen_plat/export/int_gen_plat/hw/int_gen_bd_re_wrapper.xsa -mem-ranges [list {0x40000000 0xbfffffff}] -regs
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*"}
source C:/Users/ER250/OneDrive/Documents/ECE520_SOC/ECE520_SandBox/int_gen_soc_re/int_gen_soc_vitis/int_gen_app2/_ide/psinit/ps7_init.tcl
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "*A9*#0"}
dow C:/Users/ER250/OneDrive/Documents/ECE520_SOC/ECE520_SandBox/int_gen_soc_re/int_gen_soc_vitis/int_gen_app2/Debug/int_gen_app2.elf
configparams force-mem-access 0
targets -set -nocase -filter {name =~ "*A9*#0"}
con
