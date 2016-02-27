#### Homework- start project 1.

*----Due before class, Thursday, 3/3----*

Combine at least two procedural generation techniques we discussed to create a system for dynamically generating a space (a dungeon? a house? an island? a planet? a galaxy? a universe?).

In this repo are examples for each technique.

Agents:

![agents](../cave.png)

Noise:

BSP:

Automata:



Create a tiny world simulation, represented by a 2D array. 

Combine the use of our "dungeon" generation and noise to create an "island" or some other imaginary space.

The dungeon generation should create boundaries for the world.

The noise should create attributes for the world. Use multiple stacked groups of noise to create different parameters. Maybe one parameter of noise is elevation, and another is rainfall.

Finally create multiple groups of agents in the world, or use a cellular automata approach. This could mean you could have individual roaming objects, each with an x and y position.

Create rules for the agents - they should know what is next to them, what land type they are on top of, and behave accordingly. Maybe they're all pac-men - if there's a "dot" object in the grid adjacent to them, it moves towards it.

Finally create a "player" object in the world that can move around and interact with the objects in some way.

I suggest doing this in Processing, P5, or OF.

Extra suggestions:

create custom sprites for each cell type.

even better: create procedural graphics for each type of cell!

Create a puzzle mechanic for the user to interact with. Think back to our match 3s. What if the player could move some objects around?

Examples:

code to generate a sprite