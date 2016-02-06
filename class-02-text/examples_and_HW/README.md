### Class 2 Homework

*-----Due before class, 7 PM, 2/11/16-----*

**Play at least one of the listed games, and to get as far down the list of code homework as possible. Push all your code to your own repo called class-02 or similar, and submit your github repo link to the wiki.**

#### 0: Play!

[Device 6](https://itunes.apple.com/us/app/device-6/id680366065) - Device 6 costs a few dollars on the app store and is well worth it. Pay attention to the following:

* how the game uses and evokes a sense of space
* how the game makes use of text and the spatiality of text

[With Those We Love Alive](http://aliendovecote.com/uploads/twine/empress/empress.html) - If you play this, do what it asks about creating marks outside of the game. You'll see.

[Depression Quest](http://www.depressionquest.com/) - When playing this, think about metaphors via agency, control vs. the illusion of control in virtual worlds.

#### 1: Array Review

If you need practice with arrays, go through each array review code and do the exercises. Push the modified code to your repo.

#### 2: Parser

Run through each of the parser examples, doing the exercises.

After you finish the last parser example, modify the parser so that it can handle three words, or it trims out everything but the first word and the last word. i.e. “Take the gem” → “TAKE GEM”

#### 3. Moving around the map

Continue what we started in class with map1.cpp. 

Build a whole map out of the 2D array, allowing access for certain pathways. Give each room a description.

Draw it out on paper as well.

Use the parser to recognize certain commands beyond NORTH EAST WEST SOUTH. Give different results in different rooms. Be creative! 

**Some suggestions:**

* *fill some rooms and not others, give each room a description. let the player navigate around, making sure they can’t go into the unoccupied rooms.*

* *Use iostream (cout) to draw the player’s position in a map made of chars representing different types of spaces.*

* *Create an illogical space, where going north from area A takes you to area B, but going south from area B does not take you back to area A.*

#### 4: Narrative

With your map, fill out the world space to give the player some idea of a space and setting. Don't be generic - be creative!

**Suggestions:**

* *give the player the role of an inanimate object, a force of nature, or an abstract concept. Try using commands that are not associated with human actions - instead of GET SAY OPEN etc. try something more abstract, or exotic.*

* *don’t use N S E W directions - use a more abstract method of exploring the space. be creative. use spatial dimensions to store the data, but don’t give the player access to that way of thinking about it.*

* *use the map to, instead of representing space, represent a character with a dialogue tree. use the array to navigate the dialogue as if it was a map. each “direction” should represent different things you say. Try to make a coherent system out of it.*

#### 5: Structure (optional)

**Try these if you're comfortable with the above!**

* *create an object that moves around the map (like our bouncing ball, for example), and changes the description you see in each of the rooms. in the room’s getDescription() function there should be a check to see if the object is present, and add a string to the description cout << if it is true.*

* *create a player object that stores which map positions he/she has already been to. try a boolean array. if the player has already been to a space, the description for each space should change.*

* *create an array of booleans corresponding to the map array that reflects some quality about the space. each room space allows the player to do something in the space that will change the boolean condition for each room. for example, each room could have a light switch that turns on and off the lights in the room.*

* *create an inventory - let the player TAKE/GET things that are in rooms. Try to let the player use items from their inventory on the environment. have rooms “know” what the player has in their inventory to reflect the state of the room (if the player has that object, that means the room doesn’t have it any more).*

* ***ADVANCED**: add a subclasses to Room - have the subclass inherit from Room. that way you can have an array of rooms, but each having their own properties entirely unique to them. you’ll need to search for how to do this, in C++ polymorphism is tricky and requires knowledge of pointers.*

#### 6: Porting (optional)

Convert your code to Processing or OF or p5.js using the main window rather than console output. 

Be creative with how you display the text!


