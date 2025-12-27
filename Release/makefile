#   Copyright 2025 Aidan Holmes
#   SPIder lib

SRC = /Src/
BIN = Bin/
OBJ = Objs/
LIBNAME = spiderdev.lib

# Build parameters - set by main makefile in parent directory
SCOPTS = DEFINE=DEBUG_SERIAL NOSTACKCHECK OPTIMIZE Optimizerinline OptimizerInLocal OptimizerLoop OptimizerComplexity=30 OptimizerGlobal OptimizerDepth=6 OptimizerTime OptimizerSchedule OptimizerPeephole PARAMETERS=stack
OBJS = $(OBJ)fncasm.o $(OBJ)spi.o $(OBJ)config_file.o $(OBJ)timing.o $(OBJ)debug.o

all: $(BIN)$(LIBNAME) 

clean:
    - delete $(OBJ)\#?.o $(OBJ)\#?.asm $(BIN)\#?.lnk $(BIN)\#?.info $(BIN)\#?.map $(BIN)\#?.gst $(BIN)$(LIBNAME)

$(BIN)$(LIBNAME): $(OBJS)
	oml $(BIN)$(LIBNAME) $(OBJS)
	
.c.o:
	sc $(SCOPTS) $? ObjectName=$(OBJ)
	
.a.o:
	sc $? ObjectName=$(OBJ)

$(OBJ)fncasm.o: $(SRC)fncasm.a
$(OBJ)spi.o: $(SRC)spi.c 
$(OBJ)config_file.o: $(SRC)config_file.c 
$(OBJ)timing.o: $(SRC)timing.c 
$(OBJ)debug.o: $(SRC)debug.c 
