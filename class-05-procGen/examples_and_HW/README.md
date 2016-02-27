## Homework 5 - proc gen space

*----Due before class, Thursday, 3/3----*

Combine at least two procedural generation techniques we discussed to create a system for dynamically generating a space. It could be a dungeon, a house, an island, a planet, a galaxy, a universe, or any other space else you could imagine.

Secondly - do not just use ASCII text, we're done with TUIs now and moving into sprites next week. Come up with a different way to represent the space.

Finally, create a "player" object in the world that can move around and interact with the world in some way.

**Extra suggestions:**

* create custom sprites for each cell type.
* even better: create procedural graphics for each type of cell!
* Create a puzzle mechanic for the user to interact with. Think back to our match 3s. What if the player could move some objects around? How would you generate them randomly?

In this repo are examples for each technique.

#### Agents:

![agents](https://raw.githubusercontent.com/whoisbma/Game-Aesthetics-SP16/master/class-05-procGen/images/cave.png)

Agents are single objects that have some logic driving their movement through a space, like our walker objects. Walkers choose one random direction, then we use their movement to create a space in our map. The cave walker we created in class moves in one direction each step, a random amount to the left or right since the last step, and creates an empty space in a random number of steps to the left and right of it.

What else could you do with an agent?

**References:**

[Random Level Gen in Nuclear Throne](http://www.vlambeer.com/2013/04/02/random-level-generation-in-wasteland-kings/)


#### Noise:

![noise1](https://raw.githubusercontent.com/whoisbma/Game-Aesthetics-SP16/master/class-05-procGen/images/map1.png)

![noise2](https://raw.githubusercontent.com/whoisbma/Game-Aesthetics-SP16/master/class-05-procGen/images/map2.png)

**References:**

[Ken Perlin's presentation on noise](http://www.noisemachine.com/talk1/)

#### BSP:

![BSP](https://raw.githubusercontent.com/whoisbma/Game-Aesthetics-SP16/master/class-05-procGen/images/BSP.png)

**References:**

[Basic BSP](http://www.roguebasin.com/index.php?title=Basic_BSP_Dungeon_generation)

[More sophisticated example](http://gamedevelopment.tutsplus.com/tutorials/how-to-use-bsp-trees-to-generate-game-maps--gamedev-12268)

#### Automata:

![automata](https://raw.githubusercontent.com/whoisbma/Game-Aesthetics-SP16/master/class-05-procGen/images/automata-treasure.png)

**References:**

[Roguebasin article on the topic](http://www.roguebasin.com/index.php?title=Cellular_Automata_Method_for_Generating_Random_Cave-Like_Levels)

##### Other References:

[Technique summary](http://www.futuredatalab.com/proceduraldungeon/)

[Proc Gen Reddit](https://www.reddit.com/r/proceduralgeneration/)

[Maze algorithms](http://www.astrolog.org/labyrnth/algrithm.htm)

[Maze combination technique](http://journal.stuffwithstuff.com/2014/12/21/rooms-and-mazes/)