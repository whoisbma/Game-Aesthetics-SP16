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

Many heavily used TUIs came about after GUIs had already been in use for years, and were very much influenced by them, having pull down menus, etc. In addition, many embedded systems still use TUIs.

![bios](https://upload.wikimedia.org/wikipedia/commons/0/05/Award_BIOS_setup_utility.png)

*BIOS (Basic Input/Output System): firmware used to perform hardware initialization during the start-up process on IBM PC compatible computers, and to provide runtime services for operating systems and programs.*

![MS Exchange](http://toastytech.com/guis/textexchangedos.png)

*Microsoft Exchange client for DOS, a text based e-mail program.*

![Visual Basic](http://toastytech.com/guis/textvbdos.png)

*Visual Basic for DOS, a programming environment*

![TempleOS](http://images.vice.com/motherboard/content-images/contentimage/17117/141686640013333.gif)

*TempleOS - a hobbyist OS made by a single person suffering from schizophrenia as an expression of spirituality*

*See also: [God's Lonely Programmer](http://motherboard.vice.com/read/gods-lonely-programmer)*

##### Commodore 64

![C64](http://www.commodore64.org/c64screen.gif)

The Commodore 64 was an extremely influential home computer released in 1982.

The Commodore 64 was very notable at its time for allowing users to move the cursor over the entire screen area, entering and editing BASIC program code, also taking direct commands.

It used PETSCII, a character set analogous to ASCII for the C64, which included semi-graphics characters allowing for a higher degree of sophistication in visual representation with text. The earlier Commodore PET (1977) was one of the first systems to rely heavily on semigraphical characters to get any form of graphics on screen.

![PETSCII symbols](https://upload.wikimedia.org/wikipedia/commons/thumb/d/db/PET_Keyboard.svg/1280px-PET_Keyboard.svg.png)

##### Curses

Curses is a terminal control library and API for Unix and Unix-like systems (OSX, Linux, BSD, etc.), and allows for the construction of TUI applications.

Curses is of particular relevance to digital game history. It was written by Ken Arnold who used it to create **Rogue**, a dungeon crawling game that has gone on to spawn genres and subgenres and sub-sub-genres.

From [wikipedia:](https://en.wikipedia.org/wiki/Curses_(programming_library))

> Curses is designed to facilitate GUI-like functionality on a text-only device, such as a PC running in console mode, a hardware ANSI terminal, a Telnet or SSH client, or similar.

> Curses-based programs often have a user interface that resembles a traditional graphical user interface, including 'widgets' such as text boxes and scrollable lists, rather than the command line interface (CLI) most commonly found on text-only devices. This can make them more user-friendly than a CLI-based program, while still being able to run on text-only devices. Curses-based software can also have a lighter resource footprint and operate on a wider range of systems (both in terms of hardware and software) than their GUI-based counterparts. This includes old pre-1990 machines along with modern embedded systems using text-only displays.

Curses and its offshoots (especially Ncurses) is still used today to create **"rogue-likes"** and other text-based applications.

Conio.h is its MS-DOS analogue.

##### ZZT


#### Raquel Meyers

![Raquel Meyers](http://www.creativeapplications.net/wp-content/uploads/2011/09/2sleep13.png)

Artists like [Raquel Meyers](http://www.raquelmeyers.com/) more or less exclusively work with ASCII and PETSCII-style characters. 

> "Instead of drawing pixels, I type characters and symbols on the keyboard. The way of thinking and imaging changes completely, there is no pixels or blocks anymore only the characters set, and I don’t really need anything else. It’s really direct, since you have all the symbols directly on the keyboard. Start the computer and after a second you can start making graphics if you want. So far PETSCII and Teletext are my favourite text modes."

> "Text graphics is the world we live in. When we communicate with others, we still do it mostly through text. Social media, searches, databases, SMS, etc. Text is still a very fundamental part of the digital. In fact, text-mode is sort of a symbol for hardcore computing. Hex editors, command line prompts and programming languages are all text. And they are a key to get closer to the machine. That’s one reason that the 8-bit stuff is so popular. ... But, for me, the most important thing is that it feels good to do it."

[Үеtі Βаd ̬Ԍ̡᷂υу Р҃οlk̂a](https://vimeo.com/106280958)

[Vladijenk II (The corroded mainframe at Tartarus edition) live](https://vimeo.com/144860400)

She also argues for the formal aesthetic values of mediums like teletext and ASCII.

> "This chapter looks at teletext from the perspective of an artist and of its artistic value. It is argued that teletext is not just news on demand provided by television networks or a character set, and that it is about much more than nostalgia, profit, constraints, domesticity or zombie technology stored in a garage, because teletext performs in ways we have not fully designed it for and not yet fully understood. Teletext is compared to brutalist architecture with which it shares many similarities: text is used unadorned and roughcast, like concrete. Brutalism has an unfortunate reputation of evoking a raw dystopia and teletext evokes an “object of nostalgia,” It is a challenge and has the universal language of silence. The text further argues that using old technologies, like teletext, is a commitment that is at the same time a risk because it does not seek to forge a self-identity. It is a dialogue of possibilities rather than an ego-trip monologue with technology. And these possibilities are irrelevant to the individual’s self-identity and pursuits. Finally, the chapter also explores how teletext is not a physical object; it is the dark band dividing pictures horizontally on the television screen, used by the PAL system. Vertical-blanking-interval lines like REM (rapid eye movement) sleep intervals. A door to unlock the Imagination."

[Raquel Meyer's and GOTO80's Text-Mode tumblr](http://text-mode.tumblr.com/)

#### Emoji

http://auntiepixelante.com/emotica/acitome.html

https://twitter.com/crashtxt

[You wake on a grassy plain. windswept. blustered. empty.](https://vine.co/v/OlQgVPOTXUx)

#### Intro to Roguelikes