## Agent Behaviors / Pseudo-AI Homework

*Due before class 3/17*

Use the Pac-Man case study to bring some agent behavior into your ongoing experimentation with procedural generation and sprite-based tiles.

* Pac-Man is a very specific kind of example that works really well with a very basic map type - one made out of corridors only with few intersections. In order to best make use of Pac-Man's type of thinking about handling AI your demo will need a similar scale of constraints. Maybe not corridors, but perhaps tile types that don't create a collision completely but instead change behavior, for example.

* Think about what type of relationship you want to create between the player and an agent. What do you want to represent? Is it about navigating a crowd? Is it about generating an emotional state based on the proximity/behavior of others (there's an experimental/art game about loneliness that does this, making everything avoid you)? Is there some kind of abstract relationship between agents that aren't actually meant to represent living beings but some kind of metaphor? Do they attract? Repel? Mirror? Follow? Destroy one another?

Other things to try:

* try implementing smooth movement in our pac-man code from class.
* try using the attached pac-man sprite sheet to properly create all tile graphics based on neighbor tiles.
* implement pac-man in OF or another framework.

Advanced:

* Check the A* reference in the class notes and try implementing A* (or another pathfinding algorithm) for proper pathfinding.
* Attempt to create a system that generates procedural Pac-Man levels.


#### Reference Code:

**pacman_01 - a slight improvement from the in-class code. Fixes the movement bug we missed (we weren't checking 4-intersection decision nodes properly)**

**pacman_02 - adds a debug visualization method where the lines get drawn from tiles being compared**

**pacman_03 - in progress**

**pacman_smooth - an old sketch demoing smooth pacman-style movement on the grid. in pacman you can queue moves that will be made on the next turn. this is a sloppy implementation and doesn't correspond to our AI approach - to integrate it pacman should also look for decision-node tiles to actually move.**