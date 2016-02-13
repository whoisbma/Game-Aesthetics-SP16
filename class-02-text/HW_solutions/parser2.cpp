//-----------------------------------------------------------------------------------------------------------
// GAME AESTHETICS: C++ Text Parser Part 2
//-----------------------------------------------------------------------------------------------------------

#include <iostream>
#include <cctype>
#include <string>

using namespace std;

// here we will use:

	// getline(cin, stringVariable)	- we'll have a problem if we want to use "cin >>" to get multiple strings..
	//								- by default it will only grab the first one we input on any line.
	//								- getline is a way we can grab the whole thing.


int main() 
{	
	// "cin" is no good with multiple words! we want multiple commands to parse.
	// what happens if we combine cin and getline()?
	cout << "write at least two words: ";
	string answer;
	cin >> answer;
	cout << "\nFirst word was " << answer << "\n";
	getline(cin, answer);
	cout << "followed by: " << answer << "\n";

	//this is weird. This isn't exactly what we want. What happens if we wrote three words for example?
	//its also confusing to combine cin and getline(cin, answer).
	//theres some stuff going on behind the scenes with cin that we probably don't understand fully.

	//if we omit our cin >> answer step, getline(cin, answer) will just give us the whole thing.
	string name;
  	cout << "Please enter your full name: ";
  	getline (cin,name);
  	cout << "Hello, " << name << "!\n";

  	//we'll also convert everything to caps like we did before:
	for (int i = 0; i < name.size(); i++) {
		name.at(i) = toupper(name.at(i));
	}
	cout << "Converted name: " << name << endl;


	//EXERCISE_____________________________
	//write out in psuedocode how you would split a string of two words, three words, or more, into an array of separate strings.
	//for example, "nice day today" would become {"nice", "day", "today"}
	//the key is isspace(charVariable). try it out and see how it works.
	//
	//
	//psuedocode:
	//
	//
	//
	//experiment with isspace(charVariable)
	//
	//
	//
	//______________________________________

	return 0;
}