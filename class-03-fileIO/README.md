### Class 3: File I/O, Grid Mechanics

Class 3 is our final class where we only use minimal C++ and iostream, but we need to tackle an important concept that is normally obfuscated for us - loading from data. 

##### Code + Data

So far we've been encoding all our "game" information in pure code. We've been filling our array values manually, like writing descriptions for our Room objects from the last class. This is all fine for a small game that we might write for a simple code exercise, but for anything larger than that, data plays an important role. And by data what we mean is anything **loaded from outside of the code** (a text file, a CSV, xml file, json, an image, a 3D model, etc. etc.), to give us some new information **to use inside our code**.

If we look at any game framework out there, we will see that there is some capacity built in to handle or actually generate data. Images, and for 3D, meshes, are both obvious, but what about collections of data that are more abstract?

**Internal Tools**

Unity's entire interface is built around the concept of the "Scene" editor, which lets us place objects into a 3D grid space. Without this we would need to position everything in code ourselves. 

Additionally Unity is capable of loading all sorts of data files into code - from textures we can create materials, and from 3D meshes and animation data we can create animating characters in 3D space.

![Unity](https://raw.githubusercontent.com/whoisbma/Game-Aesthetics-SP15/master/class-03-fileIO/images/unity.jpg)

Game Maker and similar tools have a tile/"room" editor and a sprite editor built in. You could think of the room editor as a 2D version of Unity's 3D scene editor, and the sprite editor lets you create art assets (also data!) internally.

![GMare](https://raw.githubusercontent.com/whoisbma/Game-Aesthetics-SP15/master/class-03-fileIO/images/gmare.png)

**External Tools**

Game programming frameworks also usually have some compatibility with the files that external tile editors like Tiled. Tile editors let you "paint" arbitrarily sized tiles into a space and attach all sorts of information. They then package this data into a file that is read by game frameworks or libraries.

![Tiled](https://raw.githubusercontent.com/whoisbma/Game-Aesthetics-SP15/master/class-03-fileIO/images/Tiled.png)

Check out the following tile editors. This is a small range of what's actually out there.

* [Tiled Map Editor](http://www.mapeditor.org/)
* [Mappy](http://tilemap.co.uk/mappy.php)
* [TME - Tile Map Editor](http://tilemapeditor.com/)
* [TileStudio](http://tilestudio.sourceforge.net/)
* [tIDE (Tilemap Integrated Development Environment)](http://tide.codeplex.com/)
* [Gleed2D](https://github.com/SteveDunn/Gleed2D/wiki)

Also, check out [this funky 3D sprite editor](http://www.crocotile3d.com/) Ben showed in class: 

<a href="http://www.youtube.com/watch?feature=player_embedded&v5enKH9pz7oY
" target="_blank"><img src="http://img.youtube.com/vi/5enKH9pz7oY/0.jpg" 
alt="crocotile3d" width="240" height="180" border="10" /></a>

This week we won't be using any tools others have written for us, but we'll hack together a little version of a simple data parsing tool ourselves, to load into code, then use its information to fill a 2D array.

##### An extremely janky Bitmap byte parser

![Grid](https://raw.githubusercontent.com/whoisbma/Game-Aesthetics-SP15/master/class-03-fileIO/images/grid.png)

Unlike JPEGs or GIFs, bitmap image files (bmps) are uncompressed. This means that at some level, we have access to the pixel data itself, and we can directly read the contents of the bitmap, byte by byte, and grab out the individual colors that make up the image. This is why we are going to use a paint program like photoshop to serve as a very simple tile editor for us to use. 

Bitmaps, like all digital files, are represented by a single long string of bytes. We can actually see it for ourselves if we parse the binary contents. In hexadecimal, the above image looks like this:

![Grid](https://raw.githubusercontent.com/whoisbma/Game-Aesthetics-SP15/master/class-03-fileIO/images/hex.png)

We can see the point where we start seeing reds (ff0000 or 255, 0, 0), greens (00ff00 or 0, 255, 0) and blues (0000ff or 0, 0, 255), as well as purples, yellows, etc. However there's a big stream of data before that too. THis is called the **header**, and it stores all sorts of meta information about the file. Turns out that there are always exactly 54 bytes in the header, and we can start reading the colors at byte 55. (or 54, counting from 0 instead of 1). This is how all those bytes in the header look in decimal form instead of hexadecimal:

![header in decimal](https://raw.githubusercontent.com/whoisbma/Game-Aesthetics-SP15/master/class-03-fileIO/images/header.png)

More info on bitmaps and the byte header [here](https://en.wikipedia.org/wiki/BMP_file_format) and [here](http://www.fastgraph.com/help/bmp_header_format.html).

Our code will examine the bitmap image byte by byte, pull the RGB color values, and look at the total color of each pixel. With that, we could use that information to do all sorts of things. Check out the files in the homework/examples folder to review this code.

##### The Grid

**Graphics contexts as a discrete grid**

Why have we been fixating so much on the idea of grids to begin with? Everything we've done so far since day 1 involves a 2D array of data, and we've specifically been using these arrays as a means to represent 2-dimensional space. This could mean space that is represented to the user in text only, like our little text adventure system from last week, or to actually create a psuedo-screen to draw to, like week 1. 

This is different than our experience using graphics-oriented frameworks like Processing, OpenFrameworks, and Unity to build games and represent spaces. In those situations we have a **graphics context** where we are only limited by the resolution of the window and our screen, and in some sense, we aren't *truly* limited by them. Even if pixels are discrete - there is no such thing as half a pixel - we can do operations on the screen that do actually take place in those in-between positions, even if it doesn't appear to change onscreen, the math is the math. A point at (1.1, 1.1) may render at what seems to us to be (1,1) on screen - but it is still (1.1,1.1).

However the truth is that even though we have all this apparent seamless continuity that we have access to in floating point variables (we could have x = 0.0000001, y = 0.000001 etc.) despite the lower granularity of the graphics context, at its heart the computer can only store digits so small - a floating point variable can only represent a value stored to a set limit of memory. There is still a limit, even though it takes place out of our perceptual space, so ultimately we have a fixed grid of 2D space - just like our little fixed 2D arrays of data.

**So why are we fixating on 2D arrays/simple grids if we have all this apparent flexibility?**

With simple games using a discrete grid, not only do we get more to the fundamental truths behind all this representation, there are also more pragmatic reasons.

* With discrete grids we learn how to not only store information spatially but also see the limits and applications of spatial metaphors in general.

* It's easier to get to the gameplay, and a good exercise in general. We can create relationships between objects and user input, and objects with other objects with zero obfuscation. Picture designing a tabletop game involving moving through space and using randomness(dice) to influence movement. Would it be easier with a grid, or with a ruler?

* It makes game mechanics more clear and coherent - there is no longer any room for ambiguity. This is a valuable design approach that we will be able to bring to more sophisticated tools if we want to.

##### Homework and Examples

This week we're playing with our bitmap byte parser and a small game built out of it. Both are in the subfolder!

**NOTE: the byte parser is a very flawed little system for reading our bytes! I wrote it to keep the code relatively simple, but this means it won't always work. Stick to 4x4, 8x8, and 16x16 bitmaps.**