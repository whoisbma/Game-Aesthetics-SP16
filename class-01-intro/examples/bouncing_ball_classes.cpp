#include <iostream>
using namespace std;

class Ball {
public:
	Ball(int _x = 1, int _y = 1, int _vx = 1, int _vy = 1);
	void update(int r, int c);
	int getX();
	int getY();
private:
	int x;
	int y;
	int vx;
	int vy;
};

Ball::Ball(int _x, int _y, int _vx, int _vy):
	x(_x),
	y(_y),
	vx(_vx),
	vy(_vy)
{} 

void Ball::update(int r, int c) {
	cout << "x is: " << x << endl;
	cout << "y is: " << y << endl;

	if (x > 0 && x < c-1) {
		x += vx;
	} else {
		vx = -vx;
		x += vx;
	}

	if (y > 0 && y < r-1) {
		y += vy;
	} else {
		vy = -vy;
		y += vy;
	}
}

int Ball::getX() {
	return x;
}

int Ball::getY() {
	return y;
}

int main() {
	Ball ball;
	const int COLS = 35;
	const int ROWS = 15;
	char grid[COLS][ROWS];
	for (int i = 0; i < ROWS; i++) {
		for (int j = 0; j < COLS; j++) {
			grid[j][i] = '-';
		}
	}

	char input;
	while (input != 'q') {
		ball.update(ROWS, COLS);
		grid[ball.getX()][ball.getY()] = 'O';
		grid[ball.getX()-1][ball.getY()] = 'o';
		grid[ball.getX()+1][ball.getY()] = 'o';
		grid[ball.getX()][ball.getY()-1] = 'o';
		grid[ball.getX()][ball.getY()+1] = 'o';
		for (int i = 0; i < ROWS; i++) {
			for (int j = 0; j < COLS; j++) {
				cout << grid[j][i];
			}
			cout << endl;
		}

		for (int i = 0; i < ROWS; i++){
			for (int j =0; j < COLS; j++) {
				grid[j][i] = '-';
			}	
		}

		cin >> input;
	}

	return 0;
}