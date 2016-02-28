## Sprites

https://en.wikipedia.org/wiki/Sprite_(computer_graphics)

https://en.wikipedia.org/wiki/Bitmap

In computer graphics, a sprite is a two-dimensional image or animation that is integrated into a larger scene. Initially including just graphical objects handled separately from the memory bitmap of a video display, this now includes various manners of graphical overlays.

Originally, sprites were a method of integrating unrelated bitmaps so that they appeared to be part of the normal bitmap on a screen, such as creating an animated character that can be moved on a screen without altering the data defining the overall screen. Such sprites can be created by either electronic circuitry or software. In circuitry, a hardware sprite is a hardware construct that employs custom DMA channels to integrate visual elements with the main screen in that it super-imposes two discrete video sources. Software can simulate this through specialized rendering methods.

#### Atari VCS

The Atari VCS, released in 1977, features a hardware sprite implementation wherein five graphical objects can be moved independently of the game playfield. The VCS's sprites, called players and missiles, are constructed from a single row of pixels that displayed on a scan line; to produce a two-dimensional shape, the sprite's single-row bitmap is altered by software from one scanline to the next.

![Pitfall](https://en.wikipedia.org/wiki/Pitfall!#/media/File:A2600_Pitfall.png)

The console has only 128 bytes of RAM for run-time data that includes the call stack and the state of the game world. There is no frame buffer, as the necessary RAM would have been too expensive. Instead the video device has two bitmapped sprites, two 1-pixel "missile" sprites, a 1-pixel "ball," and a 40-pixel "playfield" that is drawn by writing a bit pattern for each line into a register just before the television scans that line. As each line is scanned, a game must identify the non-sprite objects that overlaps the next line, assemble the appropriate bit patterns to draw for those objects, and write the pattern into the register. In a telling reveal of its Pong heritage, by default, the right side of the screen is a mirrored duplicate of the left; to control it separately, the software may modify the patterns as the scan line is drawn. After the controller scans the last active line, a more leisurely vertical blanking interval begins, during which the game can process inputs and update the positions & states of objects in the game world. Any mistake in timing produces visual artifacts, a problem that programmers call "racing the beam" and which users tend to call "flickering".

The video hardware gives the 2600 a reputation as one of the most complex game consoles in the world to program, but those programmers who sufficiently understand it realize that such direct control over the video picture is also a source of flexibility. One advantage the 2600 has over more powerful contemporary competitors such as the ColecoVision is that the 2600 has no protection against altering settings in mid-line. For example, although each sprite nominally has only one color, it is possible to color the rows differently by changing the sprite's color as it is drawn. If the two hardware sprites are not enough for a game, a developer may share one sprite among several objects (as with the ghosts in Pac-Man) or draw software sprites, which is only a little more difficult than drawing a fixed playfield. The Pitfall! screenshot below (section: "Games") demonstrates some of these tricks: the player is a multicolor sprite, one sprite is multiplexed for the logs and the scorpion, and the swinging vine is drawn by shifting the position of the "ball" on each scan line. Despite the hardware limitations, many Atari 2600 games have a lot of action on the screen, creating an engaging experience. Furthermore, the Atari 2600 was one of the first consoles to introduce video game cartridges instead of having hardwired games built into it, allowing for the play of multiple different games rather than the usual one built in.[39]

#### Hardware Sprites

In early video gaming, hardware sprites were a method of compositing separate bitmaps so that they appear to be part of a single image on a screen. A hardware sprite is where you use the game system sprite/object
hardware to display a sprite.



#### Software Sprites



#### Indexed Color

https://en.wikipedia.org/wiki/Indexed_color

#### NES

Sprites on the NES were limited to 4 colors (or 3 colors + transparency)

![zelda](http://yachtclubgames.com/wp-content/uploads/2014/06/zelda-nes.png)

Tiles were usually 16x16

Palette Cycling

This kind of effect was common and quite easy to do on the NES since the programmer had access to the palette and the logical mapping between pixels and palette indices. On modern hardware, though, this is a bit more challenging because the concept of palettes is not the same.

http://www.effectgames.com/demos/canvascycle/?sound=0

#### Puzzlescript

#### Pippin Barr

![jostle bastard](http://www.pippinbarr.com/unified/wp-content/uploads/2014/10/Jostle-Bastard-banner.png)

http://www.pippinbarr.com/2013/11/19/jostle-bastard/

![Art Game](http://www.pippinbarr.com/unified/wp-content/uploads/2014/10/Art-Game-banner.png)

#### HW

palette cycling

limited palette

limited tile size

limited number of tiles

https://en.wikipedia.org/wiki/List_of_video_game_console_palettes#Famicom.2FNES
