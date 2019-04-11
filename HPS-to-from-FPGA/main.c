#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/mman.h>
#include "hwlib.h"
#include "socal/socal.h"
#include "socal/hps.h"
#include "socal/alt_gpio.h"
#include "hps_0.h"

#define REG_BASE 0xFF200000
#define REG_SPAN 0x00200000

void* virtual_base;
void* led_addr;
void* sw_addr;
int fd;
int switches;
bool flag = true;
int num1 = 2;
int num2 = 4;

int main (){
fd=open("/dev/mem",(O_RDWR|O_SYNC));
virtual_base=mmap(NULL,REG_SPAN,(PROT_READ|PROT_WRITE),MAP_SHARED,fd,REG_BASE);
sw_addr=virtual_base+SW_BASE;
led_addr=virtual_base+LEDR_BASE;

while(1){
switches=*(uint32_t *)sw_addr;
if (flag) {
	*(uint32_t *)led_addr=num1;
	flag = false;
}
else {
	*(uint32_t *)led_addr=num2;
	flag = true;
}

usleep(1000000);
printf("%u\n",switches);

}
return 0;

}