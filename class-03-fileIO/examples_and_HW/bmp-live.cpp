#include <iostream>
#include <fstream>
using namespace std;



int writeBytes(int offset, unsigned char data[]) {
	return data[offset];
}

int main() {
	ifstream map("8x8flipped.bmp");
	unsigned char data;
	const int BMPSIZE = 248;
	unsigned char bmpBytes[BMPSIZE];

	int whichByte = 0;
	while (map >> data) {
		bmpBytes[whichByte] = data;
		whichByte++;
	}
	map.close();

	const int SIZE = 8;
	char grid[SIZE][SIZE];

	for (int i = 0; i < SIZE; i++) {
		for (int j = 0; j < SIZE; j++) {
			int r = 0;
			int g = 0;
			int b = 0;
			int n = 54 + (i * SIZE + j) * 3;
			b = writeBytes(n, bmpBytes);
			g = writeBytes(n+1, bmpBytes);
			r = writeBytes(n+2, bmpBytes);

			if (r == 255 && g == 0 && b == 0) {
				grid[j][i] = 'r';
			} else if (r == 0 && g == 0 && b == 255) {
				grid[j][i] = 'b';
			} else {
				grid[j][i] = '-';
			}
		}
	}

	for (int i = 0; i < SIZE; i++) {
		for (int j = 0; j < SIZE; j++) {
			cout << grid[j][i] << " ";
		}
		cout << endl;
	}


	return 0;
}