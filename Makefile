
PROJ_DIR=${PWD}
INC_DIR=${PWD}/include
BIN_DIR=${PWD}/bin
BUILD_DIR=${PWD}/build
SRC_DIR=${PWD}/src


OBJS= ${BUILD_DIR}/foo.o ${BUILD_DIR}/goo.o ${BUILD_DIR}/myapp.o

CFLAGS= -g -Wall
SRCS :=${shell find ${SRC_DIR} -name "*.c"}

.SUFFIXES: .o .c

all: dep ${BIN_DIR}/myapp

${BIN_DIR}/myapp: ${OBJS}
	gcc ${CFLAGS} -o ${BIN_DIR}/myapp ${OBJS}

${BUILD_DIR}/%.o: ${SRC_DIR}/%.c
	gcc ${CFLAGS} -c $< -I${INC_DIR} -o $@


dep: .depend
.depend: ${SRCS}
	rm -f ./.depend
	gcc ${CFLAGS} -M -I$(INC_DIR) $^ > ./.depend

include ./.depend



clean:
	rm -f ${BUILD_DIR}/*.o
	rm -f ${BIN_DIR}/*
	rm -f ./.depend




