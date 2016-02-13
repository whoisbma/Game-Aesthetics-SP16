//-----------------------------------------------------------------------------------------------------------
// GAME AESTHETICS: Array Review part 2
//-----------------------------------------------------------------------------------------------------------
#include <iostream>
using namespace std;


int main() 
{
			//----------------------------------------//
			//      MORE 1 DIMENSIONAL ARRAYS 		  //
			//----------------------------------------//

	//-----------------explicit initialization:----------------------------------------
	
	//we can also fill arrays manually, like so!

	int sixInts[] = {100,101,102,103,104,105};
	string greetings[] = {"hey", "hello there", "how are you?", "good afternoon"};
	char alphabet[] = {'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'};
	bool fiveBools[] = {false, true, true, true, false};
	float threeFloats[] = {0.2, 1.999993, 423.471};
	// you fill an array manually by separating the values by commas "," inside curly brackets "{}"

	// you can also write this to read things a little bit more easily if you want, like this:
	string goodbyes[] = {"so long",
						 "farewell",
						 "ta ta",
						 "take care",
						 "see you around"};
					// in the case of these long-ish strings, we can read them a little more easily.

	// these arrays doesn't specify how big they are in the square brackets []. they are all empty.
	// however the compiler looks at the amount of values in the square brackets, and sets the array size to match.
		//		for sixInts[]...
		//							{    0,     1,     2,    3,    4,    5     }
		//		number of positions is  one,   two,  three, four, five, six.
		//   
		//		for fiveBools[]...
		//				 			{  false,  true,  true,  true,  false   }
		//		number of positions is  one,   two,  three, four,  five.


	//-----------------accessing array values:----------------------------------------

	// once we've created an array, we can access any value in it. this means we can also change it.
	
	// print out the SIXTH value in sixInts, then end the line. (remember we start counting from 0!)
	cout << sixInts[5] << "\n\n";

	// print out the FIRST value in greetings, then end the line. what will it show?
	cout << "this is the value of greetings[0]:  ";
	cout << greetings[0] << "\n\n";

	// change the first value in greetings:
	cout << "changing value of greetings[0]..." << "\n\n";
	greetings[0] = "yo yo yo yoyoyoyoyo";

	// then print it out again.
	cout << "we changed the value of greetings[0] to: ";
	cout << greetings[0] << "\n\n";
	
	// now we'll change the value with another string variable we'll set up.
	string newGreetingValue = "hey hi hello what's up?!?";
	greetings[0] = newGreetingValue;
	cout << "we changed the value of greetings[0] yet again, to: ";
	cout << greetings[0] << "\n\n";

	// EXERCISE:
	// create two new arrays of the same data type. 
		// such as: char firstChars[] and char secondChars[]
	// fill them with values explictly. 
	// NEXT: swap values between them! how would you do that?
		// hint - you'll need a temporary third variable.

	//your code here---------------------------
		//declare two new arrays here:



		//swap all array values here:




	//-----------------------------------------

	return 0;
}