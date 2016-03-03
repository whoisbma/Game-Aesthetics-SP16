## Sprites

#### Framebuffers and Graphics Pipelines

sequence of steps used to create a 2D raster representation of a scene.

#### Sprites

https://en.wikipedia.org/wiki/Sprite_(computer_graphics)

https://en.wikipedia.org/wiki/Bitmap

In computer graphics, a sprite is a two-dimensional image or animation that is integrated into a larger scene. Initially including just graphical objects handled separately from the memory bitmap of a video display, this now includes various manners of graphical overlays.

Originally, sprites were a method of integrating unrelated bitmaps so that they appeared to be part of the normal bitmap on a screen, such as creating an animated character that can be moved on a screen without altering the data defining the overall screen. Such sprites can be created by either electronic circuitry or software. In circuitry, a hardware sprite is a hardware construct that employs custom DMA channels to integrate visual elements with the main screen in that it super-imposes two discrete video sources. Software can simulate this through specialized rendering methods.

#### Tile-based games

The tile-map model was introduced by the Namco Galaxian arcade system board in 1979.[1] Early video game consoles such as the Intellivision were designed to use tile-based graphics, since their games had to fit into video game cartridges as small as 4K in size. Regardless of their outward appearance or game genre, all Intellivision games are tile-based.

Early tile-based games shipped with pre-constructed levels or generated levels at game startup (for example, with SimCity and Civilization) or on the fly (as with Roguelike games). A feature of tile-based games is that they allow for the creation of easy to use map editors, and many tile-based games come with an editor that allows players to construct their own levels. While completed levels for a game may hide all traces of tile-based technology, use of an editor for such a game strips away all polish and reveals a game's tile-based framework.

Most early tile-based games used a top-down perspective. The top-down perspective evolved to a simulated 45-degree angle, seen in 1994's Final Fantasy VI, allowing the player to see both the top and one side of objects, to give more sense of depth; this style dominated 8-bit and 16-bit console role-playing games. Ultimate Play The Game developed a series of video games in the 1980s that employed a tile-based isometric perspective. As computers advanced, isometric and dimetric perspectives began to predominate in tile-based games. Notable titles include:

Ultima Online, which mixed elements of 3D (the ground, which is a tile-based height map) and 2D (objects) tiles
Civilization II, which updated Civilization's top-down perspective to an "isometric" (more accurately described as dimetric) perspective.
The Avernum series, which remade the top-down role-playing series Exile with an isometric engine.
Hexagonal tile-based games have been limited for the most part to the strategy and wargaming genres. Notable examples include the Sega Genesis game Master of Monsters, SSI's Five Star series of wargames, the Age of Wonders series and Battle for Wesnoth.

Some entirely 3D games have been tile-based; one notable example is the Neverwinter Nights series from BioWare. Other games, like side-scrollers, are technically also tile-based (that is, the playing area is made up of graphic tiles), but are normally not referred to as such. Lode Runner is an example.

A tile set (sometimes called a sprite sheet) is a collection of smaller images called tiles (typically of uniform size) which have been combined into a single larger image. Tile sets are often used in 2D video games to create complex maps from reusable tiles within the set. When a tile set based map is displayed, the tiles that are stored within it are used to reassemble the map for display. This technique is seen in games designed to run on portable systems such as Nintendo's Game Boy Advance system or a cellular phone. Using tile sets reduces the amount of system memory required to display maps since it allows for the same tiles to be reused multiple times in a map. It also reduces amount of artwork needed for individual maps since many different ones can be created from the same tileset. In order for maps made from tile sets to appear more distinctive, games typically display them with a different tile set for each unique environment.

This method is implemented in many 2D games as well as applications meant for game creation, such as RPG Maker, Game Maker, Construct, Godot, and Tiled.

https://en.wikipedia.org/wiki/Tile-based_video_game

In the early days of video game development, proper RAM economy was a must for a successful game engine, much more so than it is today. One of the largest problems, graphics rendering performance, came down to the amount of RAM dedicated to storing graphics for the game worlds and characters, and fetching these graphics and displaying them on screen in as rapid and smooth a way as possible. An early hack which not only stored larger game worlds in less RAM, but also made use of fewer, smaller sized pieces of graphics rather than the full scale overall image was the tile map, a technique taking the stance that if you are rendering a grassy field, chances are most of that field is going to look the same anyway, hence the smart approach would be to re-use one small graphic over and over to shape the grassy field. This approach became widely used in specific game genres such as platformers and role-playing video games, and reached its peak during the 8-bit and 16-bit eras of consoles, with games such as Mega Man (NES), The Legend of Zelda: A Link to the Past (SNES) and Shining Force (Mega Drive) being prime examples of tile-based games, producing a highly recognizable look and feel.

The tile-map model was introduced by the Namco Galaxian arcade system board in 1979. The most common tile size used in video games was 8×8 pixels. A tilemap consisting of 8×8 tiles required 64 times less memory and processing time than a non-tiled framebuffer.[1]

The typical tile map consists of a 2-dimensional array/matrix containing references to a tile object. This tile object holds information such as the type of terrain, if it is possible to walk on it, if it causes damage to the video game character etc., as well as the identity of the graphic to be rendered whenever that tile is to be drawn. This approach allows for simple, visual map data, letting level designers create entire worlds with a simple text editor and a tile reference sheet, though most if not all accomplished tile-based games utilize dedicated world editor software and highly optimized map formats.

The tiles themselves are usually simple geometric shapes, ranging from the simple square to more complicated shapes such as hexagons or even circles in some cases. These tiles are drawn at intervals dictated by a uniform height/width, though in many cases the interval is decided by the size of the tile to be drawn.

Variations on the tile model include: separate layers to describe graphics vs. gameplay data (such as collision, damage, entities, etc.), level data using "material tiles" that are procedurally transformed into the final tile graphics, and groupings of tiles as larger-scale "supertiles" or "chunks," allowing large tiled worlds to be constructed under heavy memory constraints. Ultima 7 uses a "tile," "chunk" and "superchunk" three-layer system to construct an enormous, detailed world within the PCs of the early 1990s.

https://en.wikipedia.org/wiki/Tile_engine

#### Hardware Sprites

In early video gaming, hardware sprites were a method of compositing separate bitmaps so that they appear to be part of a single image on a screen. A hardware sprite is where you use the game system sprite/object
hardware to display a sprite.

Many early graphics chips had true spriting use capabilities in which the sprite images were integrated into the screen, often with priority control with respect to the background graphics, at the time the video signal was being generated by the graphics chip.

These contrasted with software and blitter methods of 2D animation which modify a framebuffer held in RAM, which required more memory cycles to load and store the pixels, sometimes with an additional mask, and refresh backgrounds behind moving objects. These methods frequently required double buffering to avoid flickering and tearing, but placed fewer restrictions on the size and number of moving objects.

The sprite engine is a hardware implementation of scanline rendering. For each scanline the appropriate scanlines of the sprites are first copied (the number of pixels is limited by the memory bandwidth and the length of the horizontal retrace) into very fast, small, multiple (limiting the number of sprites on a line), and costly caches (the size of which limit the horizontal width) and as the pixels are sent to the screen, these caches are combined with each other and the background. It may be larger than the screen and is usually tiled, where the tile map is cached, but the tile set is not. For every pixel, every sprite unit signals its presence onto its line on a bus, so every other unit can notice a collision with it. Some sprite engines can automatically reload their "sprite units" from a display list. The sprite engine has synergy with the palette. To save registers, the height of the sprite, the location of the texture, and the zoom factors are often limited. On systems where the word size is the same as the texel there is no penalty for doing unaligned reads needed for rotation. This leads to the limitations of the known implementations:

(image)

Many third party graphics cards offered sprite capabilities. Sprite engines often scale badly, starting to flicker as the number of sprites increases above the number of sprite units, or uses more and more silicon as the designer of the chip implements more units and bigger caches.

--


On many older video game and computer systems, sprites were a hardware feature which would overlay small images onto a larger screen. Although the Atari 7800 had a sprite implementation similar to what is described in the Wikipedia article, it was practically unique in that regard. Most sprite systems used a separate group of circuitry for every sprite they could show on a scan line, including a horizontal position trigger and a shift register or other means to send data sequentially. When the raster scan reached the appropriate place on a line, the circuitry would start shifting out the shape data for the sprite.

Some machines (like the Odyssey2) included within the video chip hardware to hold the shapes of all the sprites on the screen. The Atari 2600 only held 8 bits of shape data for each sprite, and required the processor to load the data in real time anywhere it was supposed to change. The most common pattern, however, was for the video chip to clock sprite data from memory automatically. Typically, the hardware would expect the data to be in a particular format or, in some cases, one of two formats.

On some machines, the number of sprites that can display simultaneously on a frame without CPU intervention equals the number of sprite circuits. Other machines have a small number of sprite circuits, but can display more sprites; as soon as a circuit finishes displaying a sprite, it loads the parameters for the next sprite from memory. The NES fits this pattern.


pp---\\

Hardware sprites were a more common system for moving graphics in games machines, which used two different graphics pathways to draw images that were then combined in the video display circuitry into a single image. Sprites were small bitmaps that were positioned on the screen independent of the normal bitmap background, allowing them to be moved on-screen by adjusting the values of several timers. The video circuitry started drawing the sprites after the timer had expired, allowing them to be displayed with no manipulation of memory. Sprite systems were more efficient for moving graphics, typically requiring 1/3 the memory cycles as only image data needed to be fetched, with the subsequent compositing happening on-chip.

Sprites were usually seen in conjunction with indexed "character map" backgrounds, also known as "tiles", as opposed to the more general, memory-hungry linear framebuffers that are ubiquitous today. These were also used for displaying text, where pages could be rapidly refreshed and scrolled by simply replacing a grid of character indices, at the expense of limited precision placement and character-set. Characters were often fonts held in ROM on non-gaming systems such as the IBM PC. The drive toward blitters happened with a move toward GUIs and WYSIWYG interfaces for productivity software.

The downside of sprites is a limit of moving graphics per scanline, often between two (the Atari VCS) and eight (Commodore 64 and Atari 8-bits), and inability to update a permanent bitmap making them unsuitable for general desktop GUI acceleration. However, hardware sprites are still useful as a mouse pointer in a GUI, since the sprite requires no pixel manipulation of the desktop metaphor on screen. Though the Amiga includes a blitter its desktop GUI still uses a sprite for its mouse pointer.

#### Software Sprites

Many popular home computers of the 1980s lack any support for sprites by hardware. The animated characters, bullets, pointing cursors, etc. for videogames (mainly) were rendered exclusively with the CPU by software, as part of the screen video memory in itself. Hence the term software sprites.

Mainly, two distinct techniques were used to render the sprites by software, depending on the display hardware characteristics:

Binary image masks, mainly for systems with bitmapped video frame buffers. It employs the use of an additional binary mask for every sprite displayed to create transparent areas within a sprite.
Transparent color, mainly for systems with indexed color displays. This method defines a particular color index (typically index '0' or index '255') with a palletted display mode as a 'transparent color' which the blitter ignores when blitting the sprite to video memory or the screen.

#### Return of sprites in casual games and mobile devices

With mobile devices and casual gaming becoming more and more popular the classic 2D games return. The modern devices lack support for hardware sprites but come with powerful 3D hardware. On these devices sprites are simulated using textures on rectangular shapes. Perspective is disabled for these games. Since the hardware often comes with constraints - e.g. that it can only use power-of-two sized textures (that is a width or height of 64, 128, 256, ...) sprite sheets are used to reduce memory consumption. This is done by packing many sprites into one texture which, as a whole, has to meet the hardware constraints. Apart from the memory usage this technique can also be used to reduce the number of draw calls to the graphics subsystem and speed up rendering.[35]

There are several programs that still use 2D sprites in their construction. RPG Maker VX and Wolf RPG Maker are just a couple of examples. As well as the programs that can create said indie games, there are several mainstream games as well. These famous game series like Fire Emblem, Pokémon, and other handheld system games tend to use these more for the same reasons that mobile devices such as tablets and cell phones do. It saves on memory so it allows for more content, effects, music, and story to be added into the chip or cartridge. As such, for first time indie game developers, sprites offer an easy but effective way to introduce themselves into game design as a whole.

Prior to the popularizing of true 3D graphics in the mid-late 1990s, many 2D games attempted to imitate the look of three-dimensionality with a variety of sprite production methods. These included:

- Rotoscoping: The filmed performances of live actors were sometimes used for creating sprites, most famously in the case of Prince of Persia which added a relative element of realism to a platform game. The method was used in a number of other fighting games, mostly in the mid 1990s.

- Claymation or the use of posable models which were used for characters that could not be portrayed by actors. Famous early examples include Goro of Mortal Kombat and various enemies from Doom. Used to a greater extent in games like Clay Fighter and Neverhood.

- Pre-rendered CGI models: The earlist documented game which uses it extensively is the 1993 Amiga game Stardust. Later used to a great extent in PC real-time strategy and role-playing video game games prior to the move to real-time 3D. Since computers of the day could not run complex 3D graphics, footage of pre-rendered three-dimensional character models were often used which created a (relative) illusion of 3D.

More often sprite now refers to a partially transparent two dimensional animation that is mapped onto a special plane in a 3D scene. Unlike a texture map, the sprite plane is always perpendicular to the axis emanating from the camera. The image can be scaled to simulate perspective, rotated two dimensionally, overlapped with other objects, and be occluded, but it can only be viewed from a single angle.

Sprites create an effective illusion when

- the image inside the sprite already depicts a three dimensional object;
- the animation is constantly changing or depicts rotation;
- the sprite exists only shortly;
- the depicted object has a similar appearance from many common viewing angles (such as something spherical);
- the perspective of the object from the viewer cannot possibly change fast enough for the viewer to discern a difference from true 3D geometry, as in the case of object a long distance away from the viewer in 3D space.
- the viewer accepts that the depicted object only has one perspective (such as small plants or leaves).

When the illusion works, viewers will not notice that the sprite is flat and always faces them. Often sprites are used to depict phenomena such as fire, smoke, small objects, small plants (like blades of grass), or special symbols (like "1-Up"), or object of any size where the angle of view does not appreciably change with respect to the rectilinear projection of the object (usually from a long distance). The sprite illusion can be exposed in video games by quickly changing the position of the camera while keeping the sprite in the center of the view. Sprites are also used extensively in particle effects and commonly represented pickups in early 3D games especially.

An example of extensive usage of sprites to create the illusion is the game The Elder Scrolls IV: Oblivion, whose main graphical feature was the ability to display hundreds, if not thousands of animated trees on-screen at one time. Closer inspection of those trees reveals that the leaves are in fact sprites, and rotate along with the position of the user. The tree rendering package used by Oblivion uses sprites to create the appearance of a high number of leaves. However, this fact is only revealed when the player actually examines the trees up-close, and rotates the camera.

Sprites have also occasionally been used as a special-effects tool in movies. One such example is the fire breathing Balrog in The Lord of the Rings: The Fellowship of the Ring; the effects designers utilized sprites to simulate fire emanating from the surface of the demon. Small bursts of fire were filmed in front of a black background and made transparent using a luma key. Many bursts were then attached to the surface of the animated Balrog model and mixed with simulated smoke and heat waves to create the illusion of a monster made from fire.

The term sprite is often confused with low resolution 2D graphics drawn on a computer, also known as pixel art. However, sprite graphics (bitmaps) can be created from any imaginable source, including prerendered CGI, dynamic 3D graphics, vector art, and even text. Likewise, pixel art is created for many purposes other than as a sprite, such as video game backgrounds, textures, icons, websites, display art, comics, and T-shirts.

With the advancement in computer graphics and improved power and resolution, actual pixel art sprites are becoming increasingly infrequent outside of handheld game systems and cell phones.

#### Application

Sprites are typically used for characters and other moving objects in video games. They have also been used for mouse pointers and for writing letters to the screen. For on-screen moving objects larger than one sprite's extent, sprites may sometimes be scaled and/or combined.

Billboarding is the use of sprites in a 3D environment. In the same way that a billboard is positioned to face drivers on a highway, the 3D sprite always faces the camera. There is both a performance advantage and an aesthetic advantage to using billboarding. Most 3D rendering engines can process "3D sprites" much faster than other types of 3D objects. So it is possible to gain an overall performance improvement by substituting sprites for some objects that might normally be modeled using texture mapped polygons. Aesthetically sprites are sometimes desirable because it can be difficult for polygons to realistically reproduce phenomena such as fire. In such situations, sprites provide a more attractive illusion.

Sprites are also made and used by various online digital artists, usually to train their ability to make more complicated images using different computer programs or just for the fun of it. "Sprite Artists" will either create their own "custom" sprites, or use and edit pre-existing sprites (often made by other artists or "ripped" from a video game or other media) in order to create art, comics, or animations.

#### Synonyms

Player-Missile Graphics was a term used by Atari, Inc. for hardware-generated sprites in the company's early coin-op games, the Atari 2600 and 5200 consoles and the Atari 8-bit computers. The term reflected the usage for both characters ("players") and other objects ("missiles"). They had restricted horizontal size (8 or 2 pixels, albeit with scalability) and vertical size equal to height of the entire screen.

Movable Object Block, or MOB, was used in MOS Technology's graphics chip literature (data sheets, etc.) However, Commodore, the main user of MOS chips and the owner of MOS for most of the chip maker's lifetime, applied the common term "sprite", except for Amiga line of home computers, where MOB was the preferred term.

The developer manuals for the Nintendo Entertainment System, Super Nintendo Entertainment System, and Game Boy referred to sprites as OBJs (short for "objects"), and the region of RAM used to store sprite attributes and coordinates was known as OAM (Object Attribute Memory). This still applies today on the Game Boy Advance and Nintendo DS handheld systems. However, Nintendo Power referred to them as sprites in articles about the NES architecture in the magazine's third year.

BOB, more often BLOB or 'Blitter Object', popular name for graphics objects drawn with the dedicated graphics blitter in the Amiga series of computers, which was available in addition to its true hardware sprites.
Software sprites were used to refer to subroutines that used bit blitting to accomplish the same goal on systems such as the Atari ST and the Apple II whose graphics hardware had no sprite capability.

The computer programming language DarkBASIC used the term Bob (for "blitter object") to refer to its software-sprite functions, before switching to the more conventionally used "sprite" term.

Billboard or 3D Sprite is a term often used to refer to sprites that are essentially texture mapped 3D facets that always have their surface normal facing into the camera.

Z-Sprite is a term often used for 3D environments that contain only sprites. The Z-parameter provides a scaling effect that creates an illusion of depth. For example, in adventure games such as King's Quest VI where the camera never moves, normal 2D sprites might suffice, but Z-sprites provide an extra touch.
Impostor is a term used instead of billboard if the billboard is meant to subtly replace a real 3D object.

#### Indexed Color

https://en.wikipedia.org/wiki/Indexed_color

Indexed color is a technique to manage image colors in a limited fashion, in order to save RAM and video memory buffer space, file storage space, telecom bandwidth, and to speed up display refresh and telecom transfers. Instead of storing and managing every primary color component of every pixel, the most representative colors, or the fixed hardware colors, are grouped into a limited size palette: an array of color elements, in which each element (a color) is indexed by its position. This way, the pixels contain not the full color components but merely their index into the palette; this is sometimes referred as pseudocolor. Most common is the RBG24 scheme using three 8-bit index values for the RGB primary color 'channels'.

This technique saves a lot of memory/storage space and/or transmission time: if the full RGB color palette is truecolor, there are 16,777,216 different possible colors, and each pixel needs 24 bits, or 3 bytes. A typical 640×480 VGA resolution, truecolor uncompressed image needs 640×480×3 = 921,600 bytes (900 KiB). Limiting the image colors to 256, every pixel needs only 8 bits, 1 byte, so the example image now needs only 640×480×1 = 307,200 bytes (300 KiB), plus 256×3 = 768 additional bytes to store the palette map (assuming 24-bit RGB), approximately one third of the original size. Smaller palettes (4-bit 16 colors, 2-bit 4 colors) can pack the pixels even more (to 1/6 or 1/12), obviously at cost of color accuracy. While it is acceptable for little images (icons) or very simple graphics, to reproduce real-life images this loss of color availability becomes more of a problem. Some clever tricks, as color quantization, anti-aliasing, and dithering combined together can approximate indexed 256-color images to the original one.

#### Atari VCS

The Atari VCS, released in 1977, features a hardware sprite implementation wherein five graphical objects can be moved independently of the game playfield. The VCS's sprites, called players and missiles, are constructed from a single row of pixels that displayed on a scan line; to produce a two-dimensional shape, the sprite's single-row bitmap is altered by software from one scanline to the next.



The console has only 128 bytes of RAM for run-time data that includes the call stack and the state of the game world. There is no frame buffer, as the necessary RAM would have been too expensive. Instead the video device has two bitmapped sprites, two 1-pixel "missile" sprites, a 1-pixel "ball," and a 40-pixel "playfield" that is drawn by writing a bit pattern for each line into a register just before the television scans that line. As each line is scanned, a game must identify the non-sprite objects that overlaps the next line, assemble the appropriate bit patterns to draw for those objects, and write the pattern into the register. In a telling reveal of its Pong heritage, by default, the right side of the screen is a mirrored duplicate of the left; to control it separately, the software may modify the patterns as the scan line is drawn. After the controller scans the last active line, a more leisurely vertical blanking interval begins, during which the game can process inputs and update the positions & states of objects in the game world. Any mistake in timing produces visual artifacts, a problem that programmers call "racing the beam" and which users tend to call "flickering".

The video hardware gives the 2600 a reputation as one of the most complex game consoles in the world to program, but those programmers who sufficiently understand it realize that such direct control over the video picture is also a source of flexibility. One advantage the 2600 has over more powerful contemporary competitors such as the ColecoVision is that the 2600 has no protection against altering settings in mid-line. For example, although each sprite nominally has only one color, it is possible to color the rows differently by changing the sprite's color as it is drawn. If the two hardware sprites are not enough for a game, a developer may share one sprite among several objects (as with the ghosts in Pac-Man) or draw software sprites, which is only a little more difficult than drawing a fixed playfield. The Pitfall! screenshot below (section: "Games") demonstrates some of these tricks: the player is a multicolor sprite, one sprite is multiplexed for the logs and the scorpion, and the swinging vine is drawn by shifting the position of the "ball" on each scan line. Despite the hardware limitations, many Atari 2600 games have a lot of action on the screen, creating an engaging experience. Furthermore, the Atari 2600 was one of the first consoles to introduce video game cartridges instead of having hardwired games built into it, allowing for the play of multiple different games rather than the usual one built in.[39]

![vcs](http://www.wired.com/images_blogs/photos/uncategorized/2009/03/11/televisionscreen.png)

As illustrated in this image from Racing the Beam, the electron gun’s movement included three large spaces where it was not drawing on the screen: the vertical and horizontal "blanks" on the top and left, and the "overscan" on the bottom. These blind spots were crucial for Atari programmers, as these were the only times they could do anything that didn’t involve drawing graphics on the screen, such as computing joystick inputs, player movements, scoring, etc.

If you’ve ever seen little black lines appear at the left edge of the screen while you’re playing a VCS game, those are bits of the game’s code where the program is taking too much time doing other calculations, and it can’t draw on the screen, leaving it blank. The black bar on the left-hand side of the Pitfall! screen at top was Activision designers’ solution — they cut out part of the gameplay field in exchange for more processing time.

As if all this weren’t enough, the VCS could only display five interactive objects at any one time: two "player" sprites, two "missile" sprites, and one "ball." This was more than enough for replicating Pong and Tank, the popular arcade games of 1977. It was useless for anything even slightly more complicated, such as Space Invaders.

What saved the VCS, ironically, was the lack of a frame buffer. Yes, the system could only display two sprites at any given moment. But once the electron beam had drawn a sprite, the program could shift the position of said sprite horizontally and redraw it. But because the sprite had already been drawn on the screen, the original one would not disappear until the electron gun came back around to redraw the screen. By doing this, programmers could create rows and rows of sprites — perfect for Space Invaders‘ rows of aliens.

Eventually, use of these techniques allowed designers to create scenes on the VCS that were significantly more detailed than the hardware maker had ever imagined. Consider again the Pitfall screen at top. The tiny details in the tree’s branches are drawn with sprites. When Pitfall Harry swings on a vine, that vine is drawn with the "ball" graphic intended for games of Pong.

![pacman](http://www.wired.com/images_blogs/photos/uncategorized/2009/03/11/pacmancomparison.png)

Many of the most popular Atari VCS games were ports of popular arcade titles, a staple of the videogame industry that lasted long past the VCS’ heyday. "The porting of arcade games to home systems was first really worked through on the VCS," says Bogost. "It was because of this VCS development that developers were able to figure out what to try to carry over and what to leave behind, and how to adapt the arcade experience for more limited consoles that would be played at home."

The most popular, and most notorious, arcade-to-Atari port was Pac-Man, released in 1981. The general consensus, then and now, is that the VCS version of Pac-Man totally sucks. The visual appeal of the arcade game is totally lost, and the gameplay doesn’t fare much better in translation. It’s considered to be one of the games that helped cause Atari’s downfall.

But after you learn about the VCS hardware, its version of Pac-Man starts to seem more like a crowning achievement, not a massive stumble. If the 2600 could only display a handful of sprites on screen, how would a designer create a screen full of dots that could be individually eaten in any order? The answer turned out to be creating the dots using the same "playfield" graphics as the maze, so that every time you eat a dot, the game redraws the entire background.

http://www.codemystics.com/halo2600/

http://kotaku.com/5048537/portal-ported-to-the-atari-2600

https://www.youtube.com/watch?v=UvrpXc8C3S8


#### NES

Sprites on the NES were limited to 4 colors (or 3 colors + transparency)

Some developers created more colorful sprites using another trick. Characters like Mega Man were constructed out of two sprites, one for his body (blue, light blue, and black) and one for his face (beige, white, and black), and the sprites were overlaid. This is why Mega Man’s face will flicker separately from his body sometimes. For Shovel Knight, we decided to treat most sprites like Mega Man, and give them 4-5 colors to work with in addition to transparency.

![zelda](http://yachtclubgames.com/wp-content/uploads/2014/06/zelda-nes.png)

Tiles were usually 16x16

The sprite hardware on the NES was not optimal for drawing very large moving objects, due to the limitations it imposed (after all, even a few small ones could cause flickering).  To get around this limitation, clever developers displayed big art as animated background tile layers.  That is the reason why, whenever you fight a large enemy on the NES, they are usually on a black screen with no background art. The boss is the background.

We thought that the black background with the huge boss always gave NES games a distinctive and epic feel, where the focus was just on you and your enemy, so we decided it was important to keep. However, lacking sprite limitations, we didn’t need to mess with background layers or other workarounds to make a large sprite possible.  We simply used our animated sprite code, were careful with the designs, and made sure the sprite was on a black (or very dark) background.

**Sprite Flickering**

Sprite flickering on the NES would occur when more than 8 sprites were displayed on the same horizontal line.  We kept the sprite count as low as we could, but as previously mentioned, we didn’t sweat the exact numbers. Some of our objects produce a few more particles than an NES game would dare… but we thought it was worth the beauty.

Some games like Recca or Contra got around sprite limits by displaying certain sprites only every other frame (at 30fps instead of 60fps). On CRT monitors running low resolution interlaced video, objects would appear to be drawn every frame. In addition to this, NES particle art was often built with flickering in mind for effects like explosions. We used flashing sprites in some situations to replace alpha transparency; For example, Shovel Knight flashes on and off during his “invincible” state, after being hit. So overall, this didn’t feel like an important restriction to follow, unless it made the gameplay not feel like NES gameplay.

**Palette**

The NES was only capable of spitting out 54 different colors… and that’s not a lot. The problem for us mainly came in trying to display a gradient in most hues. For example, there isn’t a very useful yellow, the darker spectrum of color is very underrepresented, and there aren’t many shades that work for displaying a character with a darker skin tone. Sticking to the NES palette was a big priority for us, though, as it gives a very distinctive look. In the end, we ended up with only a few extra colors.

**Palette Cycling**

This kind of effect was common and quite easy to do on the NES since the programmer had access to the palette and the logical mapping between pixels and palette indices. On modern hardware, though, this is a bit more challenging because the concept of palettes is not the same.

http://www.effectgames.com/demos/canvascycle/?sound=0

http://gamedev.stackexchange.com/questions/43294/creating-a-retro-style-palette-swapping-effect-in-opengl

https://www.reddit.com/r/gamedev/comments/1e8iaq/why_dont_developers_use_palette_shifting/

2D consoles like the NES and the DS break up images into a two-level hierarchy. At the bottom is a tileset. A tileset is an indexed collection of 8x8 pixel images. A tileset will be loaded when the level loads, typically into a portion of memory dedicated to graphics.

Sprites and levels are then built on top of that. A sprite for something like a 32x64 pixel character is broken into 4x8 tiles. To define a sprite now, you just need 32 values to identify the indexes of the tiles it uses. Very memory efficient. Different animation frames and sprites can now reuse the same tiles saving tons of memory.

Now for the game to draw a sprite, it just looks up the tiles at each index for the sprite and draws them at the right position on the screen. The console hardware itself usually handles this, which is how you can get surprisingly good graphics on very limited hardware (the original NES had a 1.67 MHz CPU and only 4k of RAM).

Although every sprite in Shovel Knight is created using limited colors, we didn’t make all sprites onscreen abide by a single color palette.  To cite Mega Man again as an example, the player’s sprite color changes also affect 1-Ups and other items. This is due to a uniform color palette; when a color is adjusted for one sprite, all sprites change color. We chose to not worry about this limitation as the headache to make one palette work doesn’t benefit gameplay, but we did use limited color palettes to create enemy variants and for cycling damage and explosion effects.

Those effects made gameplay more clear and exciting; for example, cycling damage made it obvious you were hurting an enemy as the effect was consistent across all objects and added fun as the color cycling was more impactful than your typical ‘gethit’ animation or flickering. These palette cycling and shifting effects were created by passing an indexed unsigned byte texture representing the sprite and a full 32 bit color texture representing the palette to a pixel shader…quite the leap from 8-bit technology to imitate the good old days!



http://yachtclubgames.com/2014/07/breaking-the-nes/





#### Tiled Rendering

Tiled rendering is the process of subdividing (or tiling) a computer graphics image by a regular grid in image space to exploit local spatial coherence in the scene and/or to facilitate the use of limited hardware rendering resources later in the graphics pipeline.

Tiled rendering is sometimes known as a "sort middle" architecture.[1]

In a typical tiled renderer, geometry must first be transformed into screen space and assigned to screen-space tiles. This requires some storage for the lists of geometry for each tile. In early tiled systems, this was performed by the CPU, but all modern hardware contains hardware to accelerate this step. The list of geometry can also be sorted front to back, allowing the GPU to use hidden surface removal to avoid processing pixels that are hidden behind others, saving on memory bandwidth for unnecessary texture lookups.[2]

Once geometry is assigned to tiles, the GPU renders each tile separately to a small on-chip buffer of memory. This has the advantage that composition operations are cheap, both in terms of time and power. Once rendering is complete for a particular tile, the final pixel values for the whole tile are then written once to external memory. Also, since tiles can be rendered independently, the pixel processing lends itself very easily to parallel architectures with multiple tile rendering engines.

Tiles are typically small (16×16 and 32×32 pixels are popular tile sizes), although some architectures use much larger on-chip buffers and can be said to straddle the divide between tiled rendering and immediate mode ("sort last") rendering.

Tiled rendering should not be confused with tiled/nonlinear framebuffer addressing schemes, which make adjacent pixels also adjacent in memory.[3] These addressing schemes are used by a wide variety of architectures, not just tiled renderers.


#### Puzzlescript

#### Pippin Barr

![jostle bastard](http://www.pippinbarr.com/unified/wp-content/uploads/2014/10/Jostle-Bastard-banner.png)

http://www.pippinbarr.com/2013/11/19/jostle-bastard/

![Art Game](http://www.pippinbarr.com/unified/wp-content/uploads/2014/10/Art-Game-banner.png)

#### sort

https://en.wikipedia.org/wiki/Texture_atlas

#### HW

palette cycling

limited palette

limited tile size

limited number of tiles

https://en.wikipedia.org/wiki/List_of_video_game_console_palettes#Famicom.2FNES
