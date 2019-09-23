# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "DATA_ASSOCIATIVITY" -parent ${Page_0}
  ipgui::add_param $IPINST -name "DATA_CACHE_SIZE" -parent ${Page_0}
  ipgui::add_param $IPINST -name "INST_ASSOCIATIVITY" -parent ${Page_0}
  ipgui::add_param $IPINST -name "INST_CACHE_SIZE" -parent ${Page_0}
  ipgui::add_param $IPINST -name "PC_BASE_ADDR" -parent ${Page_0}


}

proc update_PARAM_VALUE.DATA_ASSOCIATIVITY { PARAM_VALUE.DATA_ASSOCIATIVITY } {
	# Procedure called to update DATA_ASSOCIATIVITY when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DATA_ASSOCIATIVITY { PARAM_VALUE.DATA_ASSOCIATIVITY } {
	# Procedure called to validate DATA_ASSOCIATIVITY
	return true
}

proc update_PARAM_VALUE.DATA_CACHE_SIZE { PARAM_VALUE.DATA_CACHE_SIZE } {
	# Procedure called to update DATA_CACHE_SIZE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DATA_CACHE_SIZE { PARAM_VALUE.DATA_CACHE_SIZE } {
	# Procedure called to validate DATA_CACHE_SIZE
	return true
}

proc update_PARAM_VALUE.INST_ASSOCIATIVITY { PARAM_VALUE.INST_ASSOCIATIVITY } {
	# Procedure called to update INST_ASSOCIATIVITY when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.INST_ASSOCIATIVITY { PARAM_VALUE.INST_ASSOCIATIVITY } {
	# Procedure called to validate INST_ASSOCIATIVITY
	return true
}

proc update_PARAM_VALUE.INST_CACHE_SIZE { PARAM_VALUE.INST_CACHE_SIZE } {
	# Procedure called to update INST_CACHE_SIZE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.INST_CACHE_SIZE { PARAM_VALUE.INST_CACHE_SIZE } {
	# Procedure called to validate INST_CACHE_SIZE
	return true
}

proc update_PARAM_VALUE.PC_BASE_ADDR { PARAM_VALUE.PC_BASE_ADDR } {
	# Procedure called to update PC_BASE_ADDR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.PC_BASE_ADDR { PARAM_VALUE.PC_BASE_ADDR } {
	# Procedure called to validate PC_BASE_ADDR
	return true
}


proc update_MODELPARAM_VALUE.PC_BASE_ADDR { MODELPARAM_VALUE.PC_BASE_ADDR PARAM_VALUE.PC_BASE_ADDR } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.PC_BASE_ADDR}] ${MODELPARAM_VALUE.PC_BASE_ADDR}
}

proc update_MODELPARAM_VALUE.INST_CACHE_SIZE { MODELPARAM_VALUE.INST_CACHE_SIZE PARAM_VALUE.INST_CACHE_SIZE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.INST_CACHE_SIZE}] ${MODELPARAM_VALUE.INST_CACHE_SIZE}
}

proc update_MODELPARAM_VALUE.INST_ASSOCIATIVITY { MODELPARAM_VALUE.INST_ASSOCIATIVITY PARAM_VALUE.INST_ASSOCIATIVITY } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.INST_ASSOCIATIVITY}] ${MODELPARAM_VALUE.INST_ASSOCIATIVITY}
}

proc update_MODELPARAM_VALUE.DATA_CACHE_SIZE { MODELPARAM_VALUE.DATA_CACHE_SIZE PARAM_VALUE.DATA_CACHE_SIZE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DATA_CACHE_SIZE}] ${MODELPARAM_VALUE.DATA_CACHE_SIZE}
}

proc update_MODELPARAM_VALUE.DATA_ASSOCIATIVITY { MODELPARAM_VALUE.DATA_ASSOCIATIVITY PARAM_VALUE.DATA_ASSOCIATIVITY } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DATA_ASSOCIATIVITY}] ${MODELPARAM_VALUE.DATA_ASSOCIATIVITY}
}

