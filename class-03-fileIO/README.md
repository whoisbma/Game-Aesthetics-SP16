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

Game programming frameworks also usually have some compatibility with the files that external tile editors like Tiled. Tile editors let you "paint" arbitrarily sized tiles into a space, with all sorts of meta information. Think of it as a 2D version

Check out the following tile editors. This is a small range of what's actually out there.

* [Tiled Map Editor](http://www.mapeditor.org/)
* [Mappy](http://tilemap.co.uk/mappy.php)
* [TME - Tile Map Editor](http://tilemapeditor.com/)
* [TileStudio](http://tilestudio.sourceforge.net/)
* [tIDE (Tilemap Integrated Development Environment)](http://tide.codeplex.com/)
* [Gleed2D](https://github.com/SteveDunn/Gleed2D/wiki)

##### The Grid

// why games with discrete grid?

//easier to get to the gameplay.

//picture paper prototyping.

//also, game mechanics more clear, more coherent. x is x and y is y.

//no room for ambiguity.


##### Tiles and Polygons



##### An extremely janky Bitmap byte parser



