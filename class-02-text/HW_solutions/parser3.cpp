//-----------------------------------------------------------------------------------------------------------
// GAME AESTHETICS: C++ Text Parser Part 3
//-----------------------------------------------------------------------------------------------------------
#include <iostream>
#include <cctype>
#include <string>

using namespace std;

// here we will use:
	
	// isspace(charVariable)	- here we can find out if the char variable is a space.
	//							- we'll use this to split our string.
	//


int main() {
	string command;
  	cout << "Type a command: ";
  	getline (cin,command);
  	cout << "\n";
	for (int i = 0; i < command.size(); i++) {
		command.at(i) = toupper(command.at(i));
	}
	cout << "Converted command to all caps: " << command << endl;

	string word1 = "";
	string word2 = "";
	char c;	//we'll use c to store the current character and see if its a space.
	for (int i = 0; i < command.size(); i++) {
		c = command.at(i);	//get the current character,
		if (isspace(c) && word1 != "") { //if the character is a space and word1 isn't empty,
			break;	//break out of the for loop.
		} 
		if (!isspace(c)) {  //if its a letter, 
			word1 += c;     //add the char to word1. we can use += here! 
		} 
	}

	//here we'll loop again, but starting from the end of word1!
	for (int i = word1.size(); i < command.size(); i++) {
		c = command.at(i);
		if (!isspace(c)) { //if the character isn't a space, add it to word 2.
			word2 += c;
		} 
	}

	cout << "word 1 is: " << word1 << endl;
	cout << "word 2 is: " << word2 << endl;

	//EXERCISE:___________________________________
	
	//1:
	//what happens if you enter more than two words?
	//try to solve this in two ways:

			//------------------------------------------------------
			// - only accept the first two words of any command.
			// - one solution:
				// the same thing we did with word one. 
				// check to see if we've hit a space while adding to the second word.
				// if we have, break out of the for loop!
		word1 = "";
		word2 = "";
		cout << "Type a command: ";
  		getline (cin,command);
  		cout << "\n";
		for (int i = 0; i < command.size(); i++) {
			command.at(i) = toupper(command.at(i));
		}
		cout << "Converted command to all caps: " << command << endl;

		for (int i = 0; i < command.size(); i++) {
			c = command.at(i);	
			if (isspace(c) && word1 != "") { 
				break;	
			} 
			if (!isspace(c)) {   
				word1 += c;     
			} 
		}

		for (int i = word1.size(); i < command.size(); i++) {
			c = command.at(i);
			if (isspace(c) && word2 != "") {	//****
				break;							//**** solution
			}									//****
			if (!isspace(c)) { 
				word2 += c;
			} 
		}

		cout << "word 1 is: " << word1 << endl;
		cout << "word 2 is: " << word2 << endl;

			//------------------------------------------------------
			// - only accept the first and last words of any command.
			// - solution:
				// do the same thing as we did before, but loop backwards through the string to add to the second word.
				// in addition, we need to flip the letters around since we're looping backwards.
				// therefore, we add the letters to a temporary word, then loop through it backwards to add to our final word.
		word1 = "";
		word2 = "";
		string tempWord2 = "";	//*****	//temporary word for getting backwards letters
		cout << "Type a command: ";
  		getline (cin,command);
  		cout << "\n";
		for (int i = 0; i < command.size(); i++) {
			command.at(i) = toupper(command.at(i));
		}
		cout << "Converted command to all caps: " << command << endl;

		for (int i = 0; i < command.size(); i++) {
			c = command.at(i);	
			if (isspace(c) && word1 != "") { 
				break;	
			} 
			if (!isspace(c)) {  
				word1 += c;    
			} 
		}

		for (int i = command.size() - 1; i >= word1.size(); i--) {	//******	//looping through command string backwards
			c = command.at(i);
			if (isspace(c) && tempWord2 != "") {
				break;
			}
			if (!isspace(c)) { 
				tempWord2 += c;
			} 
		}

		//need to flip the letters in word 2 around
		for (int i = tempWord2.size()-1; i >= 0; i--) {		//*****	//loop through backwards word
			c = tempWord2.at(i);							//*****
			word2 += c;										//*****
		}

		cout << "word 1 is: " << word1 << endl;
		cout << "word 2 is: " << word2 << endl;

	//2:
	//make an array of strings that will get recognized by the parser, like "LOOK", "GO", "GET", etc.
	//loop through the array to see if the command is recognized, then use a switch to display a custom response.
		string terms[5] = {"GO", "GET", "TAKE", "LOOK", "FIGHT"};

		for (int i = 0; i < 5; i++) {
			if (word1 == terms[i] || word2 == terms[i]) {
				switch (i) {
					case 0:
						cout << "You go! Somewhere!\n";
						break;
					case 1:
						cout << "You got a thing!\n";
						break;
					case 2:
						cout << "You took a thing!\n";
						break;
					case 3:
						cout << "So much to see!\n";
						break;
					case 4:
						cout << "You flail impotently!\n";
						break;
					default:
						break;
				}
			}
		}


	//if you're comfortable with the above, try...
	//3: (ADVANCED)
	//if you're feeling brave, try to put this all into a function that will return an array of strings.
	//this is actually a trick question. but spend some time looking into why.
	//if you can't do it, psuedocode it, or try it in another language. look at how "split" works in processing for example.


		//****trick question! - you can't return an array of strings. 
			// you can return a POINTER to an array of strings. (*)
			// we aren't covering this in our C++ section. 
			// but if you take the time to look into these things you will be a stronger programmer for it.

	//_____________________________________________

	return 0;
}