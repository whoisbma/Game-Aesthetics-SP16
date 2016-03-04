## Sprite HW

*Due before class, Thursday 3/10*

1. Use images to build an aesthetic on your procedural generation approach.
2. Either use PImages in processing, ofImages in OpenFrameworks, or try the ofxSpriteSheetRenderer addon.
3. Create your own sprites or spritesheet, giving yourself an aesthetic limitation like number of colors per sprite, an available palette, etc.
4. If you do either PImages or ofImages, see how far you can take your image-based approach before performance starts to drop.

Some ideas:

* Try context-sensitive

#### Palette Cycling

![waterfall](https://raw.githubusercontent.com/whoisbma/Game-Aesthetics-SP16/master/class-06-sprites/images/waterfall.gif)

This sketch emulates the palette cycling approach of sprites in the NES. It's extremely inefficient if you actually wanted to use this in a game or something compared to just having animation frames (or you could do it in a shader). But on the NES it was a pretty neat trick.

Code is included if you want to poke at it.

#### Palette Swapping Shader

![swap1](https://raw.githubusercontent.com/whoisbma/Game-Aesthetics-SP16/master/class-06-sprites/images/swap1.png)
![swap2](https://raw.githubusercontent.com/whoisbma/Game-Aesthetics-SP16/master/class-06-sprites/images/swap2.png)
![swap3](https://raw.githubusercontent.com/whoisbma/Game-Aesthetics-SP16/master/class-06-sprites/images/swap3.png)

Similar to above - instead of moving around the palette itself, this one uses a shader to point the color of a sprite to a different position on the palette entirely.

#### Context-sensitive tile selection

In this example, we draw tiles based on their positions relative to other tiles.

Look at the difference between these two maps:

[world tiles](http://i.imgur.com/jdI4C5C.jpg)

[civ 2](http://i.kinja-img.com/gawker-media/image/upload/s--_TmiXWnE--/c_scale,fl_progressive,q_80,w_800/17pk61o1ohtf2jpg.jpg)

#### ofxSpriteSheetRenderer spriteSheetExample

This is the code from the ofx addon example, updated to work smoothly with the latest version of openframeworks.

#### ofxSpriteSheetRenderer zelda

This example draws a background layer of sprites and a player sprite in the foreground.

![link](https://raw.githubusercontent.com/whoisbma/Game-Aesthetics-SP16/master/class-06-sprites/images/test.png)
