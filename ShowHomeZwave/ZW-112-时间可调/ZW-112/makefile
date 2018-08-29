# SONIX DSP Makefile Version:1.0.0.2
# Defination
COMPILER = "c:\sonix\SN8_C_~1.119\bin\build\sn8pc.exe"
GMA = "C:\Sonix\SN8_C_~1.119\Bin\Build\gma.exe"
LINKER = "C:\Sonix\SN8_C_~1.119\Bin\Build\slink.exe"
CONVERT = "C:\Sonix\SN8_C_~1.119\Bin\Build\RcvSN8.exe"

# Define Path Macro
PRJ_PATH=.
OBJ_PATH=.\Obj
INC_PATH=.\Include
LIB_PATH=.\Lib
C_INC_PATH=C:\Sonix\SN8_C_~1.119\C\include
OUT_PATH=.\Bin
VPATH=.\:$(OBJ_PATH):$(LIB_PATH):$(INC_PATH):$(C_INC_PATH):$(OUT_PATH)

# Define Option Flags
COMPILER_FLAGS = -target=SN8P2711B -INI="C:\Sonix\SN8_C_~1.119\Bin\Build\SN8P2700A.ini" -PROJECTNAME=".\ZW-112.prj" -WL=3 -Chip_Series=2 -A -g -I.\Include -IC:\Sonix\SN8_C_~1.119\C\include -NoCALLHL -NoMUL -NoHL -NoX -PUSH2 -NoGlobalOpt -tempdir="$(OBJ_PATH)"  -cpp_skip_asm -DICE_Mode=0
GMA_FLAGS = /INI:"SN8P2700A.ini" /ID1:0 /ID2:0  /MACHINE:SN8P2711B  /Chip_Series:2 /NOPeephole: /PATH:".\Include" /PROJECTNAME:".\ZW-112.prj" /WL:3 /DEFINE:ICE_Mode=0 /DEFINE:SN8P2711B=1  /OutputPath:"$(OBJ_PATH)" 
LINK_FLAGS = /MACHINE:SN8P2711B /Chip_Series:2 /INI:"SN8P2700A.ini" /WL:3 /OutputFile:"$(OUT_PATH)/ZW-112.out"  /MAP:"$(OBJ_PATH)\ZW-112.map"   /LISTFILE:  /STDLIB:".\Obj"    /PATH:"$(LIB_PATH)" /STACK: /PROJECTNAME:".\ZW-112.prj"
CONV_FLAGS = /MACHINE:SN8P2711B /INI:"SN8P2700A.ini" /WL:3 /OutputFile:"$(OUT_PATH)/ZW-112.sn8"  /PROJECTNAME:".\ZW-112.prj" /IDSVersion:V1.20.219.119n /Chip_Series:2 /OSLIB:".\Obj"  
LINK_DEP_FILES = $(OBJ_PATH)\main.o $(OBJ_PATH)\system.o $(OBJ_PATH)\key_scan.o $(OBJ_PATH)\single_output.o $(OBJ_PATH)\mcu_config.o $(OBJ_PATH)\ad_scan.o   \

# Define Rule
$(OBJ_PATH)\ad_scan.asm: .\Src\ad_scan.c $(C_INC_PATH)\SN8P2711B.h $(PRJ_PATH)\ZW-112.cfg .\Include\ad_scan.h .\Include\system.h
	@$(COMPILER) $(COMPILER_FLAGS) -o $@ $^ 

$(OBJ_PATH)\key_scan.asm: .\Src\key_scan.c $(C_INC_PATH)\SN8P2711B.h $(PRJ_PATH)\ZW-112.cfg .\Include\key_scan.h .\Include\system.h
	@$(COMPILER) $(COMPILER_FLAGS) -o $@ $^ 

$(OBJ_PATH)\main.asm: .\Src\main.c $(C_INC_PATH)\SN8P2711B.h $(PRJ_PATH)\ZW-112.cfg .\Include\main.h .\Include\system.h .\Include\key_scan.h .\Include\mcu_config.h .\Include\single_output.h .\Include\ad_scan.h
	@$(COMPILER) $(COMPILER_FLAGS) -o $@ $^ 

$(OBJ_PATH)\mcu_config.asm: .\Src\mcu_config.c $(C_INC_PATH)\SN8P2711B.h $(PRJ_PATH)\ZW-112.cfg .\Include\mcu_config.h .\Include\system.h
	@$(COMPILER) $(COMPILER_FLAGS) -o $@ $^ 

$(OBJ_PATH)\single_output.asm: .\Src\single_output.c $(C_INC_PATH)\SN8P2711B.h $(PRJ_PATH)\ZW-112.cfg .\Include\single_output.h .\Include\system.h
	@$(COMPILER) $(COMPILER_FLAGS) -o $@ $^ 

$(OBJ_PATH)\system.asm: .\Src\system.c $(C_INC_PATH)\SN8P2711B.h $(PRJ_PATH)\ZW-112.cfg .\Include\system.h
	@$(COMPILER) $(COMPILER_FLAGS) -o $@ $^ 

$(OBJ_PATH)\ad_scan.o: $(OBJ_PATH)\ad_scan.asm $(PRJ_PATH)\ZW-112.cfg
	@$(GMA) $(GMA_FLAGS) /CSource: /CASE: $< 

$(OBJ_PATH)\key_scan.o: $(OBJ_PATH)\key_scan.asm $(PRJ_PATH)\ZW-112.cfg
	@$(GMA) $(GMA_FLAGS) /CSource: /CASE: $< 

$(OBJ_PATH)\main.o: $(OBJ_PATH)\main.asm $(PRJ_PATH)\ZW-112.cfg
	@$(GMA) $(GMA_FLAGS) /CSource: /CASE: $< 

$(OBJ_PATH)\mcu_config.o: $(OBJ_PATH)\mcu_config.asm $(PRJ_PATH)\ZW-112.cfg
	@$(GMA) $(GMA_FLAGS) /CSource: /CASE: $< 

$(OBJ_PATH)\single_output.o: $(OBJ_PATH)\single_output.asm $(PRJ_PATH)\ZW-112.cfg
	@$(GMA) $(GMA_FLAGS) /CSource: /CASE: $< 

$(OBJ_PATH)\system.o: $(OBJ_PATH)\system.asm $(PRJ_PATH)\ZW-112.cfg
	@$(GMA) $(GMA_FLAGS) /CSource: /CASE: $< 

$(OUT_PATH)\ZW-112.out: $(LINK_DEP_FILES) $(PRJ_PATH)\ZW-112.cop
	@$(LINKER) $(LINK_FLAGS) /CSource: /CASE: $(LINK_DEP_FILES) 

$(OUT_PATH)\ZW-112.sn8: $(OUT_PATH)\ZW-112.out $(PRJ_PATH)\ZW-112.cop
	@$(CONVERT) $(CONV_FLAGS) $^ 


# Define Clean Rule
Clean:
	@del /F /Q $(OBJ_PATH)\*.*;
	@if EXIST .\ZW-112.prj.stb del .\ZW-112.prj.stb;
	@if EXIST .\ZW-112.out del .\ZW-112.out;
	@if EXIST .\ZW-112.sn8 del .\ZW-112.sn8;
	@if EXIST .\ZW-112.sn8.dep del .\ZW-112.sn8.dep;
	@if EXIST $(OUT_PATH)\ZW-112.out del $(OUT_PATH)\ZW-112.out;
	@if EXIST $(OUT_PATH)\ZW-112.sn8 del $(OUT_PATH)\ZW-112.sn8;
	@if EXIST $(OUT_PATH)\ZW-112.sn8.dep del $(OUT_PATH)\ZW-112.sn8.dep;

# Don't keep invalid files, command line must return non-zero(1 or 2) value 
# to validate delete on error mechanism 
# else return 0 for success

.DELETE_ON_ERROR:

Begin: 

Build: Begin All 

Rebuild: Clean Build 

All:$(OUT_PATH)\ZW-112.out $(OUT_PATH)\ZW-112.sn8
