## Game Aesthetics: Intro
#### 1/28/2016

---

#### What is this class?

![The continuous](https://raw.githubusercontent.com/whoisbma/Game-Aesthetics-SP15/master/images/continuous_discrete.png "The continuous")

There are crazy powerful tools out there for game development. Ultimately though, behind any apparently continuous 3d space is a grid and discrete mathematics at its core. We’re going to focus on the ABCs of things like representing environments and building mechanics, the real bare structures behind things, and focus on making stuff for and with them. We won’t get distracted by smoke and mirrors, we’re going to deal with the foundations. (We’re going to be very very familiar with 2D arrays to represent data in this class!)

Part of what "game aesthetics" refers to for this class is this core centrality - the truth behind lots and lots of obfuscation and magic tricks. I want us to focus on systems, data, representation, interaction, and programming them well.

**A programming class first and foremost**

This class evolved from a series of game programming dorkshops I taught last year in MFADT. They were a testing ground to see how students would respond to a more rigorous kind of creative programming class.

Each dorkshop introduced a new classic game to deconstruct, understand, and recreate from the ground up in Processing. We used no game engines, no physics for collision detection, no shortcuts - we wrote these things all ourselves to gain a better appreciation for technical limitations and better insight into how these things really work, while understanding how to better structure systems in code.

We used Processing because Java is relatively elegant, its implementation via Processing is very clear, and it allowed us to focus on object oriented programming while abstracting things that we would need to spend bandwidth on if we were using C++, and so on. 

Asteroids: ![Asteroids](https://raw.githubusercontent.com/whoisbma/Game-Aesthetics-SP15/master/images/asteroids.gif "Asteroids dorkshop") Haxe: ![Haxe/Flixel](https://raw.githubusercontent.com/whoisbma/Game-Aesthetics-SP15/master/images/svenhead.jpg "Haxe/Flixel dorkshop")

Tetris: ![Tetris](https://raw.githubusercontent.com/whoisbma/Game-Aesthetics-SP15/master/images/tetris.gif "Tetris dorkshop") Platformer collision engine:![Platformer](https://raw.githubusercontent.com/whoisbma/Game-Aesthetics-SP15/master/images/platformer.gif "Platformer dorkshop") 

These dorkshops were made up of a lot of live coding and regularly went 1-2 hours over time. :/  

**An experimental reaction to creative coding pedagogy**

There’s two sides of the creative programming coin in some sense: one is don’t bother tackling things that have already been solved by people more capable than you, and instead focus on creative applications of those problems. The other is: DO tackle them because it will make you see the problems and the ways to apply the solutions creatively in new ways. This class is attempting to tackle the second perspective, and build some stuff from scratch.

#### Class Values

* Understand our tools better
* Limitations -> creativity
* Don't take the easy way out
* Don't resort to cliché
* Find the aesthetic possibilities in a myriad of formal constraints

#### What kind of aesthetics are you talking about?

First, the above - the core mathematical truths behind simulated experiences of reality. Next,

**Mechanics, Dynamics, Aesthetics**

[![Mechanics Dynamics Aesthetics](https://raw.githubusercontent.com/whoisbma/Game-Aesthetics-SP15/master/images/MDA.png "Mechanics Dynamics Aesthetics")](http://www.cs.northwestern.edu/~hunicke/MDA.pdf)

where “aesthetics” is defined as the psychological result of the interaction between the player and a game system - the phenomenological impact of a system on a user. The main idea here is that there can be “beauty” in systems and thus an aesthetic of systems. This is one kind of aesthetics that we’re concerned with. Click on the image to follow the link to the original paper.

**Abstract/symbolic representation**

![Symbols](https://raw.githubusercontent.com/whoisbma/Game-Aesthetics-SP15/master/images/symbols.jpg "Symbols")

Symbolic representation in games has come a long way. However, it also means that we have to contend with this problematic attitude:

> "Recreating a Mission Impossible experience in gaming is easy; recreating emotions in Brokeback Mountain is going to be tough, or at least very sensitive in this country... it will be very hard to create very deep emotions like sadness or love, things that drive the movies," he said. "Until games are photorealistic, it'll be very hard to open up to new genres. We can really only focus on action and shooter titles; those are suitable for consoles now. To dramatically change the industry to where we can insert a whole range of emotions, I feel it will only happen when we reach the point that games are photorealistic; then we will have reached an endpoint and that might be the final console."

This is the opposite of what we want. We want to explore what computer-generated symbols and signs phenomenologically afford - not just attempt to recreate reality.

In order to do this, we will be experimenting with historical constraints for representation. Ultimately, at their heart, computers don’t “want” to draw pictures - they want to crunch numbers. Historically, making them draw pictures has been hard, but there are still things to be learned in forced limitations - and our own technical skills here is a good limitation to embrace as we explore. 

**Some games to think about regarding our various ideas about "aesthetics":**

[![Passage](https://raw.githubusercontent.com/whoisbma/Game-Aesthetics-SP15/master/images/passage.png "Passage")](http://_)

Passage

[![Triad](https://raw.githubusercontent.com/whoisbma/Game-Aesthetics-SP15/master/images/triad.png "Triad")](http://_)

Triad

[![Starseed Pilgrim](https://raw.githubusercontent.com/whoisbma/Game-Aesthetics-SP15/master/images/starseedpilgrim.png "Starseed Pilgrim")](http://_)

Starseed Pilgrim

[![To Build A Better Mousetrap](https://raw.githubusercontent.com/whoisbma/Game-Aesthetics-SP15/master/images/mousetrap.png "To Build A Better Mousetrap")](http://_)

To Build A Better Mousetrap

[![868-Hack](https://raw.githubusercontent.com/whoisbma/Game-Aesthetics-SP15/master/images/868-hack.png "868-Hack")](http://_)

868-Hack

[![Problem Attic](https://raw.githubusercontent.com/whoisbma/Game-Aesthetics-SP15/master/images/problem-attic.png "Problem Attic")](http://_)

Problem Attic


#### What are we going to do in this class?

* Write a LOT of code in (C++, Processing/Java, possibly Javascript or Haxe)
* Understand the intersection of the medium (computers) and the design process
* Develop a better understanding of software architecture
* Learn algorithms for simulation, game mechanics, input handling, and processing and representing data
* Understand game frameworks better, know how to use them better
* Hack existing code, reverse engineer classic games, study some history

#### What AREN'T we going to do in this class?

* Pure game design or visual polish - we're not going to worry about making things really good, we're going to focus on the making.
* Unity or Unreal
* Build entire frameworks or focus on a single framework

## What are we going to make?

We're going to cover areas in the following:

#### Topics in Rendering

![Rogue](https://raw.githubusercontent.com/whoisbma/Game-Aesthetics-SP15/master/images/rogue.png "Rogue")

**ASCII** - once upon a time, terminal output was our only option!

![Ultima](https://raw.githubusercontent.com/whoisbma/Game-Aesthetics-SP15/master/images/ultima.png "Ultima")

**Tiles** - we'll build a tile editor and play with some various techiques.

![Wolfenstein3D](https://raw.githubusercontent.com/whoisbma/Game-Aesthetics-SP15/master/images/wolfenstein.png "Wolfenstein3D")

**Raycasting** - hopefully we'll have time to build the whole thing from scratch - we'll see!

#### Topics in Procedural Generation

![Spelunky](https://raw.githubusercontent.com/whoisbma/Game-Aesthetics-SP15/master/images/spelunky.png "Spelunky")

**Dungeons** - automata, floodfill, walkers, snakes, etc.

![Minecraft](https://raw.githubusercontent.com/whoisbma/Game-Aesthetics-SP15/master/images/minecraft.png "Minecraft")

**Exteriors** - noise, etc.

#### Topics in AI

![Tic-tac-toe](https://raw.githubusercontent.com/whoisbma/Game-Aesthetics-SP15/master/images/minimaxing.png "Tic-tac-toe")

**Minimaxing**

![Pac-Man](https://raw.githubusercontent.com/whoisbma/Game-Aesthetics-SP15/master/images/pac-man.png "Pac-Man")

**Pathfinding**

![The Sims](https://raw.githubusercontent.com/whoisbma/Game-Aesthetics-SP15/master/images/thesims.png "The Sims")

**Agents**

---
---
---

## First Homework

Build a scene to be represented only in ASCII/terminal output, and have it accept cin input to affect something in the scene. Build two functions into the scene - one that has a simple result, (for example, draws a rectangle or a line) and one with something more complex (a picture? a face? a robot? a mountain?).

If you're feeling a little rough on the code we wrote in class, go through the examples one by one to get more comfortable with writing raw C++.