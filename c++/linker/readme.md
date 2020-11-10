+ gcc -c main.c
+ nm -A main.o
+ objdump -S main.o
+ objdump -S -r main.o