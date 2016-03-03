## Sprites

![pacman1.jpg](https://raw.githubusercontent.com/whoisbma/Game-Aesthetics-SP16/master/class-06-sprites/images/pacman1.jpg)

*Pacman sprite designs by Toru Iwatani*

![mother3.png](https://raw.githubusercontent.com/whoisbma/Game-Aesthetics-SP16/master/class-06-sprites/images/mother3.png)

*Earthbound sprite rip*

Watch: [Super Mario design](https://www.youtube.com/watch?v=DLoRd6_a1CI)

#### What is a Sprite?

A 2D image or animation that is integrated into a larger scene.

* Initially sprites were graphics objects handled separately from the memory bitmap of the overall video display, but still appearing to be a part of it.
* Can be created in hardware via Direct Memory Access (DMA) channels (a technique for transferring data from main memory to a device without passing it through the CPU) integrating visual elements with the main screen, superimposing two discrete video sources.
* Sprites can also be simulated via software using the CPU or GPU.

#### Hardware Sprites

In early video gaming, hardware sprites were a hardware feature which would compositing separate bitmaps so that they appear to be part of a single image on a screen. There are independent of the normal bitmap background, allowing them to be moved on-screen by adjusting timer values, with no manipulation of memory.

Sprite graphics were more efficient for moving graphics, typically requiring 1/3 the memory cycles as only image data needed to be fetched.

* The screen as an array of pixels, the framebuffer
* Modifying a framebuffer held in RAM needs more memory cycles to load and store pixels, plus mask, and refresh background behind moving objects, also double buffering ideally to avoid tearing/flickering
* Most sprite systems used a separate group of circuitry for every sprite they could show on a scanline, including a horizontal position trigger and shift register or other way to send out data sequentially.
* When the raster scan reached the appropriate place, the circuitry would start shifting out the shape data for the sprite
* For each scanline, the appropriate scanlines of the sprites are copied and combined with the background
* For every pixel, every sprite unit signals its presence onto its line on a bus, so easy pixel-perfect collision
* Pointers to a palette rather than actual bitmap images
* Height, location of texture, zoom factors were historically limited

Historical limitations: 

![sprites](https://raw.githubusercontent.com/whoisbma/Game-Aesthetics-SP16/master/class-06-sprites/images/spriteoverview.jpg)

Sprites were usually seen in conjunction with indexed "character map" backgrounds, also known as "tiles", as opposed to the more general, memory-hungry linear framebuffers that are ubiquitous today. These were also used for displaying text, where pages could be rapidly refreshed and scrolled by simply replacing a grid of character indices, at the expense of limited precision placement and character-set. Characters were often fonts held in ROM on non-gaming systems such as the IBM PC. The drive toward blitters happened with a move toward GUIs and WYSIWYG interfaces for productivity software.

The downside of sprites is a limit of moving graphics per scanline, often between two (the Atari VCS) and eight (Commodore 64 and Atari 8-bits), and inability to update a permanent bitmap making them unsuitable for general desktop GUI acceleration. However, hardware sprites are still useful as a mouse pointer in a GUI, since the sprite requires no pixel manipulation of the desktop metaphor on screen. Though the Amiga includes a blitter its desktop GUI still uses a sprite for its mouse pointer.

#### Atari 2600

The Atari VCS, released in 1977, features a hardware sprite implementation wherein five graphical objects can be moved independently of the game playfield. The VCS's sprites, called players and missiles, are constructed from a single row of pixels that displayed on a scan line; to produce a two-dimensional shape, the sprite's single-row bitmap is altered by software from one scanline to the next.

Only 8 bits of shape data for each sprite - required the processor to load the data in real time anywhere it was supposed to change.

![Pitfall](https://en.wikipedia.org/wiki/Pitfall!#/media/File:A2600_Pitfall.png)

- 128 bytes of RAM for run-time data, including call stack and game world state. 
- No room for frame buffer.
- 2 bitmapped sprites - two 1-pixel "missiles", one 1-pixel "ball", one 40-pixel "playfield"
- drawn by writing a bit pattern for each line into a register just before the television scans that line.
- by default, the right side of the screen is a mirrored duplicate of the left.
- "racing the beam"
- 2600 has no protection against altering settings mid-line.

![vcs](http://www.wired.com/images_blogs/photos/uncategorized/2009/03/11/televisionscreen.png)

Another clever hack in Yars Revenge:

![Yars Revenge](https://upload.wikimedia.org/wikipedia/en/8/85/A2600_Yars_Revenge.png)
*graphics code from the program literally reading the game's own code as graphical data*

People still making Atari games: 

[A Slow Year](http://bogost.com/games/aslowyear/)

[Halo 2600](http://www.codemystics.com/halo2600/)

[Portal 2600](http://kotaku.com/5048537/portal-ported-to-the-atari-2600)

[Mega Man 2600](https://www.youtube.com/watch?v=UvrpXc8C3S8)

#### NES

![SMB1](http://blogs-images.forbes.com/erikkain/files/2014/06/mario-bros.jpg)

![SMB3](http://cdn3.dualshockers.com/wp-content/uploads/2014/04/Super-Mario-Bros.-3.jpg)

have a small number of sprite circuits, but can display more sprites; as soon as a circuit finishes displaying a sprite, it loads the parameters for the next sprite from memory)

![Palette](https://upload.wikimedia.org/wikipedia/en/8/80/NES_palette_color_test_chart.png)

[NES Palette generator](http://bisqwit.iki.fi/utils/nespalette.php)

* Sprites limited to 4 colors (or 3 + transparency)
* Characters like Mega Man were constructed out of two sprites- one for his body (blue/light blue/black) and one for his face (beige, white, black)
* Tiles were 8x8, 16x16
* 8 palettes total- 4 palettes used for background tiles, 4 palettes used for sprites
* 64 colors total, but only 25 colors onscreen 
* 64 sprites onscreen at once
* 8 sprites per scanline at once (if more than 8 sprites are drawn on a horizontal line of pixels across the screen (a scanline), only 8 can be visible)
* Can flip sprites, but no rotation

![Megaman2](http://yachtclubgames.com/wp-content/uploads/2014/06/mm2dragon.jpg)

*Big bosses as background tile layers*

![Recca](http://images.eurogamer.net/2013/usgamer/recca-spot1.gif)

*Sprite limit avoiding by skipping frames*

![waterfall](https://y1ln6w.dm2302.livefilestore.com/y2pINloLV_c1ecauZjHYMNES_5pznVqHod5KOKy_2nmqkN_LoxwRCQhvyPCI4VtrXb3qrD_H-7Xry11wotWOdSS4Ys1NAx44YjDPxjvbHMlidQ/Megaman%202%20Colour%20Cycling.gif?psid=1)

![sprites](http://orig08.deviantart.net/a1c7/f/2012/198/a/2/mega_man_pc_8_bit_sprites_by_phen01-d57m071.png)

*Palette cycling*

![mario3 carmack](https://raw.githubusercontent.com/whoisbma/Game-Aesthetics-SP16/master/class-06-sprites/images/mario3PC.jpg)

[John Carmack's Mario 3 PC prototype](http://arstechnica.com/gaming/2015/12/heres-what-id-softwares-pc-port-of-mario-3-could-have-looked-like/) - [video](https://vimeo.com/148909578)

#### Software Sprites

Many popular home computers of the 1980s lack any support for sprites by hardware. The animated characters, bullets, pointing cursors, etc. for videogames (mainly) were rendered exclusively with the CPU by software, as part of the screen video memory in itself. Hence the term software sprites.

Mainly, two distinct techniques were used to render the sprites by software, depending on the display hardware characteristics:

Binary image masks, mainly for systems with bitmapped video frame buffers. It employs the use of an additional binary mask for every sprite displayed to create transparent areas within a sprite.
Transparent color, mainly for systems with indexed color displays. This method defines a particular color index (typically index '0' or index '255') with a palletted display mode as a 'transparent color' which the blitter ignores when blitting the sprite to video memory or the screen.

#### The Evolution of Sprites

Modern devices lack support for hardware sprites but come with powerful 3D hardware - simulate sprites as textures on rectangles/quads.

Prior to the popularizing of true 3D graphics in the mid-late 1990s, many 2D games attempted to imitate the look of three-dimensionality with a variety of sprite production methods. These included:

- Rotoscoping: The filmed performances of live actors were sometimes used for creating sprites, most famously in the case of Prince of Persia which added a relative element of realism to a platform game. The method was used in a number of other fighting games, mostly in the mid 1990s.

- Claymation or the use of posable models which were used for characters that could not be portrayed by actors. Famous early examples include Goro of Mortal Kombat and various enemies from Doom. Used to a greater extent in games like Clay Fighter and Neverhood.

- Pre-rendered CGI models: The earlist documented game which uses it extensively is the 1993 Amiga game Stardust. Later used to a great extent in PC real-time strategy and role-playing video game games prior to the move to real-time 3D. Since computers of the day could not run complex 3D graphics, footage of pre-rendered three-dimensional character models were often used which created a (relative) illusion of 3D.

More often sprite now refers to a partially transparent two dimensional animation that is mapped onto a special plane in a 3D scene. Unlike a texture map, the sprite plane is always perpendicular to the axis emanating from the camera. The image can be scaled to simulate perspective, rotated two dimensionally, overlapped with other objects, and be occluded, but it can only be viewed from a single angle.

The term sprite is often confused with low resolution 2D graphics drawn on a computer, also known as pixel art. However, sprite graphics (bitmaps) can be created from any imaginable source, including prerendered CGI, dynamic 3D graphics, vector art, and even text. Likewise, pixel art is created for many purposes other than as a sprite, such as video game backgrounds, textures, icons, websites, display art, comics, and T-shirts.


With the advancement in computer graphics and improved power and resolution, actual pixel art sprites are becoming increasingly infrequent outside of handheld game systems and cell phones.

#### Synonyms

* **Player-Missile Graphics** was a term used by Atari, Inc. for hardware-generated sprites in the company's early coin-op games, the Atari 2600 and 5200 consoles and the Atari 8-bit computers. The term reflected the usage for both characters ("players") and other objects ("missiles"). They had restricted horizontal size (8 or 2 pixels, albeit with scalability) and vertical size equal to height of the entire screen.

* **Movable Object Block**, or MOB, was used in MOS Technology's graphics chip literature (data sheets, etc.) However, Commodore, the main user of MOS chips and the owner of MOS for most of the chip maker's lifetime, applied the common term "sprite", except for Amiga line of home computers, where MOB was the preferred term.

* The developer manuals for the Nintendo Entertainment System, Super Nintendo Entertainment System, and Game Boy referred to sprites as **OBJs** (short for "objects"), and the region of RAM used to store sprite attributes and coordinates was known as OAM (Object Attribute Memory). This still applies today on the Game Boy Advance and Nintendo DS handheld systems. However, Nintendo Power referred to them as sprites in articles about the NES architecture in the magazine's third year.

* **BOB**, more often **BLOB** or '**Blitter Object**', popular name for graphics objects drawn with the dedicated graphics blitter in the Amiga series of computers, which was available in addition to its true hardware sprites.
Software sprites were used to refer to subroutines that used bit blitting to accomplish the same goal on systems such as the Atari ST and the Apple II whose graphics hardware had no sprite capability.

* The computer programming language DarkBASIC used the term Bob (for "blitter object") to refer to its software-sprite functions, before switching to the more conventionally used "sprite" term.

* **Billboard or 3D Sprite** is a term often used to refer to sprites that are essentially texture mapped 3D facets that always have their surface normal facing into the camera.

* **Z-Sprite** is a term often used for 3D environments that contain only sprites. The Z-parameter provides a scaling effect that creates an illusion of depth. For example, in adventure games such as King's Quest VI where the camera never moves, normal 2D sprites might suffice, but Z-sprites provide an extra touch.
Impostor is a term used instead of billboard if the billboard is meant to subtly replace a real 3D object.

#### Batched Spritesheets

Why use spritesheets and a spritesheet renderer? Why not just draw images as you need them?

* number of available textures on a graphic card can be limited. Therefore your graphics library would constantly have to remove texture and re-allocate textures on the GPU. It's much more efficient to just allocate a large texture once.

* texture sizes are usually power of 2. So if you have a 50x100px Sprite, you'll allocate textures with the size 64x128px or in the worse case 128x128px. That's just wasting graphics memory. Better pack all the sprites into a 1024x1024px texture, which would allow 20x10 sprites and you'll only lose 24 pixels horizontally and vertically.

* reduce the amount of draw-calls on your GPU. Each draw call has a certain amount of overhead. By using sprite sheets you can batch the drawing of things that aren't using the same frame of an animation (or more generally, everything that's on the same material) greatly enhancing performance. This may not matter too much for modern PCs depending on your game, but it definitely matters on, say, the iPhone.