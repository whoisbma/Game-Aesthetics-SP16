#include <iostream>
#include <fstream>
using namespace std;

int main() {
	//ofstream is for OUTPUT
	//ifstream is for INPUT

	ifstream theFile("players.txt");

	int id;
	string name;
	int level;

	//every file has an "end of file marker", returning a null pointer and breaking the loop
	while(theFile >> id >> name >> level) {
		cout << id << ", " << name << ", " << level << endl;
	}

	//close file method automatically called by ifstream deconstructor

	return 0;
}