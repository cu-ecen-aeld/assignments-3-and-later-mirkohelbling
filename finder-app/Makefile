CC=gcc
CC1=aarch64-none-linux-gnu-gcc
CFLAGS= -I.
writer: writer.o
	$(CC) ${CFLAGS} -o writer writer.o
clean:
	rm -f writer writer.o	

arm_writer: writer.o
	$(CC1) ${CFLAGS} -o writer writer.c
