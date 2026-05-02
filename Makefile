obj-m += modules/helloworld.o

KDIR := /home/neosahadeo/Documents/Projects/C/kernel/linux
PWD := $(shell pwd)

default:
	$(MAKE) -C $(KDIR) M=$(PWD) modules

clean:
	$(MAKE) -C $(KDIR) M=$(PWD) clean
