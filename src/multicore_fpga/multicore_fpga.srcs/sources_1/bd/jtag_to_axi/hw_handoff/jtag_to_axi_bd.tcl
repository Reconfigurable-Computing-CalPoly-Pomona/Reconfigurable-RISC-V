
################################################################
# This is a generated script based on design: jtag_to_axi
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2018.3
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_msg_id "BD_TCL-109" "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source jtag_to_axi_script.tcl

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xc7s50csga324-1
   set_property BOARD_PART digilentinc.com:arty-s7-50:part0:1.0 [current_project]
}


# CHANGE DESIGN NAME HERE
variable design_name
set design_name jtag_to_axi

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_msg_id "BD_TCL-001" "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_msg_id "BD_TCL-002" "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_msg_id "BD_TCL-003" "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_msg_id "BD_TCL-004" "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_msg_id "BD_TCL-005" "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_msg_id "BD_TCL-114" "ERROR" $errMsg}
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder
  variable design_name

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports
  set sw [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 sw ]

  # Create ports
  set ddr_clock [ create_bd_port -dir I -type clk ddr_clock ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {100000000} \
 ] $ddr_clock
  set led [ create_bd_port -dir O -from 1 -to 0 led ]
  set reset_n [ create_bd_port -dir I -type rst reset_n ]
  set_property -dict [ list \
   CONFIG.POLARITY {ACTIVE_LOW} \
 ] $reset_n

  # Create instance: axi_gpio_0, and set properties
  set axi_gpio_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 axi_gpio_0 ]
  set_property -dict [ list \
   CONFIG.C_ALL_OUTPUTS_2 {1} \
   CONFIG.C_GPIO2_WIDTH {2} \
   CONFIG.C_IS_DUAL {1} \
   CONFIG.GPIO_BOARD_INTERFACE {dip_switches_4bits} \
   CONFIG.USE_BOARD_FLOW {true} \
 ] $axi_gpio_0

  # Create instance: axi_interconnect_0, and set properties
  set axi_interconnect_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_interconnect_0 ]
  set_property -dict [ list \
   CONFIG.ENABLE_ADVANCED_OPTIONS {1} \
   CONFIG.NUM_MI {3} \
   CONFIG.NUM_SI {1} \
 ] $axi_interconnect_0

  # Create instance: clk_wiz, and set properties
  set clk_wiz [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:6.0 clk_wiz ]
  set_property -dict [ list \
   CONFIG.CLKOUT1_JITTER {226.435} \
   CONFIG.CLKOUT1_PHASE_ERROR {236.795} \
   CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {75.000} \
   CONFIG.MMCM_CLKFBOUT_MULT_F {40.125} \
   CONFIG.MMCM_CLKOUT0_DIVIDE_F {13.375} \
   CONFIG.MMCM_DIVCLK_DIVIDE {4} \
   CONFIG.RESET_PORT {resetn} \
   CONFIG.RESET_TYPE {ACTIVE_LOW} \
 ] $clk_wiz

  # Create instance: data_mem, and set properties
  set data_mem [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.4 data_mem ]
  set_property -dict [ list \
   CONFIG.Assume_Synchronous_Clk {true} \
   CONFIG.Enable_B {Use_ENB_Pin} \
   CONFIG.Load_Init_File {false} \
   CONFIG.Memory_Type {True_Dual_Port_RAM} \
   CONFIG.Port_A_Write_Rate {50} \
   CONFIG.Port_B_Clock {100} \
   CONFIG.Port_B_Enable_Rate {100} \
   CONFIG.Port_B_Write_Rate {50} \
   CONFIG.Use_Byte_Write_Enable {true} \
   CONFIG.Use_RSTB_Pin {true} \
 ] $data_mem

  # Create instance: data_mem_ctrl, and set properties
  set data_mem_ctrl [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_bram_ctrl:4.1 data_mem_ctrl ]

  # Create instance: instr_mem, and set properties
  set instr_mem [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.4 instr_mem ]
  set_property -dict [ list \
   CONFIG.Assume_Synchronous_Clk {true} \
   CONFIG.Coe_File {no_coe_file_loaded} \
   CONFIG.Enable_B {Use_ENB_Pin} \
   CONFIG.Load_Init_File {false} \
   CONFIG.Memory_Type {True_Dual_Port_RAM} \
   CONFIG.Port_A_Write_Rate {50} \
   CONFIG.Port_B_Clock {100} \
   CONFIG.Port_B_Enable_Rate {100} \
   CONFIG.Port_B_Write_Rate {50} \
   CONFIG.Use_Byte_Write_Enable {true} \
   CONFIG.Use_RSTB_Pin {true} \
 ] $instr_mem

  # Create instance: instr_mem_ctrl, and set properties
  set instr_mem_ctrl [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_bram_ctrl:4.1 instr_mem_ctrl ]

  # Create instance: jtag_master, and set properties
  set jtag_master [ create_bd_cell -type ip -vlnv xilinx.com:ip:jtag_axi:1.2 jtag_master ]
  set_property -dict [ list \
   CONFIG.M_AXI_ID_WIDTH {4} \
   CONFIG.RD_TXN_QUEUE_LENGTH {4} \
   CONFIG.WR_TXN_QUEUE_LENGTH {4} \
 ] $jtag_master

  # Create instance: rst_clk_wiz_100M, and set properties
  set rst_clk_wiz_100M [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_clk_wiz_100M ]

  # Create interface connections
  connect_bd_intf_net -intf_net axi_gpio_0_GPIO [get_bd_intf_ports sw] [get_bd_intf_pins axi_gpio_0/GPIO]
  connect_bd_intf_net -intf_net axi_interconnect_0_M00_AXI [get_bd_intf_pins axi_interconnect_0/M00_AXI] [get_bd_intf_pins data_mem_ctrl/S_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M01_AXI [get_bd_intf_pins axi_interconnect_0/M01_AXI] [get_bd_intf_pins instr_mem_ctrl/S_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M02_AXI [get_bd_intf_pins axi_gpio_0/S_AXI] [get_bd_intf_pins axi_interconnect_0/M02_AXI]
  connect_bd_intf_net -intf_net data_mem_ctrl_BRAM_PORTA [get_bd_intf_pins data_mem/BRAM_PORTA] [get_bd_intf_pins data_mem_ctrl/BRAM_PORTA]
  connect_bd_intf_net -intf_net data_mem_ctrl_BRAM_PORTB [get_bd_intf_pins data_mem/BRAM_PORTB] [get_bd_intf_pins data_mem_ctrl/BRAM_PORTB]
  connect_bd_intf_net -intf_net instr_mem_ctrl_BRAM_PORTA [get_bd_intf_pins instr_mem/BRAM_PORTA] [get_bd_intf_pins instr_mem_ctrl/BRAM_PORTA]
  connect_bd_intf_net -intf_net instr_mem_ctrl_BRAM_PORTB [get_bd_intf_pins instr_mem/BRAM_PORTB] [get_bd_intf_pins instr_mem_ctrl/BRAM_PORTB]
  connect_bd_intf_net -intf_net jtag_master_M_AXI [get_bd_intf_pins axi_interconnect_0/S00_AXI] [get_bd_intf_pins jtag_master/M_AXI]

  # Create port connections
  connect_bd_net -net axi_gpio_0_gpio2_io_o [get_bd_ports led] [get_bd_pins axi_gpio_0/gpio2_io_o]
  connect_bd_net -net clk_wiz_clk_out1 [get_bd_pins axi_gpio_0/s_axi_aclk] [get_bd_pins axi_interconnect_0/ACLK] [get_bd_pins axi_interconnect_0/M00_ACLK] [get_bd_pins axi_interconnect_0/M01_ACLK] [get_bd_pins axi_interconnect_0/M02_ACLK] [get_bd_pins axi_interconnect_0/S00_ACLK] [get_bd_pins clk_wiz/clk_out1] [get_bd_pins data_mem_ctrl/s_axi_aclk] [get_bd_pins instr_mem_ctrl/s_axi_aclk] [get_bd_pins jtag_master/aclk] [get_bd_pins rst_clk_wiz_100M/slowest_sync_clk]
  connect_bd_net -net clk_wiz_locked [get_bd_pins clk_wiz/locked] [get_bd_pins rst_clk_wiz_100M/dcm_locked]
  connect_bd_net -net ddr_clock_1 [get_bd_ports ddr_clock] [get_bd_pins clk_wiz/clk_in1]
  connect_bd_net -net reset_1 [get_bd_ports reset_n] [get_bd_pins clk_wiz/resetn] [get_bd_pins rst_clk_wiz_100M/ext_reset_in]
  connect_bd_net -net rst_clk_wiz_100M_peripheral_aresetn [get_bd_pins axi_gpio_0/s_axi_aresetn] [get_bd_pins axi_interconnect_0/ARESETN] [get_bd_pins axi_interconnect_0/M00_ARESETN] [get_bd_pins axi_interconnect_0/M01_ARESETN] [get_bd_pins axi_interconnect_0/M02_ARESETN] [get_bd_pins axi_interconnect_0/S00_ARESETN] [get_bd_pins data_mem_ctrl/s_axi_aresetn] [get_bd_pins instr_mem_ctrl/s_axi_aresetn] [get_bd_pins jtag_master/aresetn] [get_bd_pins rst_clk_wiz_100M/peripheral_aresetn]

  # Create address segments
  create_bd_addr_seg -range 0x00001000 -offset 0x00002000 [get_bd_addr_spaces jtag_master/Data] [get_bd_addr_segs axi_gpio_0/S_AXI/Reg] SEG_axi_gpio_0_Reg
  create_bd_addr_seg -range 0x00001000 -offset 0x00000000 [get_bd_addr_spaces jtag_master/Data] [get_bd_addr_segs data_mem_ctrl/S_AXI/Mem0] SEG_data_mem_ctrl_Mem0
  create_bd_addr_seg -range 0x00001000 -offset 0x00001000 [get_bd_addr_spaces jtag_master/Data] [get_bd_addr_segs instr_mem_ctrl/S_AXI/Mem0] SEG_instr_mem_ctrl_Mem0


  # Restore current instance
  current_bd_instance $oldCurInst

  validate_bd_design
  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


