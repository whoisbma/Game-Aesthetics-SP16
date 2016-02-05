//-----------------------------------------------------------------------------------------------------------
// GAME AESTHETICS: Array Review part 1
//-----------------------------------------------------------------------------------------------------------
// its super important that we understand these basics.
// otherwise we'll have a ton of trouble getting anywhere in this class.
// spend the time to go through the code and do all the exercises!
//-----------------------------------------------------------------------------------------------------------

#include <iostream>
// <iostream> is a basic C++ library that lets us print out in terminal and also take in input from the user! 

using namespace std;
//-----------------------------------------------------------------------------------------------------------
// this command lets us call things like "cout" and "cin" without a namespace prefix.
// without it we would have to write "std::cout and std::cin and std::endl".
// this is just a convenience thing for us. not a huge deal.


// all of our C++ code that will execute will be in our int main() function, 
								// and it has to return a number! 0 is normal.
int main() 
{
			//----------------------------------------//
			//       1 DIMENSIONAL ARRAYS 			  //
			//----------------------------------------//

	//-----------------declaration without initialization:----------------------------------------
	
	//these arrays have no explicit initialization.
	int tenInts[10];
	int fiveInts[5];
	int lotsOfInts[100000]; 
	//This means we have reserved space in memory for them- but we have not given them any values!
	
	//we could also say this if we wanted to:
	int foo[5] = {};
	//which is the same thing as just writing:
	int bar[5];
	//we haven't given either any values, but we say the array is 5 positions long.

	//THINK ABOUT IT:
	//what do you think would happen if we ran "cout << tenInts[0]"? or "cout << tenInts[9]"?
	//what about "cout << tenInts[10]"?

	//EXERCISE:
	//make four new arrays, one of bools, one of floats, and one of chars.
	//you would do so like this: 
		//"(data type) (array name)[(array size)]"
	//make them whatever size you want, but don't initialize them with any values.
	//then use "cout << (your array value)" to try to see the default value at different positions in your different arrays.
		
	//your code here---------------------------

		//declare new arrays here:





		//test array values here:





		//write here in comments what results you got for each test.



	//-----------------------------------------


	return 0;	//we have to return a number in C++ main()
}

//now compile and run, and see your results!
// in terminal:
// g++ array_review_1.cpp -o array_review_1
// ./array_review_1