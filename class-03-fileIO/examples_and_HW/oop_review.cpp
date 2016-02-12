#include <iostream>
#include <ctime>
#include <cstdlib>
#include <cmath>

using namespace std;


class Cell {
	public:
		Cell(char c = 'o', int i = 0, string s = "lalala");
		void die();
		void zombify();
		char getChar();
		bool isDead();
		bool isZombie();
		~Cell();
	private:
		char cellChar;
		// int cellInt;
		// string cellString;
		bool dead;
		bool zombie;

};

Cell::Cell(char c, int i, string s) {
	cellChar = c;
	// cellInt = i;
	// cellString = s;
	dead = false;
	zombie = false;
}

Cell::~Cell() {
	cout << "zombie is deeead again\n";
}

char Cell::getChar() {
	return cellChar;
}

bool Cell::isDead() {
	return dead;
}

void Cell::die() {
	//how to know if cell is already dead?
	if (dead) {
		// cout << "I'm already dead!!\n";
	} else {
		dead = true;
		cellChar = ' ';
		// cout << "oh i'm dead\n";
	}
}

void Cell::zombify() {
	// cout << "RRRRUGGGGHURRRRRRrrrrr...\n";
	zombie = true;
	cellChar = 'z';
}

bool Cell::isZombie() {
	return zombie;
}

void someFunction() {
	Cell myCell;
}

class Grid {
public: 
	Grid();
	Cell cells[10][10];
};

void makeCellDead(Cell c) {
	c.die();
}

int main() {
	
	// Grid thisGrid;
	// thisGrid.draw();


	// Cell specialCell('y', 9999999, "I'M SPECIALCELL");
	// cout << specialCell.cellString << "\n";

	const int GRIDSIZE = 17;
	Cell cellGrid[17][17];

	// // cellGrid[1][0].die();
	cellGrid[8][8].die();
	// // cellGrid[6][5].die();
	cout << "main started running\n";
	someFunction();
	cout << "hey main is still running!\n";

	char input;
	while (input != 'q') {

		for (int i = 0; i < GRIDSIZE; i++) {
			for (int j = 0; j < GRIDSIZE; j++) {
				cout << cellGrid[j][i].getChar() << " ";
			}
			cout << endl;
		}

		for (int i = 0; i < GRIDSIZE; i++) {
			for (int j = 0; j < GRIDSIZE; j++) {
				if (cellGrid[j][i].isDead()) {
					cellGrid[j][i].zombify();
				}
			}
		}

		for (int i = 0; i < GRIDSIZE; i++) {
			for (int j = 0; j < GRIDSIZE; j++) {
				if (cellGrid[j][i].isZombie()) {
					srand(static_cast<unsigned int>(time(0)) + i * j + sin(static_cast<unsigned int>(time(0))* cos(static_cast<unsigned int>(time(0)) + i * i)));
					int randomNumber = rand() % 4;
					if (randomNumber == 0) {
						if (i > 0) {
							cellGrid[j][i-1].die();
						}
					} else if (randomNumber == 1) {
						if (i < GRIDSIZE-1) {
							cellGrid[j][i+1].die();
						}
					} else if (randomNumber == 2) {
						if (j > 0) {
							cellGrid[j-1][i].die();
						}
					} else if (randomNumber == 3) {
						if (j < GRIDSIZE-1) {
							cellGrid[j+1][i].die();
						}
					}
				}
			}
		}
		


		cin >> input;

	}


	return 0;
}
