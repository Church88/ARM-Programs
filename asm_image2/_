#define cimg_display 0
#include "CImg.h"
#include <iostream>
#include <iomanip>
#include <cstdlib>
using namespace cimg_library;
using namespace std;

//This will dump the contents of an image file to the screen
void print_image (unsigned char *in, int width, int height) {
	for (int i = 0; i < width*height*3; i++)
		cout << (unsigned int)in[i] << endl;
}

#ifdef student_fun
extern "C" {
	void student_sepia(unsigned char *in,unsigned char *out, int width, int height);
}
#else 
extern "C" {
//inline unsigned char r(unsigned 
//This function will reduce the brightness of all colors in the image by half, and write the results to out

#define R(i,j) (j*width+i)
#define G(i,j) (stride+j*width+i)
#define B(i,j) (stride+stride+j*width+i)

	//This is a rewritten darken function to show you how to access each color individually
void darken(unsigned char *in,unsigned char *out, int width, int height) {
	const int stride = width*height;
	for (int i = 0; i < width; i++) {
		for (int j = 0; j < height; j++) {
			out[R(i,j)] = in[R(i,j)] / 2;
			out[G(i,j)] = in[G(i,j)] / 2;
			out[B(i,j)] = in[B(i,j)] / 2;
		}
	}
	return;
}

void sepia(unsigned char *in,unsigned char *out, int width, int height) {
	const int stride = width*height;
	for (int i = 0; i < width; i++) {
		for (int j = 0; j < height; j++) {
			unsigned short r = in[R(i,j)]*0.393 + in[G(i,j)]*0.769 + in[B(i,j)]*0.189;
			unsigned short g = in[R(i,j)]*0.349 + in[G(i,j)]*0.686 + in[B(i,j)]*0.168;
			unsigned short b = in[R(i,j)]*0.272 + in[G(i,j)]*0.534 + in[B(i,j)]*0.131;
			if (r > 255) r = 255;
			if (g > 255) g = 255;
			if (b > 255) b = 255;
			out[R(i,j)] = r;
			out[G(i,j)] = g;
			out[B(i,j)] = b;
		}
	}
	return;
}
}
#endif

void usage() {
	cout << "Error: this program needs to be called with a command line parameter indicating what file to open.\n";
	cout << "For example, a.out kyoto.jpg\n";
	exit(1);
}

int main(int argc, char **argv) {
	if (argc != 2) usage(); //Check command line parameters

	//PHASE 1 - Load the image
	clock_t start_time = clock();
	CImg<unsigned char> image(argv[1]);
	CImg<unsigned char> darkimage(image.width(),image.height(),1,3,0);
	clock_t end_time = clock();
	cerr << "Image load time: " << double(end_time - start_time)/CLOCKS_PER_SEC << " secs\n";

	//PHASE 2 - Do the image processing operation
	start_time = clock();
#ifdef student_fun
	student_sepia(image,darkimage,image.width(),image.height());
	end_time = clock();
	cerr << "Student Sepia time: " << double(end_time - start_time)/CLOCKS_PER_SEC << " secs\n";
#else
	sepia(image,darkimage,image.width(),image.height());
	end_time = clock();
	cerr << "Reference Sepia time: " << double(end_time - start_time)/CLOCKS_PER_SEC << " secs\n";
#endif

	//PHASE 3 - Write the image
	start_time = clock();
	darkimage.save_jpeg("output.jpg",50);
	//darkimage.save_png("output.png");
	end_time = clock();
	cerr << "Image write time: " << double(end_time - start_time)/CLOCKS_PER_SEC << " secs\n";
}
