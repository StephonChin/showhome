#stop cpu
halt

#load program eflash code
#load_image d:/Temp/ppc4601_eflash.elf

#start program
#eflash d:/Temp/ftd2xx.h 0x00001000 0x00100000 0x00008000 2048

#verify_image D:/Temp/ftd2xx.h 0x00100000



core_reset

load_image F:/C0_workspace/eFlash/Eflash_pmg.elf

eflash F:/C0_workspace/TEST1/Debug/TEST1.bin 0x00800000 0x00000000 0x00800400 2560 0x00800E00

resume
