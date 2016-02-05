//-----------------------------------------------------------------------------------------------------------
// GAME AESTHETICS: Array Review part 3
//-----------------------------------------------------------------------------------------------------------

#include <iostream>
using namespace std;

int main() 
{
			//----------------------------------------//
			//       ARRAYS AND LOOPS				  //
			//----------------------------------------//

	// if we have a BIG array, we have a problem with explicit initialization.
	// we should give it values with a loop, if we want to give them all values at once.


	//-----------------loop initialization:----------------------------------------

	int bigIntArray[999]; //create array of ints with 999 positions.

	for (int i = 0; i < 999; i++) {
		bigIntArray[i] = 0;	//this sets every position in the array to 0.
	}

	//this is the equivalent of writing:
	//	bigIntArray[0] = 0;
	//	bigIntArray[1] = 0;
	//	bigIntArray[2] = 0;
	//	bigIntArray[3] = 0;
	//	bigIntArray[4] = 0;
	//	etc...
	//  etc... 
	//  finally..
	//  bigIntArray[998] = 0;

	// its often smart to declare a CONSTANT INT to say what the size of our array will be.
	// this means that we don't need to repeat ourselves all the time.

	const int biggerArraySize = 1000;
	int biggerArray[biggerArraySize];
	for (int i = 0; i < biggerArraySize; i++) {
		if (i % 2 == 0) {
			biggerArray[i] = 0;
		} else {
			biggerArray[i] = 1;
		}
	}

	// can you guess what the values of biggerArray will look like? 
	// we can print it out and check. how? with another loop of course.
	// any time we see ourselves repeating code, we should ask if we can loop instead.

	for (int i = 0; i < biggerArraySize; i++) {
		cout << biggerArray[i] << endl;
	}

	//again, this is equivalent to:
	//cout << bigIntArray[0] << endl;
	//cout << bigIntArray[1] << endl;
	//cout << bigIntArray[2] << endl;
	//cout << bigIntArray[3] << endl;
	//cout << bigIntArray[4] << endl;
	//etc.
	//etc.
	//etc.
	//etc.
	//cout << bigIntArray[999] << endl;

	// EXERCISE --------------------------------

	// try making 2 arrays of chars between 10-100 positions large, and filling them with loops.
	// fill the first array with a single letter only, like 'a'.
	// however for the next array, try to fill it with your looping value (... ie. "i" in for (int i = 0; i < 10; i++)...)
	// see what happens - print out the results!





	//next try making another array of chars bigger than 100 or 200, and try filling it in the same way. 
	//what happens when you print out the values?





	return 0;
}

