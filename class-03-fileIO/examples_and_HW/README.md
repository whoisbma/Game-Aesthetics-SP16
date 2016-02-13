### Class 3 Homework

*-----Due before class, 2/18/16-----*

**Push all your code to your own repo in directory "class-03".**

**Submit your github repo link to the wiki.**

**If you haven't caught up on the homework from week 2 (including playing the games!), please do so - we'll chat more in class. I will also post code going over some solutions to the example questions.**

#### 0: Play!

Play **at least TWO** of the following!

Think how you would implement the game's mechanics in C++.

* [**Triple Town**](http://spryfox.com/our-games/tripletown/) - [iOS App Store link](https://itunes.apple.com/us/app/triple-town/id490532168?mt=8&ign-mpt=uo%3D4) - An *excellently* balanced match-3 game. Well worth the few bucks for the unlocked mode, but not necessary to get the idea.

* [**Pox**](http://www.tiltfactor.org/game/pox/) - [iOS App Store link](https://itunes.apple.com/us/app/pox-save-the-people/id475604824?mt=8) - The grid... for good?? By Mary Flanagan's Tiltfactor lab.

* [**Threes**](http://asherv.com/threes/) - [iOS App Store link](https://itunes.apple.com/us/app/threes!-free/id976851174?mt=8) - [Browser version](http://threesjs.com/) - Compare Threes' mechanics to [2048](http://2048game.com/), arguably a simultaneously lower quality yet more-flow inducing ripoff.

* [**Drop 7**](http://areacodeinc.com/projects/drop7/comment-page-1/) - [iOS App Store Link](https://itunes.apple.com/us/app/drop7/id425242132?mt=8) - An excellent game by local developers, I still am playing it years later. Check out Darius Kazemi's [Drop 7 bot](http://tinysubversions.com/game/dropN/).

#### File IO experimentation

Starting with *04-bmp_read_3.cpp*, continue with the in-class experimentation of using a hand-drawn bitmap to load into data. 

So far we were using our bitmaps to fill an array of raw data, then directly fill an array of chars that we would then draw to the terminal. Moving on from this, use your bitmaps to represent different kinds of information, like arrays of ints, strings, and custom objects. 

**Suggestions:**

* *Create an object called LandType, with a string for a description and whatever other data you want to store. Use it in your text adventure engine from the prior week.*

* *Try loading multiple bitmaps, and load custom objects properties with one per bitmap. For example, each object could represent a creature of some kind, and you would fill an array of chars from the bitmap to store a visual representation of its "face". Then when the user is interacting with that character, you would draw that particular "face" to the terminal.*

If you're interested in this, you can easily find much [more sophisticated methods](http://tipsandtricks.runicsoft.com/Cpp/BitmapTutorial.html) of parsing a bmp in C++. The version we looked at in class is extremely simple and flawed - we'll have to stick to very simple bmps (4x4, 8x8, 16x16) - remember to also flip the row order.

#### Match-3 hacking

Starting with *05-match_3_game.cpp*, go through the code and make comments anywhere you don't understand things. The code is too bare-bones to be thought of as a complete game. Try the following:

* *Make sure you can only swap with ADJACENT positions. Currently we can swap everywhere. In order to do this, you'll need to have an if statement checking to see if the position of the swapped character is identical to ones next to it by checking -1 in the x, +1 in the x, -1 in the y, +1 in the y, and combinations of them if you want diagonals.*

* *Make the match mechanic destroy ONLY matching chars. Currently it destroys a huge block of chars. You'll need to add a similar if statement as above. A related issue is making sure that the destruction doesn't flow over the end/beginning of the arrays.*

* *If the user doesn't make a match successfully, reverse the swap action. Currently it doesn't matter if there is a match or not - a swap is a swap. To do this, just repeat the original swap.*

* *Add a win state. This could be about eliminating all of a certain character in your arrays, eliminating the board completely, or something else.*

* *Finally, go back to our "tile editor", and create a number of experiments with different amounts of colors in the bmp, creating different char values in the game. Create bmps that allow you to complete the game according to your win state, and bmps that don't. Try all sorts of patterns and see how it informs your interaction when you actually play it. Try a 16x16 grid too.*

I believe many of you will have some trouble with this. If enough people want it, we can meet to review this before next class, potentially as a group. Send me an email. However if you're comfortable with the above, try these advanced suggestions. 

**Advanced suggestions:**

* *Our matching algorithm is extremely rudimentary. Try implementing a recursive function to actually do adjacency tests properly.*

* *Add a lose state. Think about how you might do this.*

* *Add tile "physics" - make tiles fall down if there is an empty space under them.*

#### BONUS

Write your own file input/byte parsing algorithm for another type of file in C++. 

Try a text file, xml, or json for something simple.

For the brave, a [tga file](http://paulbourke.net/dataformats/tga/) - easier than a bmp, much easier than a png.

