MODEL=attiny85
F_CPU=16500000
LIBNAME=libtinyarduino.a

SRCSC=wiring_digital.c wiring_analog.c pins_arduino.c
OBJSC=wiring_digital.o wiring_analog.o pins_arduino.o

OBJS=$(OBJSC)

CFLAGS=-Os -DF_CPU=$(F_CPU) -mmcu=$(MODEL) -Wall -ffunction-sections -fdata-sections
ARFLAGS=rcs

.c.o:
	avr-gcc $(CFLAGS) -c $<

all: $(LIBNAME)

$(LIBNAME): $(OBJS)
	avr-ar $(ARFLAGS) $(LIBNAME) $(OBJS)

clean:
	rm -f *~ *.o $(LIBNAME)
