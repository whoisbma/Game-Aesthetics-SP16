#include <iostream>
#include <fstream>
using namespace std;

int main() {
	ifstream map("blankbmp.bmp");
	// ifstream map("linebmp.bmp");
	unsigned char data; //variable to store temporary bytes

	const int BMPSIZE = 248;	//actual size in bytes of the bmp file
	unsigned char bmpBytes[BMPSIZE];	//array of 8-bit integers to store our bytes
	
	int whichByte = 0;
	while (map >> data) {		
		//as long as the file has bytes, plug it into the array
		bmpBytes[whichByte] = data;
		whichByte++;
	}

	map.close();

	//WRITE OUT ENTIRE HEADER FILE:
	cout << int(bmpBytes[0]) << " ";
	cout << int(bmpBytes[1]) << " ";
	cout << "\t\t- index 0, size 2 - signature, must by 4D42 hex\n";
	cout << int(bmpBytes[2]) << " ";
	cout << int(bmpBytes[3]) << " ";
	cout << int(bmpBytes[4]) << " ";
	cout << int(bmpBytes[5]) << " ";
	cout << "\t- index 2, size 4 - size of BMP file in bytes (unreliable)\n";
	cout << int(bmpBytes[6]) << " ";
	cout << int(bmpBytes[7]) << " ";
	cout << "\t\t- index 6, size 2 - reserved, must be zero\n";
	cout << int(bmpBytes[8]) << " ";
	cout << int(bmpBytes[9]) << " ";
	cout << "\t\t- index 8, size 2 - reserved, must be zero\n";
	cout << int(bmpBytes[10]) << " ";
	cout << int(bmpBytes[11]) << " ";
	cout << int(bmpBytes[12]) << " ";
	cout << int(bmpBytes[13]) << " ";
	cout << "\t- index 10, size 4 - offset to start of image data in bytes\n";
	cout << int(bmpBytes[14]) << " ";
	cout << int(bmpBytes[15]) << " ";
	cout << int(bmpBytes[16]) << " ";
	cout << int(bmpBytes[17]) << " ";
	cout << "\t- index 14, size 4 - size of BITMAPINFOHEADER structure, must be 40\n";
	cout << int(bmpBytes[18]) << " ";
	cout << int(bmpBytes[19]) << " ";
	cout << int(bmpBytes[20]) << " ";
	cout << int(bmpBytes[21]) << " ";
	cout << "\t- index 18, size 4 - image width in pixels\n";
	cout << int(bmpBytes[22]) << " ";
	cout << int(bmpBytes[23]) << " ";
	cout << int(bmpBytes[24]) << " ";
	cout << int(bmpBytes[25]) << " ";
	cout << "- index 22, size 4 - image height in pixels\n";
	cout << int(bmpBytes[26]) << " ";
	cout << int(bmpBytes[27]) << " ";
	cout << "\t\t- index 26, size 2 - number of planes in the image, must be 1\n";
	cout << int(bmpBytes[28]) << " ";
	cout << int(bmpBytes[29]) << " ";
	cout << "\t\t- index 28, size 2 - number of bits per pixel (1,4,8,24)\n";
	cout << int(bmpBytes[30]) << " ";
	cout << int(bmpBytes[31]) << " ";
	cout << int(bmpBytes[32]) << " ";
	cout << int(bmpBytes[33]) << " ";
	cout << "\t- index 30, size 4 - compression type (0=none, 1=RLE-8, 2=RLE-4)\n";
	cout << int(bmpBytes[34]) << " ";
	cout << int(bmpBytes[35]) << " ";
	cout << int(bmpBytes[36]) << " ";
	cout << int(bmpBytes[37]) << " ";
	cout << "\t- index 34, size 4 - size of image data in bytes (including padding)\n";
	cout << int(bmpBytes[38]) << " ";
	cout << int(bmpBytes[39]) << " ";
	cout << int(bmpBytes[40]) << " ";
	cout << int(bmpBytes[41]) << " ";
	cout << "\t- index 38, size 4 - horizontal resolution in pixels per meter (unreliable)\n";
	cout << int(bmpBytes[42]) << " ";
	cout << int(bmpBytes[43]) << " ";
	cout << int(bmpBytes[44]) << " ";
	cout << int(bmpBytes[45]) << " ";
	cout << "\t- index 42, size 4 - vertical resolution in pixels per meter (unreliable)\n";
	cout << int(bmpBytes[46]) << " ";
	cout << int(bmpBytes[47]) << " ";
	cout << int(bmpBytes[48]) << " ";
	cout << int(bmpBytes[49]) << " ";
	cout << "\t- index 46, size 4 - number of colors in image, or 0\n";
	cout << int(bmpBytes[50]) << " ";
	cout << int(bmpBytes[51]) << " ";
	cout << int(bmpBytes[52]) << " ";
	cout << int(bmpBytes[53]) << " ";
	cout << "\t- index 50, size 4 - number of important colors, or 0\n";
	cout << "\n";

	//PRINT ALL BYTES in rows of 16
	int count = 0;
	for (int i = 0; i < BMPSIZE; i++) {
		cout << int(bmpBytes[i]);
		count++;
		if (count % 2 == 1) {
			cout << " ";
		} else {
			cout << "\t";
		}
		if (count % 16 == 0) {
			cout << endl;
		}
	}
	cout << "\n\n";



	return 0;
}

