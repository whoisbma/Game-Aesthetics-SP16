#include <iostream>
#include <fstream>
using namespace std;

char getTile(int x, int y, unsigned char data[], int size, int w, int h);
int writeBytes(int offset, unsigned char data[]);

int main() {

	ifstream map("8x8flipped.bmp"); //NEED TO FLIP ROW ORDER IN PS! otherwise counts from bottom
	
	const int BMPSIZE = 248;	//actual size in bytes of the bmp file
	unsigned char bmpBytes[BMPSIZE];	//array of 8-bit integers to store our bytes
	unsigned char data;	//variable to store temporary bytes
	
	int whichByte = 0;
	while (map >> data) {		
		//as long as the file has bytes, plug it into the array
		bmpBytes[whichByte] = data;
		whichByte++;
	}

	map.close();

	const int w = 8;
	const int h = 8;

	char grid[h][w];

	//load tiles
	for (int i = 0; i < h; i++) {
		for (int j = 0; j < w; j++) {
			grid[j][i] = getTile(j,i,bmpBytes,BMPSIZE,w,h);
		}
	}	

	//game loop
	while(true) {
		//draw game board
		cout << "\n\n\n\n";
		cout << "MATCH3!  Press Control-C to quit.";
		cout << "\n\n\n\n";
		cout << "\t     0 1 2 3 4 5 6 7\n";
		cout << "\t     ===============\n";
		for (int i = 0; i < h; i++) {
			for (int j = 0; j < w; j++) {
				if (j == 0) {
					cout << "\t" << i << " || ";
				}
				cout << grid[j][i] << " ";
			}
			cout << endl;
		}

		cout << "\n\n";

		//user input
		int inputX;
		int inputY;
		int inputSwapX;
		int inputSwapY;

		cout << "\tPick x coord: ";
		cin >> inputX;

		cout << "\tPick y coord: ";
		cin >> inputY;

		cout << "\tSwap which x coord: ";
		cin >> inputSwapX;

		cout << "\tSwap which y coord: ";
		cin >> inputSwapY;

		//swap grid positions!
		//STUDENTS: make sure you can only swap with ADJACENT positions
		char temp = grid[inputX][inputY];
		grid[inputX][inputY] = grid[inputSwapX][inputSwapY];
		grid[inputSwapX][inputSwapY] = temp;

		//check for matches:
		//STUDENTS: (advanced) - to do this properly you'll need a recursive function.
		int matches = 0;
		for (int i = -1; i < 2; i++) {
			for (int j = -1; j < 2; j++) {
				if (grid[inputX][inputY] == grid[inputX+i][inputY+j]) {
					matches++;
					cout << "match on " << inputX+i << ", " << inputY+j << endl;
				}
				if (grid[inputSwapX][inputSwapY] == grid[inputSwapX+i][inputSwapY+j]) {
					matches++;
					cout << "match on " << inputSwapX+i << ", " << inputSwapY+j << endl;
				}
			}
		}

		if (matches >= 2) {
			//destroy everything around the original swap position.
			//STUDENTS: try making it destroy only the tiles matching it.
			for (int i = -1; i < 2; i++) {
				for (int j = -1; j < 2; j++) {
					//BEGINNER STUDENTS: make sure it doesn't go off the grid! 
					//right now we can escape the grid entirely by accessing a negative position on the array!
					grid[inputX+i][inputY+j] = ' ';
				}
			}
		} else {
			//BEGINNER STUDENTS: make it swap back!
		}

		//ALL STUDENTS: 
			//add a win state
			//try other mechanics, for example: 
				//match only 1
				//try fewer types of tiles
				//try 16x16 instead of 8x8
		
		//ADVANCED STUDENTS: 
			//add a lose state
			//make remaining tiles fall down if there is empty space
	}	
	return 0;
}


char getTile(int x, int y, unsigned char data[], int size, int w, int h) {
	int r = 0;
	int g = 0;
	int b = 0;
	int i = 54 + (y * w + x) * 3;

	//each row has to add up to a multiple of four bytes.
	int numBytesPerRow = w * 3;
	int paddingValue = numBytesPerRow % 4;

	// cout << y * (4-paddingValue) << "\t";

	if (paddingValue != 0) {
		i += y * (4-paddingValue);
	}

	b = writeBytes(i,data);
	g = writeBytes(i+1,data);
	r = writeBytes(i+2,data);

	// cout << "x: " << x << ", y: " << y;
	// cout << "\t- " << r << ", " << g << ", " << b << "\n";

	if (r == 255 && g == 0 && b == 0) { //red
		return 'O';
	} else if (r == 0 && g == 255 && b == 0) { //green
		return 'X';
	} else if (r == 0 && g == 0 && b == 255) { //blue
		return '.';
	} else if (r == 255 && g == 0 && b == 255) { //purple
		return '#';
	} else if (r == 255 && g == 255 && b == 0) { //yellow
		return '?';
	} else {
		return ' ';
	}
}

int writeBytes(int offset, unsigned char data[]) {
	return data[offset];
}