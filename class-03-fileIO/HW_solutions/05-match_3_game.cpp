#include <iostream>
#include <fstream>
using namespace std;

char getTile(int x, int y, unsigned char data[], int size, int w, int h);
int writeBytes(int offset, unsigned char data[]);

int main() {

	//---------------------------------------------------------------------------


	//READ BMP-------------------------------------------------------------------
	

	//---------------------------------------------------------------------------

	ifstream map("8x8flipped.bmp");
	
	const int BMPSIZE = 248;
	unsigned char bmpBytes[BMPSIZE];
	unsigned char data;
	
	int whichByte = 0;
	while (map >> data) {		
		bmpBytes[whichByte] = data;
		whichByte++;
	}

	map.close();

	//---------------------------------------------------------------------------


	//CREATE AND FILL ARRAY FOR GAME BOARD---------------------------------------
	

	//---------------------------------------------------------------------------

	const int w = 8;
	const int h = 8;

	char grid[h][w];

	for (int i = 0; i < h; i++) {
		for (int j = 0; j < w; j++) {
			grid[j][i] = getTile(j,i,bmpBytes,BMPSIZE,w,h);
		}
	}	

	//---------------------------------------------------------------------------


	//GAME LOOP------------------------------------------------------------------
	

	//---------------------------------------------------------------------------

	while(true) {

		//---------------------------------------------------------------------------


		//DRAW GAME BOARD------------------------------------------------------------
		

		//---------------------------------------------------------------------------

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

		//---------------------------------------------------------------------------
		

		//GET AND VALIDATE USER INPUT------------------------------------------------


		//---------------------------------------------------------------------------

		//user input
		int inputX;
		int inputY;
		int inputSwapX;
		int inputSwapY;

		cout << "\tPick x coord: ";
		cin >> inputX;

		//SOLUTION - only allow positions on the board to be selected
		while (inputX < 0 || inputX >= w) {
			cout << "\n\tInvalid board position!\n";
			cout << "\tPick x coord: ";
			cin >> inputX; 
		}

		cout << "\tPick y coord: ";
		cin >> inputY;

		//SOLUTION - only allow positions on the board to be selected
		while (inputY < 0 || inputY >= h) {
			cout << "\n\tInvalid board position!\n";
			cout << "\tPick y coord: ";
			cin >> inputY; 
		}

		cout << "\tSwap with which adjacent x coord: ";
		cin >> inputSwapX;

		//SOLUTION - only allow positions on the board to be selected
		while (inputSwapX < 0 || inputSwapX >= w) {
			cout << "\n\tInvalid board position!\n";
			cout << "\tSwap with which adjacent x coord: ";
			cin >> inputSwapX; 
		}

		//SOLUTION - only allow players to enter x positions directly to the left and right of inputX
		while (inputSwapX < inputX-1 || inputSwapX > inputX+1) {
			cout << "\n\tAdjacent positions only!\n";
			cout << "\tSwap with which adjacent x coord: ";
			cin >> inputSwapX;
		}

		cout << "\tSwap with which adjacent y coord: ";
		cin >> inputSwapY;

		//SOLUTION - only allow positions on the board to be selected
		while (inputSwapY < 0 || inputSwapY >= h) {
			cout << "\n\tInvalid board position!\n";
			cout << "\tSwap with which adjacent y coord: ";
			cin >> inputSwapY; 
		}

		//SOLUTION - only allow players to enter y positions directly above and below inputY
		while (inputSwapY < inputY-1 || inputSwapY > inputY+1) {
			cout << "\n\tAdjacent positions only!\n";
			cout << "\tSwap with which adjacent y coord: ";
			cin >> inputSwapY;
		}

		//SOLUTION - don't allow player to swap a position with itself
		if (inputX == inputSwapX && inputY == inputSwapY) {
			cout << "\n\n\n\tCan't swap with itself!\n";
			continue;
		}

		//ANOTHER SOLUTION - check the absolute value of the difference!

		cout << "\n\n";

		//---------------------------------------------------------------------------


		//SWAP POSITIONS-------------------------------------------------------------
		

		//---------------------------------------------------------------------------

		char temp = grid[inputX][inputY];
		grid[inputX][inputY] = grid[inputSwapX][inputSwapY];
		grid[inputSwapX][inputSwapY] = temp;

		//---------------------------------------------------------------------------
		

		//CHECK FOR MATCHES----------------------------------------------------------
		

		//---------------------------------------------------------------------------

		//STUDENTS: (advanced) - to do this properly you'll need a recursive function.
		int matches = 0;
		for (int i = -1; i < 2; i+=2) {
			for (int j = -1; j < 2; j+=2) {
				//SOLUTION: only add matches if it doesn't go off the array limits.
				if (inputX+i >= 0 && inputX+i < w && inputY+j >= 0 && inputY+j < h) {
					cout << "\tchecking grid position1 : " << inputX+i << ", " << inputY+j << endl;
					if (grid[inputX][inputY] == grid[inputX+i][inputY+j]) {
						matches++;
						cout << "\t\tmatch on " << inputX+i << ", " << inputY+j << ": ";
						cout << "\t" << grid[inputX][inputY] << " == " << grid[inputX+i][inputY+j] << endl;
					}
				}
				if (inputSwapX+i >= 0 && inputSwapX+i < w && inputSwapY+j >= 0 && inputSwapY+j < h) {
					cout << "\tchecking grid position2: " << inputSwapX+i << ", " << inputSwapY+j<< endl;
					if (grid[inputSwapX][inputSwapY] == grid[inputSwapX+i][inputSwapY+j]) {
						matches++;
						cout << "\t\tmatch on " << inputSwapX+i << ", " << inputSwapY+j << ": ";
						cout << "\t" << grid[inputSwapX][inputSwapY] << " == " << grid[inputSwapX+i][inputSwapY+j] << endl;
					}
				}
			}
		}


		//---------------------------------------------------------------------------


		//DESTROY MATCHES------------------------------------------------------------
		

		//---------------------------------------------------------------------------

		//SOLUTION - in order to destroy only the matching tiles, we'll need to save the matches to compare, 
		//otherwise we'll be comparing to ' ' at some point instead of our match char in the grid
		char compareMatch1 = grid[inputX][inputY];
		char compareMatch2 = grid[inputSwapX][inputSwapY];

		if (matches > 3) {
			for (int i = -1; i < 2; i+=2) {
				for (int j = -1; j < 2; j+=2) {
					//SOLUTION: make sure it doesn't go off the array limits
					if (inputX+i >= 0 && inputX+i < w && inputY+j >= 0 && inputY+j < h) {
						if (compareMatch1 == grid[inputX+i][inputY+j]) {
							grid[inputX+i][inputY+j] = ' ';
						}
					}
					//SOLUTION: make sure it doesn't go off the array limits
					if (inputSwapX+i >= 0 && inputSwapX+i < w && inputSwapY+j >= 0 && inputSwapY+j < h) {
						if (compareMatch2 == grid[inputSwapX+i][inputSwapY+j]) {
							grid[inputSwapX+i][inputSwapY+j] = ' ';
						}
					}
				}
			}
		} else {
			//SOLUTION - reverse the swap if we don't meet match criteria
			cout << "\n\tNo match, swapping back.\n\n";
			temp = grid[inputX][inputY];
			grid[inputX][inputY] = grid[inputSwapX][inputSwapY];
			grid[inputSwapX][inputSwapY] = temp;
		}

		//ALL STUDENTS: 
			//add a win state
			//try other mechanics, for example: 
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