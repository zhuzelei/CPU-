# 
# Synthesis run script generated by Vivado
# 

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a35tcpg236-1

set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir D:/vivado/Mul_CPU_test/Mul_CPU_test.cache/wt [current_project]
set_property parent.project_path D:/vivado/Mul_CPU_test/Mul_CPU_test.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property vhdl_version vhdl_2k [current_fileset]
read_verilog -library xil_defaultlib {
  D:/vivado/Mul_CPU_test/Mul_CPU_test.srcs/sources_1/new/OutputFunc.v
  D:/vivado/Mul_CPU_test/Mul_CPU_test.srcs/sources_1/new/NextState.v
  D:/vivado/Mul_CPU_test/Mul_CPU_test.srcs/sources_1/new/DFlipFlop.v
  D:/vivado/Mul_CPU_test/Mul_CPU_test.srcs/sources_1/new/PCAddFour.v
  D:/vivado/Mul_CPU_test/Mul_CPU_test.srcs/sources_1/new/DataSelector_2to1.v
  D:/vivado/Mul_CPU_test/Mul_CPU_test.srcs/sources_1/new/SignExtend.v
  D:/vivado/Mul_CPU_test/Mul_CPU_test.srcs/sources_1/new/InstructionMEM.v
  D:/vivado/Mul_CPU_test/Mul_CPU_test.srcs/sources_1/new/PCAddImm.v
  D:/vivado/Mul_CPU_test/Mul_CPU_test.srcs/sources_1/new/BDR.v
  D:/vivado/Mul_CPU_test/Mul_CPU_test.srcs/sources_1/new/IR.v
  D:/vivado/Mul_CPU_test/Mul_CPU_test.srcs/sources_1/new/ControlUnit.v
  D:/vivado/Mul_CPU_test/Mul_CPU_test.srcs/sources_1/new/PC.v
  D:/vivado/Mul_CPU_test/Mul_CPU_test.srcs/sources_1/new/ALUoutDR.v
  D:/vivado/Mul_CPU_test/Mul_CPU_test.srcs/sources_1/new/RegFile.v
  D:/vivado/Mul_CPU_test/Mul_CPU_test.srcs/sources_1/new/PCJump.v
  D:/vivado/Mul_CPU_test/Mul_CPU_test.srcs/sources_1/new/DBDR.v
  D:/vivado/Mul_CPU_test/Mul_CPU_test.srcs/sources_1/new/DataSelector_4to1.v
  D:/vivado/Mul_CPU_test/Mul_CPU_test.srcs/sources_1/new/DataSelector_3to1.v
  D:/vivado/Mul_CPU_test/Mul_CPU_test.srcs/sources_1/new/ALU.v
  D:/vivado/Mul_CPU_test/Mul_CPU_test.srcs/sources_1/new/DataMEM.v
  D:/vivado/Mul_CPU_test/Mul_CPU_test.srcs/sources_1/new/ADR.v
  D:/vivado/Mul_CPU_test/Mul_CPU_test.srcs/sources_1/new/DataSelector_2to1_sa.v
  D:/vivado/Mul_CPU_test/Mul_CPU_test.srcs/sources_1/new/Main.v
}
synth_design -top Main -part xc7a35tcpg236-1
write_checkpoint -noxdef Main.dcp
catch { report_utilization -file Main_utilization_synth.rpt -pb Main_utilization_synth.pb }
