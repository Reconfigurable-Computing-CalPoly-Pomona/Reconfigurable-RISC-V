# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  set C_m_instr_TARGET_SLAVE_BASE_ADDR [ipgui::add_param $IPINST -name "C_m_instr_TARGET_SLAVE_BASE_ADDR" -parent ${Page_0}]
  set_property tooltip {Base address of targeted slave} ${C_m_instr_TARGET_SLAVE_BASE_ADDR}
  set C_m_instr_BURST_LEN [ipgui::add_param $IPINST -name "C_m_instr_BURST_LEN" -parent ${Page_0} -widget comboBox]
  set_property tooltip {Burst Length. Supports 1, 2, 4, 8, 16, 32, 64, 128, 256 burst lengths} ${C_m_instr_BURST_LEN}
  set C_m_instr_ID_WIDTH [ipgui::add_param $IPINST -name "C_m_instr_ID_WIDTH" -parent ${Page_0}]
  set_property tooltip {Thread ID Width} ${C_m_instr_ID_WIDTH}
  set C_m_instr_ADDR_WIDTH [ipgui::add_param $IPINST -name "C_m_instr_ADDR_WIDTH" -parent ${Page_0}]
  set_property tooltip {Width of Address Bus} ${C_m_instr_ADDR_WIDTH}
  set C_m_instr_DATA_WIDTH [ipgui::add_param $IPINST -name "C_m_instr_DATA_WIDTH" -parent ${Page_0} -widget comboBox]
  set_property tooltip {Width of Data Bus} ${C_m_instr_DATA_WIDTH}
  set C_m_instr_AWUSER_WIDTH [ipgui::add_param $IPINST -name "C_m_instr_AWUSER_WIDTH" -parent ${Page_0}]
  set_property tooltip {Width of User Write Address Bus} ${C_m_instr_AWUSER_WIDTH}
  set C_m_instr_ARUSER_WIDTH [ipgui::add_param $IPINST -name "C_m_instr_ARUSER_WIDTH" -parent ${Page_0}]
  set_property tooltip {Width of User Read Address Bus} ${C_m_instr_ARUSER_WIDTH}
  set C_m_instr_WUSER_WIDTH [ipgui::add_param $IPINST -name "C_m_instr_WUSER_WIDTH" -parent ${Page_0}]
  set_property tooltip {Width of User Write Data Bus} ${C_m_instr_WUSER_WIDTH}
  set C_m_instr_RUSER_WIDTH [ipgui::add_param $IPINST -name "C_m_instr_RUSER_WIDTH" -parent ${Page_0}]
  set_property tooltip {Width of User Read Data Bus} ${C_m_instr_RUSER_WIDTH}
  set C_m_instr_BUSER_WIDTH [ipgui::add_param $IPINST -name "C_m_instr_BUSER_WIDTH" -parent ${Page_0}]
  set_property tooltip {Width of User Response Bus} ${C_m_instr_BUSER_WIDTH}
  set C_m_data_TARGET_SLAVE_BASE_ADDR [ipgui::add_param $IPINST -name "C_m_data_TARGET_SLAVE_BASE_ADDR" -parent ${Page_0}]
  set_property tooltip {Base address of targeted slave} ${C_m_data_TARGET_SLAVE_BASE_ADDR}
  set C_m_data_BURST_LEN [ipgui::add_param $IPINST -name "C_m_data_BURST_LEN" -parent ${Page_0} -widget comboBox]
  set_property tooltip {Burst Length. Supports 1, 2, 4, 8, 16, 32, 64, 128, 256 burst lengths} ${C_m_data_BURST_LEN}
  set C_m_data_ID_WIDTH [ipgui::add_param $IPINST -name "C_m_data_ID_WIDTH" -parent ${Page_0}]
  set_property tooltip {Thread ID Width} ${C_m_data_ID_WIDTH}
  set C_m_data_ADDR_WIDTH [ipgui::add_param $IPINST -name "C_m_data_ADDR_WIDTH" -parent ${Page_0}]
  set_property tooltip {Width of Address Bus} ${C_m_data_ADDR_WIDTH}
  set C_m_data_DATA_WIDTH [ipgui::add_param $IPINST -name "C_m_data_DATA_WIDTH" -parent ${Page_0} -widget comboBox]
  set_property tooltip {Width of Data Bus} ${C_m_data_DATA_WIDTH}
  set C_m_data_AWUSER_WIDTH [ipgui::add_param $IPINST -name "C_m_data_AWUSER_WIDTH" -parent ${Page_0}]
  set_property tooltip {Width of User Write Address Bus} ${C_m_data_AWUSER_WIDTH}
  set C_m_data_ARUSER_WIDTH [ipgui::add_param $IPINST -name "C_m_data_ARUSER_WIDTH" -parent ${Page_0}]
  set_property tooltip {Width of User Read Address Bus} ${C_m_data_ARUSER_WIDTH}
  set C_m_data_WUSER_WIDTH [ipgui::add_param $IPINST -name "C_m_data_WUSER_WIDTH" -parent ${Page_0}]
  set_property tooltip {Width of User Write Data Bus} ${C_m_data_WUSER_WIDTH}
  set C_m_data_RUSER_WIDTH [ipgui::add_param $IPINST -name "C_m_data_RUSER_WIDTH" -parent ${Page_0}]
  set_property tooltip {Width of User Read Data Bus} ${C_m_data_RUSER_WIDTH}
  set C_m_data_BUSER_WIDTH [ipgui::add_param $IPINST -name "C_m_data_BUSER_WIDTH" -parent ${Page_0}]
  set_property tooltip {Width of User Response Bus} ${C_m_data_BUSER_WIDTH}


}

proc update_PARAM_VALUE.C_m_instr_TARGET_SLAVE_BASE_ADDR { PARAM_VALUE.C_m_instr_TARGET_SLAVE_BASE_ADDR } {
	# Procedure called to update C_m_instr_TARGET_SLAVE_BASE_ADDR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_m_instr_TARGET_SLAVE_BASE_ADDR { PARAM_VALUE.C_m_instr_TARGET_SLAVE_BASE_ADDR } {
	# Procedure called to validate C_m_instr_TARGET_SLAVE_BASE_ADDR
	return true
}

proc update_PARAM_VALUE.C_m_instr_BURST_LEN { PARAM_VALUE.C_m_instr_BURST_LEN } {
	# Procedure called to update C_m_instr_BURST_LEN when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_m_instr_BURST_LEN { PARAM_VALUE.C_m_instr_BURST_LEN } {
	# Procedure called to validate C_m_instr_BURST_LEN
	return true
}

proc update_PARAM_VALUE.C_m_instr_ID_WIDTH { PARAM_VALUE.C_m_instr_ID_WIDTH } {
	# Procedure called to update C_m_instr_ID_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_m_instr_ID_WIDTH { PARAM_VALUE.C_m_instr_ID_WIDTH } {
	# Procedure called to validate C_m_instr_ID_WIDTH
	return true
}

proc update_PARAM_VALUE.C_m_instr_ADDR_WIDTH { PARAM_VALUE.C_m_instr_ADDR_WIDTH } {
	# Procedure called to update C_m_instr_ADDR_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_m_instr_ADDR_WIDTH { PARAM_VALUE.C_m_instr_ADDR_WIDTH } {
	# Procedure called to validate C_m_instr_ADDR_WIDTH
	return true
}

proc update_PARAM_VALUE.C_m_instr_DATA_WIDTH { PARAM_VALUE.C_m_instr_DATA_WIDTH } {
	# Procedure called to update C_m_instr_DATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_m_instr_DATA_WIDTH { PARAM_VALUE.C_m_instr_DATA_WIDTH } {
	# Procedure called to validate C_m_instr_DATA_WIDTH
	return true
}

proc update_PARAM_VALUE.C_m_instr_AWUSER_WIDTH { PARAM_VALUE.C_m_instr_AWUSER_WIDTH } {
	# Procedure called to update C_m_instr_AWUSER_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_m_instr_AWUSER_WIDTH { PARAM_VALUE.C_m_instr_AWUSER_WIDTH } {
	# Procedure called to validate C_m_instr_AWUSER_WIDTH
	return true
}

proc update_PARAM_VALUE.C_m_instr_ARUSER_WIDTH { PARAM_VALUE.C_m_instr_ARUSER_WIDTH } {
	# Procedure called to update C_m_instr_ARUSER_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_m_instr_ARUSER_WIDTH { PARAM_VALUE.C_m_instr_ARUSER_WIDTH } {
	# Procedure called to validate C_m_instr_ARUSER_WIDTH
	return true
}

proc update_PARAM_VALUE.C_m_instr_WUSER_WIDTH { PARAM_VALUE.C_m_instr_WUSER_WIDTH } {
	# Procedure called to update C_m_instr_WUSER_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_m_instr_WUSER_WIDTH { PARAM_VALUE.C_m_instr_WUSER_WIDTH } {
	# Procedure called to validate C_m_instr_WUSER_WIDTH
	return true
}

proc update_PARAM_VALUE.C_m_instr_RUSER_WIDTH { PARAM_VALUE.C_m_instr_RUSER_WIDTH } {
	# Procedure called to update C_m_instr_RUSER_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_m_instr_RUSER_WIDTH { PARAM_VALUE.C_m_instr_RUSER_WIDTH } {
	# Procedure called to validate C_m_instr_RUSER_WIDTH
	return true
}

proc update_PARAM_VALUE.C_m_instr_BUSER_WIDTH { PARAM_VALUE.C_m_instr_BUSER_WIDTH } {
	# Procedure called to update C_m_instr_BUSER_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_m_instr_BUSER_WIDTH { PARAM_VALUE.C_m_instr_BUSER_WIDTH } {
	# Procedure called to validate C_m_instr_BUSER_WIDTH
	return true
}

proc update_PARAM_VALUE.C_m_data_TARGET_SLAVE_BASE_ADDR { PARAM_VALUE.C_m_data_TARGET_SLAVE_BASE_ADDR } {
	# Procedure called to update C_m_data_TARGET_SLAVE_BASE_ADDR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_m_data_TARGET_SLAVE_BASE_ADDR { PARAM_VALUE.C_m_data_TARGET_SLAVE_BASE_ADDR } {
	# Procedure called to validate C_m_data_TARGET_SLAVE_BASE_ADDR
	return true
}

proc update_PARAM_VALUE.C_m_data_BURST_LEN { PARAM_VALUE.C_m_data_BURST_LEN } {
	# Procedure called to update C_m_data_BURST_LEN when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_m_data_BURST_LEN { PARAM_VALUE.C_m_data_BURST_LEN } {
	# Procedure called to validate C_m_data_BURST_LEN
	return true
}

proc update_PARAM_VALUE.C_m_data_ID_WIDTH { PARAM_VALUE.C_m_data_ID_WIDTH } {
	# Procedure called to update C_m_data_ID_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_m_data_ID_WIDTH { PARAM_VALUE.C_m_data_ID_WIDTH } {
	# Procedure called to validate C_m_data_ID_WIDTH
	return true
}

proc update_PARAM_VALUE.C_m_data_ADDR_WIDTH { PARAM_VALUE.C_m_data_ADDR_WIDTH } {
	# Procedure called to update C_m_data_ADDR_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_m_data_ADDR_WIDTH { PARAM_VALUE.C_m_data_ADDR_WIDTH } {
	# Procedure called to validate C_m_data_ADDR_WIDTH
	return true
}

proc update_PARAM_VALUE.C_m_data_DATA_WIDTH { PARAM_VALUE.C_m_data_DATA_WIDTH } {
	# Procedure called to update C_m_data_DATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_m_data_DATA_WIDTH { PARAM_VALUE.C_m_data_DATA_WIDTH } {
	# Procedure called to validate C_m_data_DATA_WIDTH
	return true
}

proc update_PARAM_VALUE.C_m_data_AWUSER_WIDTH { PARAM_VALUE.C_m_data_AWUSER_WIDTH } {
	# Procedure called to update C_m_data_AWUSER_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_m_data_AWUSER_WIDTH { PARAM_VALUE.C_m_data_AWUSER_WIDTH } {
	# Procedure called to validate C_m_data_AWUSER_WIDTH
	return true
}

proc update_PARAM_VALUE.C_m_data_ARUSER_WIDTH { PARAM_VALUE.C_m_data_ARUSER_WIDTH } {
	# Procedure called to update C_m_data_ARUSER_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_m_data_ARUSER_WIDTH { PARAM_VALUE.C_m_data_ARUSER_WIDTH } {
	# Procedure called to validate C_m_data_ARUSER_WIDTH
	return true
}

proc update_PARAM_VALUE.C_m_data_WUSER_WIDTH { PARAM_VALUE.C_m_data_WUSER_WIDTH } {
	# Procedure called to update C_m_data_WUSER_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_m_data_WUSER_WIDTH { PARAM_VALUE.C_m_data_WUSER_WIDTH } {
	# Procedure called to validate C_m_data_WUSER_WIDTH
	return true
}

proc update_PARAM_VALUE.C_m_data_RUSER_WIDTH { PARAM_VALUE.C_m_data_RUSER_WIDTH } {
	# Procedure called to update C_m_data_RUSER_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_m_data_RUSER_WIDTH { PARAM_VALUE.C_m_data_RUSER_WIDTH } {
	# Procedure called to validate C_m_data_RUSER_WIDTH
	return true
}

proc update_PARAM_VALUE.C_m_data_BUSER_WIDTH { PARAM_VALUE.C_m_data_BUSER_WIDTH } {
	# Procedure called to update C_m_data_BUSER_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_m_data_BUSER_WIDTH { PARAM_VALUE.C_m_data_BUSER_WIDTH } {
	# Procedure called to validate C_m_data_BUSER_WIDTH
	return true
}


proc update_MODELPARAM_VALUE.C_m_instr_TARGET_SLAVE_BASE_ADDR { MODELPARAM_VALUE.C_m_instr_TARGET_SLAVE_BASE_ADDR PARAM_VALUE.C_m_instr_TARGET_SLAVE_BASE_ADDR } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_m_instr_TARGET_SLAVE_BASE_ADDR}] ${MODELPARAM_VALUE.C_m_instr_TARGET_SLAVE_BASE_ADDR}
}

proc update_MODELPARAM_VALUE.C_m_instr_BURST_LEN { MODELPARAM_VALUE.C_m_instr_BURST_LEN PARAM_VALUE.C_m_instr_BURST_LEN } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_m_instr_BURST_LEN}] ${MODELPARAM_VALUE.C_m_instr_BURST_LEN}
}

proc update_MODELPARAM_VALUE.C_m_instr_ID_WIDTH { MODELPARAM_VALUE.C_m_instr_ID_WIDTH PARAM_VALUE.C_m_instr_ID_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_m_instr_ID_WIDTH}] ${MODELPARAM_VALUE.C_m_instr_ID_WIDTH}
}

proc update_MODELPARAM_VALUE.C_m_instr_ADDR_WIDTH { MODELPARAM_VALUE.C_m_instr_ADDR_WIDTH PARAM_VALUE.C_m_instr_ADDR_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_m_instr_ADDR_WIDTH}] ${MODELPARAM_VALUE.C_m_instr_ADDR_WIDTH}
}

proc update_MODELPARAM_VALUE.C_m_instr_DATA_WIDTH { MODELPARAM_VALUE.C_m_instr_DATA_WIDTH PARAM_VALUE.C_m_instr_DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_m_instr_DATA_WIDTH}] ${MODELPARAM_VALUE.C_m_instr_DATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_m_instr_AWUSER_WIDTH { MODELPARAM_VALUE.C_m_instr_AWUSER_WIDTH PARAM_VALUE.C_m_instr_AWUSER_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_m_instr_AWUSER_WIDTH}] ${MODELPARAM_VALUE.C_m_instr_AWUSER_WIDTH}
}

proc update_MODELPARAM_VALUE.C_m_instr_ARUSER_WIDTH { MODELPARAM_VALUE.C_m_instr_ARUSER_WIDTH PARAM_VALUE.C_m_instr_ARUSER_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_m_instr_ARUSER_WIDTH}] ${MODELPARAM_VALUE.C_m_instr_ARUSER_WIDTH}
}

proc update_MODELPARAM_VALUE.C_m_instr_WUSER_WIDTH { MODELPARAM_VALUE.C_m_instr_WUSER_WIDTH PARAM_VALUE.C_m_instr_WUSER_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_m_instr_WUSER_WIDTH}] ${MODELPARAM_VALUE.C_m_instr_WUSER_WIDTH}
}

proc update_MODELPARAM_VALUE.C_m_instr_RUSER_WIDTH { MODELPARAM_VALUE.C_m_instr_RUSER_WIDTH PARAM_VALUE.C_m_instr_RUSER_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_m_instr_RUSER_WIDTH}] ${MODELPARAM_VALUE.C_m_instr_RUSER_WIDTH}
}

proc update_MODELPARAM_VALUE.C_m_instr_BUSER_WIDTH { MODELPARAM_VALUE.C_m_instr_BUSER_WIDTH PARAM_VALUE.C_m_instr_BUSER_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_m_instr_BUSER_WIDTH}] ${MODELPARAM_VALUE.C_m_instr_BUSER_WIDTH}
}

proc update_MODELPARAM_VALUE.C_m_data_TARGET_SLAVE_BASE_ADDR { MODELPARAM_VALUE.C_m_data_TARGET_SLAVE_BASE_ADDR PARAM_VALUE.C_m_data_TARGET_SLAVE_BASE_ADDR } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_m_data_TARGET_SLAVE_BASE_ADDR}] ${MODELPARAM_VALUE.C_m_data_TARGET_SLAVE_BASE_ADDR}
}

proc update_MODELPARAM_VALUE.C_m_data_BURST_LEN { MODELPARAM_VALUE.C_m_data_BURST_LEN PARAM_VALUE.C_m_data_BURST_LEN } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_m_data_BURST_LEN}] ${MODELPARAM_VALUE.C_m_data_BURST_LEN}
}

proc update_MODELPARAM_VALUE.C_m_data_ID_WIDTH { MODELPARAM_VALUE.C_m_data_ID_WIDTH PARAM_VALUE.C_m_data_ID_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_m_data_ID_WIDTH}] ${MODELPARAM_VALUE.C_m_data_ID_WIDTH}
}

proc update_MODELPARAM_VALUE.C_m_data_ADDR_WIDTH { MODELPARAM_VALUE.C_m_data_ADDR_WIDTH PARAM_VALUE.C_m_data_ADDR_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_m_data_ADDR_WIDTH}] ${MODELPARAM_VALUE.C_m_data_ADDR_WIDTH}
}

proc update_MODELPARAM_VALUE.C_m_data_DATA_WIDTH { MODELPARAM_VALUE.C_m_data_DATA_WIDTH PARAM_VALUE.C_m_data_DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_m_data_DATA_WIDTH}] ${MODELPARAM_VALUE.C_m_data_DATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_m_data_AWUSER_WIDTH { MODELPARAM_VALUE.C_m_data_AWUSER_WIDTH PARAM_VALUE.C_m_data_AWUSER_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_m_data_AWUSER_WIDTH}] ${MODELPARAM_VALUE.C_m_data_AWUSER_WIDTH}
}

proc update_MODELPARAM_VALUE.C_m_data_ARUSER_WIDTH { MODELPARAM_VALUE.C_m_data_ARUSER_WIDTH PARAM_VALUE.C_m_data_ARUSER_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_m_data_ARUSER_WIDTH}] ${MODELPARAM_VALUE.C_m_data_ARUSER_WIDTH}
}

proc update_MODELPARAM_VALUE.C_m_data_WUSER_WIDTH { MODELPARAM_VALUE.C_m_data_WUSER_WIDTH PARAM_VALUE.C_m_data_WUSER_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_m_data_WUSER_WIDTH}] ${MODELPARAM_VALUE.C_m_data_WUSER_WIDTH}
}

proc update_MODELPARAM_VALUE.C_m_data_RUSER_WIDTH { MODELPARAM_VALUE.C_m_data_RUSER_WIDTH PARAM_VALUE.C_m_data_RUSER_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_m_data_RUSER_WIDTH}] ${MODELPARAM_VALUE.C_m_data_RUSER_WIDTH}
}

proc update_MODELPARAM_VALUE.C_m_data_BUSER_WIDTH { MODELPARAM_VALUE.C_m_data_BUSER_WIDTH PARAM_VALUE.C_m_data_BUSER_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_m_data_BUSER_WIDTH}] ${MODELPARAM_VALUE.C_m_data_BUSER_WIDTH}
}

