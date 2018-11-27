# 
# Synthesis run script generated by Vivado
# 

set_param xicom.use_bs_reader 1
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a35tcpg236-1

set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir D:/vivado/Single_CPU_3/Single_CPU_3.cache/wt [current_project]
set_property parent.project_path D:/vivado/Single_CPU_3/Single_CPU_3.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property vhdl_version vhdl_2k [current_fileset]
read_verilog -library xil_defaultlib {
  D:/vivado/Single_CPU_3/Single_CPU_3.srcs/sources_1/new/signZE.v
  D:/vivado/Single_CPU_3/Single_CPU_3.srcs/sources_1/new/ChsePC.v
  D:/vivado/Single_CPU_3/Single_CPU_3.srcs/sources_1/new/MUL32.v
  D:/vivado/Single_CPU_3/Single_CPU_3.srcs/sources_1/new/regFILE.v
  D:/vivado/Single_CPU_3/Single_CPU_3.srcs/sources_1/new/showwhat.v
  D:/vivado/Single_CPU_3/Single_CPU_3.srcs/sources_1/new/shaomiao.v
  D:/vivado/Single_CPU_3/Single_CPU_3.srcs/sources_1/new/ALU.v
  D:/vivado/Single_CPU_3/Single_CPU_3.srcs/sources_1/new/SegLED7.v
  D:/vivado/Single_CPU_3/Single_CPU_3.srcs/sources_1/new/Datamemory.v
  D:/vivado/Single_CPU_3/Single_CPU_3.srcs/sources_1/new/fnshow.v
  D:/vivado/Single_CPU_3/Single_CPU_3.srcs/sources_1/new/clock_div.v
  D:/vivado/Single_CPU_3/Single_CPU_3.srcs/sources_1/new/PC.v
  D:/vivado/Single_CPU_3/Single_CPU_3.srcs/sources_1/new/insmemory.v
  D:/vivado/Single_CPU_3/Single_CPU_3.srcs/sources_1/new/MUL5.v
  D:/vivado/Single_CPU_3/Single_CPU_3.srcs/sources_1/new/ControlUnit1.v
  D:/vivado/Single_CPU_3/Single_CPU_3.srcs/sources_1/new/SingleCPU.v
}
read_xdc D:/vivado/Single_CPU_3/Single_CPU_3.srcs/constrs_1/new/CPU_IO.xdc
set_property used_in_implementation false [get_files D:/vivado/Single_CPU_3/Single_CPU_3.srcs/constrs_1/new/CPU_IO.xdc]

synth_design -top SingleCPU -part xc7a35tcpg236-1
write_checkpoint -noxdef SingleCPU.dcp
catch { report_utilization -file SingleCPU_utilization_synth.rpt -pb SingleCPU_utilization_synth.pb }