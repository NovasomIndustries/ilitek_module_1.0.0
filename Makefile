obj-m := ilitek_ts.o
ilitek_ts-objs := 	ilitek_main.o \
					ilitek_platform_init.o \
					ilitek_update.o \
					ilitek_tool.o

KU = imx_4.1.43
KP = imx_4.1.15_1.2.0_ga
#-I/Devel/NOVAsom_SDK/FileSystem/P_Base/output/host/bin
KERNELDIRP ?= /Devel/NOVAsdk2019.01/Kernel/linux-$(KP)
KERNELDIRU ?= /Devel/NOVAsdk2019.01/Kernel/linux-$(KU)
EXTRA_CFLAGS = -DEXPORT_SYMTAB
PWD       := $(shell pwd)
DEST = /lib/modules/$(CURRENT)/kernel/$(MDIR)

P:
	$(MAKE) -C $(KERNELDIRP) M=$(PWD) LDDINC=$(PWD) modules
U:
	$(MAKE) -C $(KERNELDIRU) M=$(PWD) LDDINC=$(PWD) modules

clean:
	rm -rf *.o *~ core .depend .*.cmd *.ko *.mod.c .tmp_versions
