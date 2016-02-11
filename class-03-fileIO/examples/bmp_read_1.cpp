#include <iostream>
#include <fstream>
using namespace std;

int main() {
	//--------------------------------------------
	//--------------------------------------------

	ifstream map("blankbmp.bmp");
	unsigned char data; 
	//we can read in binary, but not bytes per se with simple C++. 
	//we're going to just be reading in ascii style and converting to uint8_t, essentially.
	
	//print out all chars, see the problems
	while (map >> data) {
		cout << data << " "; 
	}
	map.close();

	//--------------------------------------------
	//--------------------------------------------

	//if we convert from unsigned chars to decimal, however, 
	//we can read the bytes in a manner that might be familiar to us.

	// while (map >> data) {
	// 	cout << int(data) << " "; 
	// }

	//--------------------------------------------
	//--------------------------------------------

	//open the bmp itself in sublime text, compare.

	//http://www.fastgraph.com/help/bmp_header_format.html
	//https://en.wikipedia.org/wiki/BMP_file_format

	//--------------------------------------------
	//--------------------------------------------

	return 0;
}