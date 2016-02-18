### Text-Based User Interfaces / Proc Gen part 1

Today we'll be looking our match 3 code from last week, doing a tiny bit more C++, and then doing an aesthetic! study of non-sequential text-based user interfaces. We'll be treating text and character symbols more broadly as medium, and examining historical applications both in practical software and in expressive work. ***[You wake on a grassy plain. Windswept. Blustered. Empty.](https://vine.co/v/OlQgVPOTXUx)***

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

![Curses](https://upload.wikimedia.org/wikipedia/en/c/cd/Fmli_lu.PNG)

![Curses](http://bhepple.freeshell.org/dcalc/unix/screenshot.gif)

Curses is a terminal control library and API for Unix and Unix-like systems (OSX, Linux, BSD, etc.), and allows for the construction of TUI applications.

Curses is of particular relevance to digital game history. It was written by Ken Arnold who used it to create **Rogue**, a dungeon crawling game that has gone on to spawn genres and subgenres and sub-sub-genres.

![Rogue!](http://infofarmer.github.io/ebsdc12/Rogue_Unix_Screenshot_CAR.png)

From [wikipedia:](https://en.wikipedia.org/wiki/Curses_(programming_library))

> Curses is designed to facilitate GUI-like functionality on a text-only device, such as a PC running in console mode, a hardware ANSI terminal, a Telnet or SSH client, or similar.

> Curses-based programs often have a user interface that resembles a traditional graphical user interface, including 'widgets' such as text boxes and scrollable lists, rather than the command line interface (CLI) most commonly found on text-only devices. This can make them more user-friendly than a CLI-based program, while still being able to run on text-only devices. Curses-based software can also have a lighter resource footprint and operate on a wider range of systems (both in terms of hardware and software) than their GUI-based counterparts. This includes old pre-1990 machines along with modern embedded systems using text-only displays.

Curses and its offshoots (especially Ncurses) is still used today to create **"rogue-likes"** and other text-based applications.

Conio.h is its MS-DOS analogue.

##### ZZT

![ZZT](http://i.kinja-img.com/gawker-media/image/upload/x4ujtucwz6etb6ed8n7m.gif)

![ZZT](http://www.myabandonware.com/media/screenshots/z/zzt-1b5/zzt_3.gif)

![ZZT](http://i.gayriots.com/zzt/town/zzt_018.png)

ZZT is a game and scripting environment created in 1991 by Tim Sweeney, who founded Epic (yeah, [that Epic](https://www.unrealengine.com/what-is-unreal-engine-4)).

ZZT uses ANSI, an extended version of ASCII, more flexible because of symbols intended for drawing. You could even color the background with it.

ZZT was popular despite its visual simplicity (especially for 1991), largely because of the integration of an object-oriented scripting language called ZZT-OOP. ZZT turned into a community that still has activity around it, all because of the level editor.

Check out an excerpt of Anna Anthropy's [book on ZZT](http://bossfightbooks.com/products/zzt-by-anna-anthropy) [here](http://auntiepixelante.com/?p=2103)

Also the blog companion piece to the ZZT book, [Unlawful Invisibles](http://unlawfulinvisibles.tumblr.com/).

[JZT, a browser-based homage to ZZT](http://jzt.xyz/)

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

#### Unicode art / մղìçօժҽ ąɾէ / u̷̥̖̰̱̯̺̱̓́́̐̕n̴̨͇͔͕̜̩̭̯̩͖̫̟̋͜͠i̸̢̼̙̯͙̪̙͇̳̊͜c̷̣͈̞̍̓̇̽͜͝ò̴͕̞̼͍̖̠̘̬͒͛̔̇̂̂́͘͜d̵͈̞͋̀͗̏̔̎̑̑͑̃̃͜e̷̢͍̫͖̗͈̹̰͓̓̌ ̶̧̙̪͚̣͓͍͖̳̗̥̇̓́̀a̶̛͍͔̥̭͆̈́͑͐̿̋͛r̷̛͎̲͇̦̮̍̿͐t̷̥̟͋̋̓͗̄͌̒͒̐͒̿

Unicode is a different dimension than ASCII. 120,000 characters. This is also why you don't see as much of a coherent community around it compared to ASCII or its contemporaries - its constraints are much less appreciable, and it is always growing.

[crashtxt](https://twitter.com/crashtxt)

And related, but more, is...

#### Emojis

With the new ubiquity of Emojis, there is something of a return to character grid aesthetics.

![Emotica](http://auntiepixelante.com/emotica/screen.png)

[Emotica](http://auntiepixelante.com/emotica/acitome.html) by Anna Anthropy, Leon Arnott, and Liz Ryerson

We'll also look more at Emoji later in some other contexts.

#### Rogue and Random Walkers

*Although we'll be talking much more about roguelikes next week, for the rest of the class we'll be exploring one aspect of them in particular.*

![Rogue](http://tripalot.com/roguelike/img/rogue.gif)

Rogue was written in 1980 by Michael Toy, Glenn Wichman and Ken Arnold for Unix, and was a favorite on college Unix systems in the early 1980s. It's a humble-looking "dungeon crawler" with deceptive implications.

Rogue clones can now be found for nearly every existing platform, even graphing calculators:

![CalcRogue](http://s.uvlist.net/l/y2008/07/51645.jpg)

You can also [grab it on iOS](https://itunes.apple.com/us/app/rogue/id298113808?mt=8&ign-mpt=uo%3D4), with a tileset mode:

![ios Rogue](http://cdn.toucharcade.com/wp-content/uploads/2008/11/rogue.gif)

From [RogueBasin](http://www.roguebasin.com/index.php?title=Rogue):

> Rogue's storyline was very light: the point of the game was to go down all levels of a dungeon, in a world based on Dungeons & Dragons, starting from the top, killing monsters and plundering treasures, until finding the Amulet of Yendor. Then, the player had to climb every level up.

> It was one of the first games to use a spatial representation of the world where the action unfolded instead of textual descriptions - the authors sought to combine a traditional "dice" RPG with the original Crowther/Woods interactive fiction game Colossal Cave Adventure. This was possible using a C function library called Curses, and this brought important advancements into the cRPG and in general PC gaming genre.

> Contrary to many other computer RPGs of the time, all levels were randomly generated. Rogue was intended to be played on Unix terminals. Thus, the dungeon was displayed in text mode, characters and monsters being represented by letters. Actions were issued by single keystrokes. Rogue defined the very roguelike genre. Random generation, basic plot, text (or tiled) based display still are the usual features of roguelikes.

Some important takeaways from what Rogue offered game mechanics, and why they are still played today:

* Randomly generated = the possibility of continual newness. Compare to games where the worlds are explicitly designed - Mario doesn't really feel the same once you know the levels inside and out.

* Mechanics = lots of interaction between objects, the player, AI, and the environment.

* Minimalist presentation and visual feedback = focus on the mechanics, and allows for lots of mechanics without feeling bloated.

#### Brogue

An excellent contemporary text-interface Roguelike: [Brogue](https://sites.google.com/site/broguegame/)

![Brogue](https://308192c9-a-62cb3a1a-s-sites.googlegroups.com/site/broguegame/home/Torchlit%20staircase.png?attachauth=ANoY7colzCm13qdlz6wPXwnQNQnd0I7VV-R_TN7F5kdWgNXED-maCV6lnKHfwQVyL_LVhP_YOgnad-md-9IlsXd8E4eyy89XF37zYIZwKgpbKWnKMKPa1cMF-kVHH6uBELWZ0vVyk0Y8U8mB-LPbizR9wd46gRrBEbIla8-Qouw_x7-p8UcR5PgWderkQ1DpkWNCNgbbPENM9-WifmvnSbKLS8mGhBz9heVpMm_FopTbwwz04V6704c%3D&attredirects=0)

#### Char array as screen

An aside: play Passage.

#### HW

HW: use processing, openframeworks, or p5.js to create a text-based user interface out of an array of chars. Use your random walk approach to carve out a path and make an object move around on screen and interact with things.

**suggestions: **

* create your own font.
* try a crazy font. zapf dingbats or whatever. 
* Use classes for a player object and other objects in the world.
* Combine/mix up/hack the relationship of the two forms of text we're concerned with: text/char as spatial metaphor vs. text's relationship to language
* Don't limit yourself to the explicit grid. Use it as a starting point. Remember you're emulating a TUI to explore its formal qualities, but there's room for a remix. 
* When representing space, think about Passage's approach - past vs. future - and how the screen represents this in a metaphor. How else can you metaphoricize space with a grid of characters?