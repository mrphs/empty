### Copyright 2007 Steven J. Murdoch
### See LICENSE for licensing information

CC=gcc -Wall -Werror -ggdb

all: trivsocks-client

trivsocks-client: trivsocks-client.o util.o
	$(CC) -o $@ $^

%.o: %.c
	$(CC) -c $<

test: trivsocks-client
	./trivsocks-client -4 tor.eff.org /
	./trivsocks-client -5 tor.eff.org /

clean:
	rm -f *~ *.o trivsocks-client
