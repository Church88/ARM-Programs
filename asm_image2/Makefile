a.out: main.o student_sepia.o
	g++ main.o student_sepia.o

student_sepia.o: student_sepia.s
	as -mfpu=neon -o student_sepia.o student_sepia.s

main.o: main.cc
	#g++ -O4 -mfpu=neon -ftree-vectorize -DHAVE_NEON=1 -Dstudent_fun -c -Dcimg_display=0 -fexceptions main.cc
	#g++ -O4 -mfpu=neon -ftree-vectorize -DHAVE_NEON=1 -c -Dcimg_display=0 -fexceptions main.cc
	#g++ -O4 -mfpu=neon -ftree-vectorize -ftree-vectorizer-verbose=2 -DHAVE_NEON=1 -c -Dcimg_display=0 -fexceptions main.cc
	#g++ -O4 -mfpu=neon -DHAVE_NEON=1 -c -Dcimg_display=0 -fexceptions main.cc
	#g++ -O3 -mfpu=neon -c -Dcimg_display=0 -fexceptions main.cc
	#g++ -O1 -c -Dcimg_display=0 -fexceptions main.cc
	#g++ -c -Dcimg_display=0 -fexceptions main.cc
	g++ -c -Dcimg_display=0 -Dstudent_sepia -fexceptions main.cc

clean:
	rm -rf *.o a.out output.*
