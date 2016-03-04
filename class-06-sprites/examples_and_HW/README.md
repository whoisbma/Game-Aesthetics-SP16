## Sprite HW

*Due before class, Thursday 3/10*

1. Use images to build an aesthetic on your procedural generation approach.
2. Either use PImages in processing, ofImages in OpenFrameworks, or try the ofxSpriteSheetRenderer addon. **I suggest trying the OF addon if you're using OF in other classes!**
3. Create your own sprites or spritesheet, giving yourself an aesthetic limitation like number of colors per sprite, an available palette, etc.

If you do either PImages or ofImages, see how far you can take your image-based approach before performance starts to drop. Your approach will be the same as previous approaches, except for one key difference. Instead of drawing a rectangle or calling the text() function to draw a character to the screen, you'll be drawing an image instead!

[PImage reference](https://processing.org/reference/PImage.html)

[ofImage reference](http://openframeworks.cc/documentation/graphics/ofImage/)

If you're trying the addon, implement your procedural generation technique into your application of the renderer.

Some ideas:

* If you haven't yet, try implementing a collision system for a player. The way we've been doing things will work fine - check to see if the position in the grid in the direction the player wants to move is occupied by a tile that would allow movement, then increment the player position in that direction. *Advanced 1: notice that there is a collisionBox field of the addTile methods for colliders that aren't the same shape as the sprite rectangle.* and *Advanced 2: try continuous movement for the player, instead of tile by tile.*
* Try tile sprites that diverge from grid logic entirely, but still use the grid to draw. What if tiles were a large image with transparency? An abstract shape?
* Try an [isometric tiling system](http://flarerpg.org/tutorials/isometric_intro/).
* Try context-sensitive tile placement - see below.
* If you use the "camera" approach in the example, play with camera behavior. How would you recreate the camera behavior from Super Mario Bros.?

#### Palette Cycling

![waterfall](https://raw.githubusercontent.com/whoisbma/Game-Aesthetics-SP16/master/class-06-sprites/images/waterfall.gif)

This sketch emulates the palette cycling approach of sprites in the NES. It's extremely inefficient if you actually wanted to use this in a game or something compared to just having animation frames (or you could do it in a shader). But on the NES it was a pretty neat trick.

Code is included if you want to poke at it.

#### Palette Swapping Shader

![swap1](https://raw.githubusercontent.com/whoisbma/Game-Aesthetics-SP16/master/class-06-sprites/images/swap1.png)
![swap2](https://raw.githubusercontent.com/whoisbma/Game-Aesthetics-SP16/master/class-06-sprites/images/swap2.png)
![swap3](https://raw.githubusercontent.com/whoisbma/Game-Aesthetics-SP16/master/class-06-sprites/images/swap3.png)

Similar to above - instead of moving around the palette itself, this one uses a shader to point the color of a sprite to a different position on the palette entirely.

#### ofxSpriteSheetRenderer spriteSheetExample

This is the code from the ofx addon example, updated to work smoothly with the latest version of openframeworks.

#### ofxSpriteSheetRenderer zelda

This example draws a background layer of sprites and a player sprite in the foreground.

The code is fully commented to explain each part. As in the sprite sheet example though, you'll need to generate your own OF project and include the ofxSpriteSheetRenderer object, then replacing the .h and .cpp files with the ones here in the repo, as well as the sprite sheet in bin/data.

![link](https://raw.githubusercontent.com/whoisbma/Game-Aesthetics-SP16/master/class-06-sprites/images/test.png)

#### Context-sensitive tile selection

In this example, we draw tiles based on their positions relative to other tiles.

Look at the difference between these two maps:

![world tiles](http://i.imgur.com/jdI4C5C.jpg)

![civ 2](http://i.kinja-img.com/gawker-media/image/upload/s--_TmiXWnE--/c_scale,fl_progressive,q_80,w_800/17pk61o1ohtf2jpg.jpg)

In the lower map, the borders between tiles are indistinct. This is because when the world is generated, it draws specific tiles based on their position relative to other tiles. We could do this with the same approach you would take in our previous cellular automata examples, or a match 3 comparison mechanic: look at all adjacent tiles, get their status, for each possibility, set a different sprite index.

One way you could do this with for example our previous noise-based land generation code is to store each sprite's info in a struct or class that also has a "land type" variable. All "plains" lands would be the same structurally, but perhaps they would draw a different sprite based on their proximity to a "water" tile.

Look at this beautiful map from Final Fantasy 6 - each tile connects seamlessly to its neighbors. You could imagine a town procedural generation technique that does this programmatically.

![ff6](http://wallpapercave.com/wp/JzJoZ4U.png)

Compare this to a screenshot from Ultima 1 where each tile is clearly intended to represent something discrete.

![Ultima 1](https://upload.wikimedia.org/wikipedia/en/b/be/Ultima1-1.gif)