#### More on Match-3s

![match 3 mechanics](http://www.gamelogic.co.za/images/MatchGamesInfographic.png)

Source: [Match Game Mechanics: An Exhaustive Survey](http://gamasutra.com/blogs/JonathanBailey/20150227/237544/Match_Game_Mechanics_An_exhaustive_survey.php)

Jesper Juul's paper [Swap Adjacent Gems to Make Sets of Three](http://www.jesperjuul.net/text/swapadjacent/)

#### A little more C++

Iostream, Curses, NCurses, Libtcod, etc.

##### Separate class files in iostream

If you've been doing any work in OpenFrameworks you know that normally our class files are separated into *header* (**.h** or **.hpp**) and *implementation* (**.cpp**) files. We haven't been doing much in the way of classes in our C++ code so far, but when we have, its all been part of the same file. If you want to pursue more essential C++ though, at some point you'll want to separate out your class files as well. Since we aren't using a full-featured IDE like Xcode in our experiments, this means we'll have to do everything manually, but this is a good exercise.

Check out the example in *separate-class-files* and note the ```#ifndef``` and ```#include``` and other preprocessor statements.

##### Makefiles

If you're dealing with multiple class files as you would with an ordinary C++ program of any complexity, it can become a hassle to compile. 

Compiling a single file on the command line is no problem, as we've been doing so far :

```g++ sourcefile.cpp -o myprogram```

But if you have classes and classes to deal with, that quickly turns into:

```g++ sourcefile.cpp someclass.cpp anotherclass.cpp bouncingball.cpp room.cpp player.cpp -o myprogram```

This is a good time to use makefiles. They are a way to compile quickly and automatically without needed to do it all by hand. Running ```make``` on the command line will have the program look for a file named **makefile** in the current directory and execute it. You can also call a specific makefile with ```make -f MyMakefile```.

For a simple example like the program above, our makefile would look like this:

	all:
		g++ sourcefile.cpp someclass.cpp anotherclass.cpp bouncingball.cpp room.cpp player.cpp -o myprogram

Then if the makefile is just called "makefile" we can just run ```make``` in the directory, or ```make -f MyMakefile```for a custom name, and it will compile it for us. 

[Additional info](http://mrbook.org/blog/tutorials/make/)




#### Intro to Roguelikes

#### Alt grids

http://auntiepixelante.com/emotica/acitome.html

https://twitter.com/crashtxt

[You wake on a grassy plain. windswept. blustered. empty.](https://vine.co/v/OlQgVPOTXUx)

