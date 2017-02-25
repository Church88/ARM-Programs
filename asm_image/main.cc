#define cimg_display 0
#include "CImg.h"
#include <iostream>
#include <cstdlib>
using namespace cimg_library;
using namespace std;

//This will dump the contents of an image file to the screen
void print_image (unsigned char *in, int width, int height) {
	for (int i = 0; i < width*height*3; i++)
		cout << (unsigned int)in[i] << endl;
}

#ifdef student_darken
extern "C" {
	void sdarken(unsigned char *in,unsigned char *out, int width, int height);
}
#else 
extern "C" {
//This function will reduce the brightness of all colors in the image by half, and write the results to out
void darken(unsigned char *in,unsigned char *out, int width, int height) {
	for (int i = 0; i < width*height*3; i++)
		out[i] = in[i] / 2;
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
#ifdef student_darken
	sdarken(image,darkimage,image.width(),image.height());
#else
	darken(image,darkimage,image.width(),image.height());
#endif
	end_time = clock();
	cerr << "Darken time: " << double(end_time - start_time)/CLOCKS_PER_SEC << " secs\n";

	//PHASE 3 - Write the image
	start_time = clock();
	darkimage.save_jpeg("output.jpg",50);
	//darkimage.save_png("output.png");
	end_time = clock();
	cerr << "Image write time: " << double(end_time - start_time)/CLOCKS_PER_SEC << " secs\n";
}
