UNAME := $(shell uname)

INCFLAGS  = -I vecmath/include
LINKFLAGS = -L vecmath/lib -lvecmath

ifeq ($(UNAME),Darwin)
FRAMEWORKS =  -framework Glut 
FRAMEWORKS += -framework OpenGL 
else
INCFLAGS  += -I /usr/include/GL
LINKFLAGS += -L -lRK4 -lglut -lGL -lGLU
endif

CFLAGS    = -g -Wall -ansi
CC        = g++
SRCS      = $(wildcard *.cpp)
SRCS     += $(wildcard vecmath/src/*.cpp)
OBJS      = $(SRCS:.cpp=.o)
PROG      = a3

all: $(SRCS) $(PROG)

$(PROG): $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -o $@ $(LINKFLAGS) $(FRAMEWORKS)

.cpp.o:
	$(CC) $(CFLAGS) $< -c -o $@ $(INCFLAGS)

depend:
	makedepend $(INCFLAGS) -Y $(SRCS)

clean:
	rm $(OBJS) $(PROG)
