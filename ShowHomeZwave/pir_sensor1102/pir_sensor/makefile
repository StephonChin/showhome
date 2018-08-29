# SONIX DSP Makefile Version:1.0.0.2
# Defination
COMPILER = "d:\ËÉº²·Â~1\bin\build\sn8pc.exe"
GMA = "D:\ËÉº²·Â~1\Bin\Build\gma.exe"
LINKER = "D:\ËÉº²·Â~1\Bin\Build\slink.exe"
CONVERT = "D:\ËÉº²·Â~1\Bin\Build\RcvSN8.exe"

# Define Path Macro
PRJ_PATH=.
OBJ_PATH=.\Obj
INC_PATH=.\Include
LIB_PATH=.\Lib
C_INC_PATH=D:\ËÉº²·Â~1\C\include
OUT_PATH=.\Bin
VPATH=.\:$(OBJ_PATH):$(LIB_PATH):$(INC_PATH):$(C_INC_PATH):$(OUT_PATH)

# Define Option Flags
COMPILER_FLAGS = -target=SN8P2511 -INI="D:\ËÉº²·Â~1\Bin\Build\SN8P2600.ini" -PROJECTNAME=".\pir_sensor.prj" -WL=3 -Chip_Series=2 -A -g -I.\Include -ID:\ËÉº²·Â~1\C\include -NoCALLHL -NoMUL -NoHL -NoX -PUSH2 -NoGlobalOpt -tempdir="$(OBJ_PATH)"  -cpp_skip_asm -DICE_Mode=0
GMA_FLAGS = /INI:"SN8P2600.ini" /ID1:0 /ID2:0  /MACHINE:SN8P2511  /Chip_Series:2 /NOPeephole: /PATH:".\Include" /PROJECTNAME:".\pir_sensor.prj" /WL:3 /DEFINE:ICE_Mode=0 /DEFINE:SN8P2511=1  /OutputPath:"$(OBJ_PATH)" 
LINK_FLAGS = /MACHINE:SN8P2511 /Chip_Series:2 /INI:"SN8P2600.ini" /WL:3 /OutputFile:"$(OUT_PATH)/pir_sensor.out"  /MAP:"$(OBJ_PATH)\pir_sensor.map"   /LISTFILE:  /STDLIB:".\Obj"    /PATH:"$(LIB_PATH)" /STACK: /PROJECTNAME:".\pir_sensor.prj"
CONV_FLAGS = /MACHINE:SN8P2511 /INI:"SN8P2600.ini" /WL:3 /OutputFile:"$(OUT_PATH)/pir_sensor.sn8"  /PROJECTNAME:".\pir_sensor.prj" /IDSVersion:V1.20.219.096n /Chip_Series:2 /OSLIB:".\Obj"  
LINK_DEP_FILES = $(OBJ_PATH)\main.o   \

# Define Rule
$(OBJ_PATH)\main.asm: .\Src\main.c $(C_INC_PATH)\SN8P2511.h $(PRJ_PATH)\pir_sensor.cfg
	@$(COMPILER) $(COMPILER_FLAGS) -o $@ $^ 

$(OBJ_PATH)\main.o: $(OBJ_PATH)\main.asm $(PRJ_PATH)\pir_sensor.cfg
	@$(GMA) $(GMA_FLAGS) /CSource: /CASE: $< 

$(OUT_PATH)\pir_sensor.out: $(LINK_DEP_FILES) $(PRJ_PATH)\pir_sensor.cop
	@$(LINKER) $(LINK_FLAGS) /CSource: /CASE: $(LINK_DEP_FILES) 

$(OUT_PATH)\pir_sensor.sn8: $(OUT_PATH)\pir_sensor.out $(PRJ_PATH)\pir_sensor.cop
	@$(CONVERT) $(CONV_FLAGS) $^ 


# Define Clean Rule
Clean:
	@del /F /Q $(OBJ_PATH)\*.*;
	@if EXIST .\pir_sensor.prj.stb del .\pir_sensor.prj.stb;
	@if EXIST .\pir_sensor.out del .\pir_sensor.out;
	@if EXIST .\pir_sensor.sn8 del .\pir_sensor.sn8;
	@if EXIST .\pir_sensor.sn8.dep del .\pir_sensor.sn8.dep;
	@if EXIST $(OUT_PATH)\pir_sensor.out del $(OUT_PATH)\pir_sensor.out;
	@if EXIST $(OUT_PATH)\pir_sensor.sn8 del $(OUT_PATH)\pir_sensor.sn8;
	@if EXIST $(OUT_PATH)\pir_sensor.sn8.dep del $(OUT_PATH)\pir_sensor.sn8.dep;

# Don't keep invalid files, command line must return non-zero(1 or 2) value 
# to validate delete on error mechanism 
# else return 0 for success

.DELETE_ON_ERROR:

Begin: 

Build: Begin All 

Rebuild: Clean Build 

All:$(OUT_PATH)\pir_sensor.out $(OUT_PATH)\pir_sensor.sn8
