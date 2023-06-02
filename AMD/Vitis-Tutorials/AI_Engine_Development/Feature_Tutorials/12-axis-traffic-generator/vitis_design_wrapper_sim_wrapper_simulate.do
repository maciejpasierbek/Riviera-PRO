#############################################################################################
#
# File name : vitis_design_wrapper_sim_wrapper_simulate.do
# Created on: Tue May 16 11:18:56 CEST 2023
#
# Script automatically generated by Aldec Tcl Store app 1.28 for 'behavioral' simulation,
# in Vivado v2022.1 (64-bit) for Riviera-PRO simulator.
#
#############################################################################################
transcript off
onbreak {quit -force}
onerror {quit -force}

transcript on
asim +access +r +m+vitis_design_wrapper_sim_wrapper -L unisims_ver -L unimacro_ver -L secureip -L xpm -L xil_defaultlib -L axi_lite_ipif_v3_0_4 -L axi_intc_v4_1_17 -L xlconcat_v2_1_4 -L lib_cdc_v1_0_2 -L proc_sys_reset_v5_0_13 -L xilinx_vip -O5 +access +r xil_defaultlib.vitis_design_wrapper_sim_wrapper xil_defaultlib.glbl

###################### asim for Code Coverage ####################################
#asim +access +r +m+vitis_design_wrapper_sim_wrapper -L unisims_ver -L unimacro_ver -L secureip -L xpm -L xil_defaultlib -L axi_lite_ipif_v3_0_4 -L axi_intc_v4_1_17 -L xlconcat_v2_1_4 -L lib_cdc_v1_0_2 -L proc_sys_reset_v5_0_13 -L xilinx_vip -O5 +access +r -acdb -acdb_file code_coverage.acdb -cc_all xil_defaultlib.vitis_design_wrapper_sim_wrapper xil_defaultlib.glbl

if { [file exists vitis_params.tcl] } {
  source vitis_params.tcl
}
if { [info exists ::env(USER_PRE_SIM_SCRIPT)] } {
  if { [catch {source $::env(USER_PRE_SIM_SCRIPT)} msg] } {
    puts $msg
  }
}

if { ![batch_mode] } {
	wave -vgroup "CIPS" -rec sim:/vitis_design_wrapper_sim_wrapper/vitis_design_wrapper_i/vitis_design_i/CIPS_0/*
	wave -vgroup "CIPS_NOC" -rec sim:/vitis_design_wrapper_sim_wrapper/vitis_design_wrapper_i/vitis_design_i/cips_noc/*
	wave -vgroup "DDR4" -rec sim:/vitis_design_wrapper_sim_wrapper/vitis_design_wrapper_i/vitis_design_i/noc_ddr4/*
} else {
	log *
}



puts "We are running simulator for infinite time. Added some default signals in the waveform. You can pause simulation and add signals and then resume the simulation again."
puts "Stopping at breakpoint in simulator also stops the host code execution"
if { [info exists ::env(VITIS_LAUNCH_WAVEFORM_GUI) ] } {
  run 1ns
} else {
  run -all
}



if { [info exists ::env(VITIS_LAUNCH_WAVEFORM_BATCH) ] } {
  if { [info exists ::env(USER_POST_SIM_SCRIPT) ] } {
    if { [catch {source $::env(USER_POST_SIM_SCRIPT)} msg] } {
      puts $msg
    }
  }
}
if { [batch_mode] } {
  endsim
  ###################### Code Coverage and generating .html reports ####################################
  #acdb report -noinfo -db code_coverage.acdb -replace_path <Example_path>/12-axis-traffic-generator <Example_path>/12-axis-traffic-generator/_x/link/vivado/vpl/prj -html -o code_coverage_report.html  
  
  quit -force
}
