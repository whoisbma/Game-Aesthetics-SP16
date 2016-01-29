#include <iostream>

using namespace std;

int main() {
	const int COLS = 35;
	const int ROWS = 15;
	char grid[COLS][ROWS];

	for (int i = 0; i < ROWS; i++) {
		for (int j = 0; j < COLS; j++) {
			grid[j][i] = '-';
		}
	}

	int x = 3;
	int y = 1;
	int vx = 1;
	int vy = -1;

	char input;
	while (input != 'q') {

			if (x > 0 && x < COLS-1) {
				x += vx;
			} else {
				vx = -vx;
				x += vx;
			}

			if (y > 0 && y < ROWS-1) {
				y += vy;
			} else {
				vy = -vy;
				y += vy;
			}

		grid[x][y] = 'O';
		for (int i = 0; i < ROWS; i++) {
			for (int j = 0; j < COLS; j++) {
				cout << grid[j][i];
			}
			cout << endl;
		}

		for (int i = 0; i < ROWS; i++) {
			for (int j = 0; j < COLS; j++) {
				grid[j][i] = '-';
			}
		}

		cin >> input;

	}
	return 0;
}
