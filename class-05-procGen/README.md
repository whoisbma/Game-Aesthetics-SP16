#### Procedural Content Generation

In the very end of the last class, we very briefly talked about a simple method to create a random result in our 2D arrays via a random walker.

the algorithmical creation of game content with limited or indirect user input

A key term here is “content”. In our definition, content is most of what is contained in a game: levels, maps, game rules, textures, stories, items, quests, music, weapons, vehicles, characters, etc. 

In computer graphics, procedural generation is commonly used for creating textures, but for games it can

#### Why use PCG? Why industry move to PCG?

Can overcome the storage limitations of computers. The earliest graphical computer games were severely limited by memory constraints. This forced content, such as maps, to be generated algorithmically on the fly: there simply wasn't enough space to store a large amount of pre-made levels and artwork. Pseudorandom number generators were often used with predefined seed values in order to create very large game worlds that appeared premade. As computer hardware advanced and CDs became able to store thousands of times as much data than was possible in the early 80s, using procedural generation to build large worlds became unnecessary. Game content such as textures and character and environment models are often created by artists beforehand, so to keep the quality of content consistently high.

People are slow compared to computers, games expanding in complexity, man months, cost, etc leading to decreased creative risk taking. Storing unique designs in the game's memory, rather than producing multiple objects using similar guidelines allows a variety of detailed models that are each substantially different. However, when each model needs to be designed by hand, a limited number of objects will exist. Some initial approaches to procedural synthesis attempted to solve this problem by shifting the burden of content generation from the artists to programmers who can create code that automatically generates different meshes according to input parameters. (speedtree)

PCG can augment the creativity of humans, enabling small teams to create lots more than they could on their own

PCG can enable completely new types of games

PCG can respond to the player's 'needs'

PCG can produce things that we can't

PCG can produce novelty - through "randomness"

PCG can help us think about design: computer scientists say "you don't understand a process until you have implemented it in code." Creating software that can competently generate game content could help us understand process by which we can "manually" generate the content, and clarify the affordances and constraints of the design problem we are addressing. PCG --> improved design process --> improved PCG --> improved design process --> 

#### Randomness and Seeding

PRNG on computers vs. TRNG

seed value

#### Gamez

Perhaps the first game to use a seed (lucky number) to generate the world is Richard Garriott's Akalabeth (1980); by using the same seed number, a player can always return to a given world. 

![Akalabeth](http://www.g4g.it/g4g2/wp-content/uploads/2014/12/Akalabeth_World_of_Doom_01.jpg)

https://www.youtube.com/watch?v=nKAlDUu7zko

The Sentinel supposedly had 10,000 different levels stored in only 48 and 64 kilobytes. The idea behind this ingenious three dimensional game was to absorb trees around the landscape, turn them into boulders, transport your self as a robot figure to a high enough vantage point in the landscape to be able to see the base that the Sentinel was standing on. Absord his energy and the game was won. If however, he saw you, your energy would be absorbed back into the landscape. 

It is clear that the memory limitations of the 8-bit microcomputers would preclude 10,000 landscapes being stored individually in the computer's memory. Instead, a procedural generation algorithm is used which generates each landscape from a small data packet: the 8-digit number given at the completion of a previous landscape. The number of landscapes was quite arbitrary given the generation algorithm, and was chosen as a balance between giving the player good value while not overwhelming them with an unreachable goal. Not all the landscapes were actually tested, but it was always possible to skip a difficult level by completing an earlier one with a different amount of energy.

![The Sentinel](http://i.imgur.com/Jsz0mVi.png)

https://www.youtube.com/watch?v=9V_pgo3vgiI

An extreme case was Elite, which was originally planned to contain a total of 248 (approximately 282 trillion) galaxies with 256 solar systems each. The publisher, however, was afraid that such a gigantic universe would cause disbelief in players, and eight of these galaxies were chosen for the final version.[4] 

space trading video game, written and developed by David Braben and Ian Bell 

 first home computer games to use wire-frame 3D graphics with hidden line removal.

Elite is one of the early games that solved this problem by storing the seed numbers used to procedurally generate eight galaxies each with 256 planets each with unique properties.

A single seed number is run through a fixed algorithm the appropriate number of times and creates a sequence of numbers determining each planet's complete composition (position in the galaxy, prices of commodities, and name and local details; text strings are chosen numerically from a lookup table and assembled to produce unique descriptions, such as a planet with "carnivorous arts graduates"). This means that no extra memory is needed to store the characteristics of each planet, yet each is unique and has fixed properties. Each galaxy is also procedurally generated from the first. Braben and Bell at first intended to have 248 galaxies, but Acornsoft insisted on a smaller universe to hide the galaxies' mathematical origins.[32]

![Elite](http://www.nowgamer.com/wp-content/uploads/2012/11/346537.jpg)

https://www.youtube.com/watch?v=AuvbZpH1QuE

Other notable early examples include the 1985 game Rescue on Fractalus that used fractals to procedurally create in real time the craggy mountains of an alien planet and River Raid, the 1982 Activision game that used a pseudorandom number sequence generated by a linear feedback shift register in order to generate a scrolling maze of obstacles. 

![Fractalus](https://upload.wikimedia.org/wikipedia/en/9/99/A5200_Rescue_On_Fractalus.png)

https://www.youtube.com/watch?v=FbZ-chrOgGg

![River Raid](http://2.bp.blogspot.com/-w6fuvrjCUcc/Ty6Vi6f3SWI/AAAAAAAAAEM/50XuaNXw8QU/s1600/River+Raid+2600.jpg)


Beneath Apple Manor - https://www.youtube.com/watch?v=b-AHgmV5pbo

Another classical example of the early use of PCG is the early eighties’ game Rogue, a dungeon-crawling game in which levels are randomly generated every time a new game starts. Automatic generation of game content, however, often comes with tradeoffs; Rogue-like games can automatically generate compelling experiences, but most of them (such as Dwarf Fortress) lack visual appeal.

![Beneath Apple Manor](http://www.myabandonware.com/media/screenshots/b/beneath-apple-manor-256/beneath-apple-manor_5.gif)

Diablo is an action role-playing hack and slash video game featuring procedural generation for creating the maps, the type, number and placement of items and monsters.

![Diablo](http://i2.wp.com/www.dangerdolan.tv/wp-content/uploads/2015/02/iEGh0XDY9ph6Q.png)

The Civ series is a turn based strategy game that allows unique gameplay experience by generating random maps.

![Civ 1](http://www.myabandonware.com/media/screenshots/s/sid-meiers-civilization-1nj/sid-meiers-civilization_16.png)

![Civ Rev](http://www.civilizationrevolution.com/ipad/images/screen_08_xl.jpg)

![Civ 5](http://vignette3.wikia.nocookie.net/civilization/images/1/13/Standard-Earth-map.jpg/revision/latest?cb=20101105112509)

PCG is a central feature in Spore where the designs
the players create is animated using procedural animation techniques. These personalized creatures are then used to populate a procedurally generated galaxy.

![Spore creature generator](http://gamehounds.net/wp-content/uploads/2008/06/sporccwmacscrnpaintretail.jpg)

https://www.youtube.com/watch?v=ZRr3lgckIAM

https://www.youtube.com/watch?v=dRovPCiBBTw



Minecraft [19] is one of the recent popular
indie games featuring extensive use of PCG techniques to generate the whole world
and it’s content.

![Minecraft](http://minecraft.rvdbrg.com/wp-content/uploads/2011/09/2011-09-12_20.56.47.png)

Spelunky [39] is another notable 2D platform rogue-like indie game
that utilizes PCG to automatically generate variations of game levels (Figure 3.12).

![Spelunky](http://www.gamasutra.com/db_area/images/igf/Spelunky/screenshot.jpg)

Proteus

https://www.youtube.com/watch?v=gWs_RKXkyu0

https://vimeo.com/90271157

![Proteus](http://criticalindiegamer.com/wp-content/uploads/2013/06/Proteus-2013-01-04-96uPuB63525082-00021.png)

No Man's Sky, set to be released in June 2016,[6] is a game that allows players to explore planets that are procedurally generated. According to the developers, this allows for more than 18 quintillion possible planets. Planets, their terrain, weather, flora, and fauna are all generated by the use of a single random seed number to their engine, assuring that the same planet can be visited by players using only knowledge of the seed number, in this case, the location of the planet in the virtual galaxy. The engine uses mathematical formulas that, with adjustable parameters, can mimic a diverse number of natural formations, such as the Superformula and L-systems.

![No Man's Sky](http://no-mans-sky.com/press/no_man's_sky/images/NewEridu.png)

Not just worlds: Ledoliel

![Ledoliel](http://images.ipad.qualityindex.com/app_screenshots/891693763/us-ipad-1-ledoliel.jpeg)

https://www.youtube.com/watch?v=vIatdeiFxPg

Finally Dwarf Fortress is in many ways the most remarkable: 

part construction and management simulation, part roguelike, indie video game created by Tarn and Zach Adams. Freeware and in development since 2002, its first alpha version was released in 2006 and it received attention for being a two-member project surviving solely on donations. The primary game mode is set in a procedurally generated fantasy world in which the player indirectly controls a group of dwarves, and attempts to construct a successful and wealthy underground fortress. Critics praised its complex, emergent gameplay but had mixed reactions to its difficulty. The game influenced Minecraft and was selected among other games to be featured in the Museum of Modern Art to show the history of video gaming in 2012.

The game has text-based graphics and is open-ended with no main objectives. Before being played, the player has to generate worlds with continents, oceans and histories documenting civilizations. The main game mode, Fortress Mode, consists of selecting a suitable site from the generated-world, establishing a successful colony or fortress, combating threats like goblin invasions, generating wealth and taking care of the dwarves. Each dwarf is modeled down to its individual personality, has likes or dislikes and specific trainable skills in various labors. 

The first step in Dwarf Fortress is generating a playable world; only one game can be played per world at a time.[7] The player can adjust certain parameters governing size, savagery, mineral occurrences and the length of history.[9] The map shows symbols representing roads, hills, towns and cities of the various civilizations, and it changes as the generation progresses. A midpoint displacement algorithm generates the world.[7]

The process involves procedurally-generated[1] basic elements like elevation, rainfall, mineral distribution, drainage and temperature, using fractals (which give it an overall natural look).[10] For example, a high-rainfall and low-drainage area would make a swamp. Areas are thus categorized into biomes, which have two variables: savagery and alignment.[11] They have their own specific type of plant and animal populations. The next phase is erosion—which the drainage tries to simulate. Rivers are created by tracing their paths from the mountains (which get eroded) to its end which is usually an ocean; some form into lakes. The salinity field defines oceans, mangroves or alluvial plains. Names are generated for the biomes and rivers.[11] The names depend on the area's good/evil variable (the alignment) and though in English, they are originally in one of the four in-game languages of dwarves, elves, humans and goblins; these are the four main races in any generated world.[10]

![Dwarf Fortress](http://cdni.wired.co.uk/1240x826/d_f/df-pen-refuse-woodpile1.png)

![Dwarf Fortress](http://citybuildinggames.com/wp-content/uploads/2015/09/Dwarf-Fortress2.png)

![Dwarf Fortress](http://www.ultimaratioregum.co.uk/game/files/2013/04/DF1.png)

#### Approaches

Search-based approach - evolutionary algorithms are used to search for good game content using principles from darwinian evolution. You need an evaluation function and a content representation.

**Agents**

Agents

Review walker code

Write cave generator code (processing)

Look at Nuclear Throne

**BSP trees**

Write shitty BSP tree

**Cellular Automata**

Intro to game of life


http://www.conwaylife.com/wiki/Main_Page

http://ncase.me/simulating/ 

Life in Life

Floodfill



**Fractals/Noise**

Adjust noise example in processing

Fractal algorithms and other noise algorithms

generating minecraft worlds with combination of noise and cellular automata

Grammars - 

https://en.wikipedia.org/wiki/Musikalisches_W%C3%BCrfelspiel

**Mix**

Talk about spelunky

Talk about

#### Resources

http://pcgbook.com/

Demoscene

ProcJam

https://itch.io/jam/procjam

http://galaxykate0.tumblr.com/post/139774965871/so-you-want-to-build-a-generator

http://www.noisemachine.com/talk1/

Will Wright and Spore - https://www.youtube.com/watch?v=N4ScRG_reIw

#### Play

beginner: Minecraft

intermediate: Proteus

advanced: Dwarf Fortress


#### Simulating the World in Emoji / Workshop

![Simulating the world in emoji](http://ncase.me/emoji-prototype/social/thumbnail.png)

http://ncase.me/simulating/

Get in groups of 3. 

Come up with something unique to simulate.

#### Homework- start project 1.

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