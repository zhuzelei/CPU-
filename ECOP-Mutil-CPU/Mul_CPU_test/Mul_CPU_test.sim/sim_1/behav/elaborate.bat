@echo off
set xv_path=D:\\Xilinx\\Vivado\\2015.3\\bin
call %xv_path%/xelab  -wto b671d3b3ca014f1aa104d2114834e438 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot cpu_sim_behav xil_defaultlib.cpu_sim xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
