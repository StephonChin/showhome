# SONIX DSP Makefile Version:1.0.0.2
# Defination
COMPILER = "c:\sonix\SN8_C_~1.209\bin\build\sn8pc.exe"
GMA = "C:\Sonix\SN8_C_~1.209\Bin\Build\gma.exe"
LINKER = "C:\Sonix\SN8_C_~1.209\Bin\Build\slink.exe"
CONVERT = "C:\Sonix\SN8_C_~1.209\Bin\Build\RcvSN8.exe"

# Define Path Macro
PRJ_PATH=.
OBJ_PATH=.\Obj
INC_PATH=.\Include
LIB_PATH=.\Lib
C_INC_PATH=C:\Sonix\SN8_C_~1.209\C\include
OUT_PATH=.\Bin
VPATH=.\:$(OBJ_PATH):$(LIB_PATH):$(INC_PATH):$(C_INC_PATH):$(OUT_PATH)

# Define Option Flags
COMPILER_FLAGS = -target=SN8P2501D -INI="C:\Sonix\SN8_C_~1.209\Bin\Build\SN8P2600.ini" -PROJECTNAME=".\DT50.prj" -WL=3 -Chip_Series=2 -A -g -I.\Include -IC:\Sonix\SN8_C_~1.209\C\include -NoCALLHL -NoMUL -NoHL -NoX -PUSH2 -NoGlobalOpt -tempdir="$(OBJ_PATH)"  -cpp_skip_asm -DICE_Mode=0
GMA_FLAGS = /INI:"SN8P2600.ini" /ID1:0 /ID2:0  /MACHINE:SN8P2501D  /Chip_Series:2 /NOPeephole: /PATH:".\Include" /PROJECTNAME:".\DT50.prj" /WL:3 /DEFINE:ICE_Mode=0 /DEFINE:SN8P2501D=1  /OutputPath:"$(OBJ_PATH)" 
LINK_FLAGS = /MACHINE:SN8P2501D /Chip_Series:2 /INI:"SN8P2600.ini" /WL:3 /OutputFile:"$(OUT_PATH)/DT50.out"  /MAP:"$(OBJ_PATH)\DT50.map"   /LISTFILE:  /STDLIB:".\Obj"    /PATH:"$(LIB_PATH)" /STACK: /PROJECTNAME:".\DT50.prj"
CONV_FLAGS = /MACHINE:SN8P2501D /INI:"SN8P2600.ini" /WL:3 /OutputFile:"$(OUT_PATH)/DT50.sn8"  /PROJECTNAME:".\DT50.prj" /IDSVersion:V1.20.219.209n /Chip_Series:2 /OSLIB:".\Obj"  
LINK_DEP_FILES = $(OBJ_PATH)\main.o $(OBJ_PATH)\mcu_init.o $(OBJ_PATH)\key.o $(OBJ_PATH)\led.o $(OBJ_PATH)\power_save.o $(OBJ_PATH)\beep.o   \

# Define Rule
$(OBJ_PATH)\beep.asm: .\Src\beep.c $(C_INC_PATH)\SN8P2501D.h $(PRJ_PATH)\DT50.cfg .\Include\beep.h .\Include\sn8p2511.h .\Include\key.h
	@$(COMPILER) $(COMPILER_FLAGS) -o $@ $^ 

$(OBJ_PATH)\key.asm: .\Src\key.c $(C_INC_PATH)\SN8P2501D.h $(PRJ_PATH)\DT50.cfg .\Include\key.h .\Include\sn8p2511.h
	@$(COMPILER) $(COMPILER_FLAGS) -o $@ $^ 

$(OBJ_PATH)\led.asm: .\Src\led.c $(C_INC_PATH)\SN8P2501D.h $(PRJ_PATH)\DT50.cfg .\Include\led.h .\Include\sn8p2511.h
	@$(COMPILER) $(COMPILER_FLAGS) -o $@ $^ 

$(OBJ_PATH)\main.asm: .\Src\main.c $(C_INC_PATH)\SN8P2501D.h $(PRJ_PATH)\DT50.cfg .\Include\main.h .\Include\sn8p2511.h .\Include\beep.h .\Include\key.h
	@$(COMPILER) $(COMPILER_FLAGS) -o $@ $^ 

$(OBJ_PATH)\mcu_init.asm: .\Src\mcu_init.c $(C_INC_PATH)\SN8P2501D.h $(PRJ_PATH)\DT50.cfg .\Include\mcu_init.h .\Include\sn8p2511.h
	@$(COMPILER) $(COMPILER_FLAGS) -o $@ $^ 

$(OBJ_PATH)\power_save.asm: .\Src\power_save.c $(C_INC_PATH)\SN8P2501D.h $(PRJ_PATH)\DT50.cfg .\Include\power_save.h .\Include\sn8p2511.h
	@$(COMPILER) $(COMPILER_FLAGS) -o $@ $^ 

$(OBJ_PATH)\beep.o: $(OBJ_PATH)\beep.asm $(PRJ_PATH)\DT50.cfg
	@$(GMA) $(GMA_FLAGS) /CSource: /CASE: $< 

$(OBJ_PATH)\key.o: $(OBJ_PATH)\key.asm $(PRJ_PATH)\DT50.cfg
	@$(GMA) $(GMA_FLAGS) /CSource: /CASE: $< 

$(OBJ_PATH)\led.o: $(OBJ_PATH)\led.asm $(PRJ_PATH)\DT50.cfg
	@$(GMA) $(GMA_FLAGS) /CSource: /CASE: $< 

$(OBJ_PATH)\main.o: $(OBJ_PATH)\main.asm $(PRJ_PATH)\DT50.cfg
	@$(GMA) $(GMA_FLAGS) /CSource: /CASE: $< 

$(OBJ_PATH)\mcu_init.o: $(OBJ_PATH)\mcu_init.asm $(PRJ_PATH)\DT50.cfg
	@$(GMA) $(GMA_FLAGS) /CSource: /CASE: $< 

$(OBJ_PATH)\power_save.o: $(OBJ_PATH)\power_save.asm $(PRJ_PATH)\DT50.cfg
	@$(GMA) $(GMA_FLAGS) /CSource: /CASE: $< 

$(OUT_PATH)\DT50.out: $(LINK_DEP_FILES) $(PRJ_PATH)\DT50.cop
	@$(LINKER) $(LINK_FLAGS) /CSource: /CASE: $(LINK_DEP_FILES) 

$(OUT_PATH)\DT50.sn8: $(OUT_PATH)\DT50.out $(PRJ_PATH)\DT50.cop
	@$(CONVERT) $(CONV_FLAGS) $^ 


# Define Clean Rule
Clean:
	@del /F /Q $(OBJ_PATH)\*.*;
	@if EXIST .\DT50.prj.stb del .\DT50.prj.stb;
	@if EXIST .\DT50.out del .\DT50.out;
	@if EXIST .\DT50.sn8 del .\DT50.sn8;
	@if EXIST .\DT50.sn8.dep del .\DT50.sn8.dep;
	@if EXIST $(OUT_PATH)\DT50.out del $(OUT_PATH)\DT50.out;
	@if EXIST $(OUT_PATH)\DT50.sn8 del $(OUT_PATH)\DT50.sn8;
	@if EXIST $(OUT_PATH)\DT50.sn8.dep del $(OUT_PATH)\DT50.sn8.dep;

# Don't keep invalid files, command line must return non-zero(1 or 2) value 
# to validate delete on error mechanism 
# else return 0 for success

.DELETE_ON_ERROR:

Begin: 

Build: Begin All 

Rebuild: Clean Build 

All:$(OUT_PATH)\DT50.out $(OUT_PATH)\DT50.sn8
