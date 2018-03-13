obj-m := ilitek_ts.o
ilitek_ts-objs := 	ilitek_main.o \
					ilitek_platform_init.o \
					ilitek_update.o \
					ilitek_tool.o

KU = imx_4.1.43_1.0.5
KP = imx_4.1.15_1.2.0_ga_1.0.5
#-I/Devel/NOVAsom_SDK/FileSystem/P_Base/output/host/bin
KERNELDIRP ?= /Devel/NOVAsom_SDK/Kernel/linux-$(KP)
KERNELDIRU ?= /Devel/NOVAsom_SDK/Kernel/linux-$(KU)
EXTRA_CFLAGS = -DEXPORT_SYMTAB
PWD       := $(shell pwd)
DEST = /lib/modules/$(CURRENT)/kernel/$(MDIR)

P:
	$(MAKE) -C $(KERNELDIRP) M=$(PWD) LDDINC=$(PWD) modules
U:
	$(MAKE) -C $(KERNELDIRU) M=$(PWD) LDDINC=$(PWD) modules

clean:
	rm -rf *.o *~ core .depend .*.cmd *.ko *.mod.c .tmp_versions
