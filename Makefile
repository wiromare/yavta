CROSS_COMPILE ?=

CC	:= $(CROSS_COMPILE)gcc
CFLAGS ?= -Iinclude -I/opt/vc/include -pipe -W -Wall -Wextra -g -O2 -fopenmp -DMAGICKCORE_HDRI_ENABLE=0 -DMAGICKCORE_QUANTUM_DEPTH=16 -fopenmp -DMAGICKCORE_HDRI_ENABLE=0 -DMAGICKCORE_QUANTUM_DEPTH=16 -I/usr/include/arm-linux-gnueabihf//ImageMagick-6 -I/usr/include/ImageMagick-6
LDFLAGS	?=
LIBS	:= -L/opt/vc/lib -lrt -lbcm_host -lvcos -lvchiq_arm -pthread -lmmal_core -lmmal_util -lmmal_vc_client -lvcsm -lMagickCore-6.Q16

%.o : %.c
	$(CC) $(CFLAGS) -c -o $@ $<

all: yavta

yavta: yavta.o
	$(CC) $(LDFLAGS) -o $@ $^ $(LIBS)

clean:
	-rm -f *.o
	-rm -f yavta

