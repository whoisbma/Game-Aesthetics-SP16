## GAME AESTHETICS: Intro
#### 1/28/2016

Spring 2016

Instructor: Bryan Ma

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

#### What are we going to do in this class?

* Write a LOT of code in (C++, Processing/Java, possibly Javascript or Haxe)
* Understand the intersection of the medium (computers) and the design process
* Develop a better understanding of software architecture
* Learn algorithms for simulation, game mechanics, input handling, and processing and representing data
* Understand game frameworks better, know how to use them better
* Hack existing code, reverse engineer classic games, study some history

#### What AREN'T we going to do in this class?

* Pure game design
* Unity or Unreal
* Focus on visual content or polish
* Build entire frameworks or focus on a single framework


#### First Homework