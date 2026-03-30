# Interrupt_Generator
The interrupt generator module designed here detects an input event and converts it into a level-triggered interrupt that can be cleared by software. The module is controlled by memory-mapped registers through the AXI4-Lite-Interface. The IP is then connected to Zynq Processing system (PS) using an AXI interconnect. The interrupt output from the custom IP designed is connected to the Zynq interrupt controller. This allows the software that is running on an ARM processor to respond to hardware events generated in the PL. The C program in Vitis enables the interrupt, services the interrupt when it happens, and clears the interrupt using an AXI control register.
#Version
Vivado 2023.1
Vitis 2023.1
