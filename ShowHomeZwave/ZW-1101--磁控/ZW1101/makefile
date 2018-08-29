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
COMPILER_FLAGS = -target=SN8P2501D -INI="C:\Sonix\SN8_C_~1.119\Bin\Build\SN8P2600.ini" -PROJECTNAME=".\ZW1101.prj" -WL=3 -Chip_Series=2 -A -g -I.\Include -IC:\Sonix\SN8_C_~1.119\C\include -NoCALLHL -NoMUL -NoHL -NoX -PUSH2 -NoGlobalOpt -tempdir="$(OBJ_PATH)"  -cpp_skip_asm -DICE_Mode=0
GMA_FLAGS = /INI:"SN8P2600.ini" /ID1:0 /ID2:0  /MACHINE:SN8P2501D  /Chip_Series:2 /NOPeephole: /PATH:".\Include" /PROJECTNAME:".\ZW1101.prj" /WL:3 /DEFINE:ICE_Mode=0 /DEFINE:SN8P2501D=1  /OutputPath:"$(OBJ_PATH)" 
LINK_FLAGS = /MACHINE:SN8P2501D /Chip_Series:2 /INI:"SN8P2600.ini" /WL:3 /OutputFile:"$(OUT_PATH)/ZW1101.out"  /MAP:"$(OBJ_PATH)\ZW1101.map"   /LISTFILE:  /STDLIB:".\Obj"    /PATH:"$(LIB_PATH)" /STACK: /PROJECTNAME:".\ZW1101.prj"
CONV_FLAGS = /MACHINE:SN8P2501D /INI:"SN8P2600.ini" /WL:3 /OutputFile:"$(OUT_PATH)/ZW1101.sn8"  /PROJECTNAME:".\ZW1101.prj" /IDSVersion:V1.20.219.119n /Chip_Series:2 /OSLIB:".\Obj"  
LINK_DEP_FILES = $(OBJ_PATH)\main.o $(OBJ_PATH)\mcu_config.o $(OBJ_PATH)\process_com.o $(OBJ_PATH)\process_key.o $(OBJ_PATH)\process_sleep.o $(OBJ_PATH)\system.o   \

# Define Rule
$(OBJ_PATH)\main.asm: .\Src\main.c $(C_INC_PATH)\SN8P2501D.h $(PRJ_PATH)\ZW1101.cfg .\Include\main.h .\Include\system.h .\Include\sn8p2511.h .\Include\mcu_config.h .\Include\process_com.h .\Include\process_key.h .\Include\process_sleep.h
	@$(COMPILER) $(COMPILER_FLAGS) -o $@ $^ 

$(OBJ_PATH)\mcu_config.asm: .\Src\mcu_config.c $(C_INC_PATH)\SN8P2501D.h $(PRJ_PATH)\ZW1101.cfg .\Include\mcu_config.h .\Include\system.h .\Include\sn8p2511.h
	@$(COMPILER) $(COMPILER_FLAGS) -o $@ $^ 

$(OBJ_PATH)\process_com.asm: .\Src\process_com.c $(C_INC_PATH)\SN8P2501D.h $(PRJ_PATH)\ZW1101.cfg .\Include\process_com.h .\Include\system.h .\Include\sn8p2511.h
	@$(COMPILER) $(COMPILER_FLAGS) -o $@ $^ 

$(OBJ_PATH)\process_key.asm: .\Src\process_key.c $(C_INC_PATH)\SN8P2501D.h $(PRJ_PATH)\ZW1101.cfg .\Include\process_key.h .\Include\system.h .\Include\sn8p2511.h
	@$(COMPILER) $(COMPILER_FLAGS) -o $@ $^ 

$(OBJ_PATH)\process_sleep.asm: .\Src\process_sleep.c $(C_INC_PATH)\SN8P2501D.h $(PRJ_PATH)\ZW1101.cfg .\Include\process_sleep.h .\Include\system.h .\Include\sn8p2511.h
	@$(COMPILER) $(COMPILER_FLAGS) -o $@ $^ 

$(OBJ_PATH)\system.asm: .\Src\system.c $(C_INC_PATH)\SN8P2501D.h $(PRJ_PATH)\ZW1101.cfg .\Include\system.h .\Include\sn8p2511.h
	@$(COMPILER) $(COMPILER_FLAGS) -o $@ $^ 

$(OBJ_PATH)\main.o: $(OBJ_PATH)\main.asm $(PRJ_PATH)\ZW1101.cfg
	@$(GMA) $(GMA_FLAGS) /CSource: /CASE: $< 

$(OBJ_PATH)\mcu_config.o: $(OBJ_PATH)\mcu_config.asm $(PRJ_PATH)\ZW1101.cfg
	@$(GMA) $(GMA_FLAGS) /CSource: /CASE: $< 

$(OBJ_PATH)\process_com.o: $(OBJ_PATH)\process_com.asm $(PRJ_PATH)\ZW1101.cfg
	@$(GMA) $(GMA_FLAGS) /CSource: /CASE: $< 

$(OBJ_PATH)\process_key.o: $(OBJ_PATH)\process_key.asm $(PRJ_PATH)\ZW1101.cfg
	@$(GMA) $(GMA_FLAGS) /CSource: /CASE: $< 

$(OBJ_PATH)\process_sleep.o: $(OBJ_PATH)\process_sleep.asm $(PRJ_PATH)\ZW1101.cfg
	@$(GMA) $(GMA_FLAGS) /CSource: /CASE: $< 

$(OBJ_PATH)\system.o: $(OBJ_PATH)\system.asm $(PRJ_PATH)\ZW1101.cfg
	@$(GMA) $(GMA_FLAGS) /CSource: /CASE: $< 

$(OUT_PATH)\ZW1101.out: $(LINK_DEP_FILES) $(PRJ_PATH)\ZW1101.cop
	@$(LINKER) $(LINK_FLAGS) /CSource: /CASE: $(LINK_DEP_FILES) 

$(OUT_PATH)\ZW1101.sn8: $(OUT_PATH)\ZW1101.out $(PRJ_PATH)\ZW1101.cop
	@$(CONVERT) $(CONV_FLAGS) $^ 


# Define Clean Rule
Clean:
	@del /F /Q $(OBJ_PATH)\*.*;
	@if EXIST .\ZW1101.prj.stb del .\ZW1101.prj.stb;
	@if EXIST .\ZW1101.out del .\ZW1101.out;
	@if EXIST .\ZW1101.sn8 del .\ZW1101.sn8;
	@if EXIST .\ZW1101.sn8.dep del .\ZW1101.sn8.dep;
	@if EXIST $(OUT_PATH)\ZW1101.out del $(OUT_PATH)\ZW1101.out;
	@if EXIST $(OUT_PATH)\ZW1101.sn8 del $(OUT_PATH)\ZW1101.sn8;
	@if EXIST $(OUT_PATH)\ZW1101.sn8.dep del $(OUT_PATH)\ZW1101.sn8.dep;

# Don't keep invalid files, command line must return non-zero(1 or 2) value 
# to validate delete on error mechanism 
# else return 0 for success

.DELETE_ON_ERROR:

Begin: 

Build: Begin All 

Rebuild: Clean Build 

All:$(OUT_PATH)\ZW1101.out $(OUT_PATH)\ZW1101.sn8
