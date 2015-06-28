all:libconf.a

libconf.a:conf.o stack.o hash.o
	mkdir -p include/conf-c lib 
	cp src/conf.h include/conf-c/
	ar rcs libconf.a conf.o stack.o hash.o
	cp libconf.a lib/

conf.o:src/conf.h src/conf.c 
	gcc -O2 -c src/conf.c 

stack.o:src/stack/stack.h src/stack/stack.c 
	gcc -O2 -c src/stack/stack.c 

hash.o:src/hash/hash.h src/hash/hash.c 
	gcc -O2 -c src/hash/hash.c 

clean:
	rm -rfv include lib *.o *.a

install:
	cp -r include/conf-c /usr/include/ 
	cp lib/libconf.a /usr/lib/

uninstall:
	rm -rfv /usr/include/conf-c/ /usr/lib/libconf.a
