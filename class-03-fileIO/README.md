### Class 3: File I/O, Grid Mechanics

Class 3 is our final class where we only use minimal C++ and iostream, but we need to tackle an important concept that is normally obfuscated for us - loading from data. 

##### Code + Data

So far we've been encoding all our "game" information in pure code. We've been filling our array values manually, like writing descriptions for our Room objects from the last class. This is all fine for a small game that we might write for a simple code exercise, but for anything larger than that, data plays an important role. And by data what we mean is anything **loaded from outside of the code** (a text file, a CSV, xml file, json, an image, a 3D model, etc. etc.), to give us some new information **to use inside our code**.

If we look at any game framework out there, we will see that there is some capacity built in to handle or actually generate data. Images, and for 3D, meshes, are both obvious, but what about collections of data that are more abstract?

**Internal Tools**

![Unity](https://raw.githubusercontent.com/whoisbma/Game-Aesthetics-SP15/master/class-03-fileIO/images/unity.jpg)

Unity's entire interface is built around the concept of the "Scene" editor, which lets us place objects into a 3D grid space. Without this we would need to position everything in code ourselves. 

Additionally Unity is capable of loading all sorts of data files into code - from textures we can create materials, and from 3D meshes and animation data we can create animating characters in 3D space.

![GMare](https://raw.githubusercontent.com/whoisbma/Game-Aesthetics-SP15/master/class-03-fileIO/images/gmare.png)

Game Maker and similar tools have a tile/"room" editor and a sprite editor built in. You could think of the room editor as a 2D version of Unity's 3D scene editor, and the sprite editor lets you create art assets (also data!) internally.

**External Tools**

![Tiled](https://raw.githubusercontent.com/whoisbma/Game-Aesthetics-SP15/master/class-03-fileIO/images/Tiled.png)

Game programming frameworks also usually have some compatibility with the files that external tile editors like Tiled. Tile editors let you "paint" arbitrarily sized tiles into a space and attach all sorts of information. They then package this data into a file that is read by game frameworks or libraries.

Check out the following tile editors. This is a small range of what's actually out there.

* [Tiled Map Editor](http://www.mapeditor.org/)
* [Mappy](http://tilemap.co.uk/mappy.php)
* [TME - Tile Map Editor](http://tilemapeditor.com/)
* [TileStudio](http://tilestudio.sourceforge.net/)
* [tIDE (Tilemap Integrated Development Environment)](http://tide.codeplex.com/)
* [Gleed2D](https://github.com/SteveDunn/Gleed2D/wiki)

This week we won't be using any tools others have written for us, but we'll hack together a little version of a simple data parsing tool ourselves, to load into code, then use its information to fill a 2D array.

##### The Grid

Before we get to code though, let's think for a minute about why we're fixating so much on the idea of grids to begin with. Everything we've done so far since day 1 involves a 2D array of data, and we've specifically been using these arrays as a means to represent 2-dimensional space. This could mean space that is represented to the user in text only, like our little text adventure system from last week, or to actually create a psuedo-screen to draw to, like week 1. 

// why games with discrete grid?

//easier to get to the gameplay.

//picture paper prototyping.

//also, game mechanics more clear, more coherent. x is x and y is y.

//no room for ambiguity.

//all digital spaces, if you look closely enough, are discrete grids. there are no exceptions.

##### An extremely janky Bitmap byte parser



