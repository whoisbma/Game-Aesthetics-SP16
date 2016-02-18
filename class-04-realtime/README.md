#### More on Match-3s

The image below is from a great case study on match 3 games and common game mechanics. 

That said, take it with a grain of salt as any studies like these are sort of necessarily conservative. 

Source: [Match Game Mechanics: An Exhaustive Survey](http://gamasutra.com/blogs/JonathanBailey/20150227/237544/Match_Game_Mechanics_An_exhaustive_survey.php)

![match 3 mechanics](http://www.gamelogic.co.za/images/MatchGamesInfographic.png)

Also check out Jesper Juul's paper on the topic: [Swap Adjacent Gems to Make Sets of Three](http://www.jesperjuul.net/text/swapadjacent/)

#### Separate class files in iostream

If you've been doing any work in OpenFrameworks you know that normally our class files are separated into *header* (**.h** or **.hpp**) and *implementation* (**.cpp**) files. We haven't been doing much in the way of classes in our C++ code so far, but when we have, its all been part of the same file. If you want to pursue more essential C++ though, at some point you'll want to separate out your class files as well. Since we aren't using a full-featured IDE like Xcode in our experiments, this means we'll have to do everything manually, but this is a good exercise.

Check out the example in *separate-class-files* and note the ```#ifndef``` and ```#include``` and other preprocessor statements.

#### Makefiles

If you're dealing with multiple class files as you would with an ordinary C++ program of any complexity, it can become a hassle to compile. 

Compiling a single file on the command line is no problem, as we've been doing so far :

```g++ sourcefile.cpp -o myprogram```

But if you have classes and classes to deal with, that quickly turns into:

```g++ sourcefile.cpp someclass.cpp anotherclass.cpp bouncingball.cpp room.cpp player.cpp -o myprogram```

This is a good time to use makefiles. They are a way to compile quickly and automatically without needed to do it all by hand. Running ```make``` on the command line will have the program look for a file named **makefile** in the current directory and execute it. You can also call a specific makefile with ```make -f MyMakefile```.

For a simple example like the program above, our makefile would look like this:

	all:
		g++ sourcefile.cpp someclass.cpp anotherclass.cpp bouncingball.cpp room.cpp player.cpp -o myprogram

Then if the makefile is just saved as "makefile" we can just run ```make``` in the directory, or ```make -f MyMakefile```for a custom name, and it will compile it for us. 

[Additional info](http://mrbook.org/blog/tutorials/make/)

#### Text-based user interfaces

With iostream we've more or less been working with an extremely rudimentary loop of text-based input-output. For interactivity between a user and the computer, this is the most fundamental we can get. The next step up is something (retroactively!) called a **text-based user interface** (TUI), and some examples of which should be pretty familiar looking, if you grew up with computers at all or ever had to navigate your PC's BIOS growing up.

Text-based user interfaces are different from what we've been doing with iostream. Iostream is still giving us a text-based interface, but it processes events and operates sequentially, as we've seen. A TUI on the other hand might let us use the keyboard to move a cursor around a field and select text based options, or even use the mouse. It takes real time input and not just is an interface to write to variables directly via console in commands or the like. In other words, its pretty similar to what we think of when we think about user interfaces now. 

![bios](https://upload.wikimedia.org/wikipedia/commons/0/05/Award_BIOS_setup_utility.png)

*BIOS (Basic Input/Output System): firmware used to perform hardware initialization during the start-up process on IBM PC compatible computers, and to provide runtime services for operating systems and programs.*

![MS Exchange](http://toastytech.com/guis/textexchangedos.png)

*Microsoft Exchange client for DOS, a text based e-mail program.*

##### Curses


#### Intro to Roguelikes

#### Alt grids

http://auntiepixelante.com/emotica/acitome.html

https://twitter.com/crashtxt

[You wake on a grassy plain. windswept. blustered. empty.](https://vine.co/v/OlQgVPOTXUx)

