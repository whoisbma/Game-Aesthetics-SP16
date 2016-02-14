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
	char mapIcon;
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
			map[i][j].description = "There's nothing here!";	
			map[i][j].canGoNorth = false;
			map[i][j].canGoEast = false;	
			map[i][j].canGoWest = false;
			map[i][j].canGoSouth = false;	
			map[i][j].mapIcon = '-';
		}
	}

	//set starting values for different Rooms
	map[1][1].description = "You are in the PComp room in D12. You don't remember why you are here, or even how you got here. There's a soldering iron burning a steadily decreasing amount of solder. The fumes smell great. Did you pass out? There's an exit to the NORTH.";
	map[1][1].canGoNorth = true;

	map[1][0].description = "A subtle feeling of encroaching madness envelops you. You find yourself among a throng of alternately screeching or sleeping graduate students. You can go WEST or EAST - the fumes have gotten even stronger to the south. You aren't going back in there.";
	map[1][0].canGoEast = true;
	map[1][0].canGoWest = true;

	map[0][0].description = "There is a giant polygonal head in the corner. It beckons to you. You can go SOUTH and EAST.";
	map[0][0].canGoSouth = true;
	map[0][0].canGoEast = true;

	map[2][0].description = "You stand in front of a door with no sign, but you sense it is a gender-neutral bathroom. You knock in vain; it remains locked securely. You can go back WEST, or SOUTH.";
	map[2][0].canGoWest = true;
	map[2][0].canGoSouth = true;


	//game loop runs until the user enters 'q'
	while (input != "q") {

		map[x][y].mapIcon = '@';

		for (int i = 0; i < 3; i++) {
			for (int j = 0; j < 3; j++) {
				cout << map[j][i].mapIcon;
			}
			cout << endl;
		}

		cout << "you are at " << x << " " << y << endl;
		cout << map[x][y].description << endl;		
		cout << "Which direction?" << endl;
		cin >> input;

		map[x][y].mapIcon = '-';

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