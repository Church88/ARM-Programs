a.out: main.o student_darken.o
	g++ main.o student_darken.o

student_darken.o: student_darken.s
	as -o student_darken.o student_darken.s

main.o: main.cc
	#g++ -c -Dcimg_display=0 -fexceptions main.cc
	#g++ -O1 -c -Dcimg_display=0 -fexceptions main.cc
	g++ -c -Dcimg_display=0 -Dstudent_darken -fexceptions main.cc

clean:
	rm -rf *.o a.out output.*
