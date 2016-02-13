//-----------------------------------------------------------------------------------------------------------
// GAME AESTHETICS: C++ Text Parser Part 1
//-----------------------------------------------------------------------------------------------------------

#include <iostream>
#include <cctype>
#include <string>

using namespace std;

// here we're going to start writing a simple parser using what we have access to with simple C++ stuff.
// unlike javascript or java/Processing or OF methods we don't have very good ways to split strings or find substrings.
// we're going to use the cctype and string C++ libraries to give us some simple options though.

// here we will use:

	// toupper(charVariable)	- transform the charVariable into an upper case one. 
	//							- this way we can remove case-sensitivity from our parser and only handle all-capitals.

	// stringVariable.size()	- we can get the length of a string this way - that is, how many characters.
	//							- its kind of like getting the size of an array, as strings are basically arrays of chars

	// stringVariable.at(index) 	- get the character at position "index" in our string. 
	//								- remember, strings are basically arrays of chars.

int main() 
{
	//we want everything to be uppercase, so we can identify strings that we want easily.
	cout << "type something: ";
	string answer;
	cin >> answer;
	cout << "you responded: " << answer << "\n";

	//loop through the entire string, convert it character by character
	//answer.size() gives us the whole size of the string, which is perfect to plug into the loop.
	//then we access each char individually with answer.at(i) and change it to uppercase.
	for (int i = 0; i < answer.size(); i++) {	
		cout << "converting letter " << answer.at(i) << "\n";
		answer.at(i) = toupper(answer.at(i));
	}
	cout << answer << endl;

	// EXERCISE:___________________________________________________
	// try storing multiple words in "answer instead of just one". see what happens.




	// cin will be inadequate for what we need to do!
	//_____________________________________________________________

	return 0;
}

