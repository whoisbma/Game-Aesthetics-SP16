//------------------------------------------------------------------//
//	GAME AESTHETICS CLASS 02										//
//  TEXT PARSER AND MAP 											//
//																	//
//	use this as a starting point for building out a complete map.	//
//------------------------------------------------------------------//

#include <iostream>
#include <string>
using namespace std;

class Room {
public:
	string description;	
	bool canGoNorth;
	bool canGoEast;
	bool canGoSouth;
	bool canGoWest;
};


int main() 
{
	string input;			// a string to store player input
	int x = 1;				// 2 variables to store player position, x and y
	int y = 1;
	Room map[3][3];			// a 2D array to store our map

	//fill the map of Rooms with starting values
	for (int i = 0; i < 3; i++) {
		for (int j = 0; j < 3; j++) {
			map[j][i].description = "There's nothing here!";	
			map[j][i].canGoNorth = false;
			map[j][i].canGoEast = false;	
			map[j][i].canGoWest = false;
			map[j][i].canGoSouth = false;	
		}
	}

	//set starting values for different Rooms
	map[0][1].description = "Here lies a chocolate chip cookie.";
	map[2][0].description = "You crane your neck skyward to see the grand Empire State Building up among the clouds! You feel dizzy.";

	map[1][1].description = "There's a path going east and west.";
	map[1][1].canGoWest = true;
	map[1][1].canGoEast = true;

	//game loop runs until the user enters 'q'
	while (input != "q") {

		cout << "you are at " << x << " " << y << endl;
		cout << map[x][y].description << endl;		
		cout << "Which direction?" << endl;
		cin >> input;


		//check for input
		if (input == "NORTH") {
			if (map[x][y].canGoNorth == true) {
				y--;
			} else {
				cout << "you can't go that way! you fool!" << "\n\n";
			}
		} else if (input == "EAST") {
			if (map[x][y].canGoEast == true) {
				x++;
			} else {
				cout << "you can't go that way!\n\n";
			}
		} else if (input == "SOUTH") {
			if (map[x][y].canGoSouth == true) {
				y++;				
			} else {
				cout << "you can't go that way!\n\n";
			}
		} else if (input == "WEST") {
			if (map[x][y].canGoWest == true) {
				x--;				
			} else {
				cout << "NO!\n\n";
			}
		} else {
			cout << "I don't understand " << input << "\n";
		}
	}

	return 0;
}