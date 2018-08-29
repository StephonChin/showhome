/**********************
*author:chenyk
*data:201411.22
***********************/
#include "time.h"

/*********************
*name:void tc0_init(void)
*function:initialization tc0
*input:no
*output:no
*modification:
**********************/
void tc0_init(void)
{
  T0M=0x40;       
  T0C=206;          //(256-6)*(16/(16/£¨4/1000£©))US=1S

  FT0ENB=1;   
 
  FT0IEN=1; 
  FGIE=1; 

}