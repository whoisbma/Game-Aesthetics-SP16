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

Atari 2600 - only 8 bits of shape data for each sprite
- required the processor to load the data in real time anywhere it was supposed to change.

#### NES

have a small number of sprite circuits, but can display more sprites; as soon as a circuit finishes displaying a sprite, it loads the parameters for the next sprite from memory)

![mario3 carmack](https://raw.githubusercontent.com/whoisbma/Game-Aesthetics-SP16/master/class-06-sprites/images/mario3PC.jpg)

[John Carmack's Mario 3 PC prototype](http://arstechnica.com/gaming/2015/12/heres-what-id-softwares-pc-port-of-mario-3-could-have-looked-like/) - [video](https://vimeo.com/148909578)



#### Batched Spritesheets

Why use spritesheets and a spritesheet renderer? Why not just draw images as you need them?

* number of available textures on a graphic card can be limited. Therefore your graphics library would constantly have to remove texture and re-allocate textures on the GPU. It's much more efficient to just allocate a large texture once.

* texture sizes are usually power of 2. So if you have a 50x100px Sprite, you'll allocate textures with the size 64x128px or in the worse case 128x128px. That's just wasting graphics memory. Better pack all the sprites into a 1024x1024px texture, which would allow 20x10 sprites and you'll only lose 24 pixels horizontally and vertically.

* reduce the amount of draw-calls on your GPU. Each draw call has a certain amount of overhead. By using sprite sheets you can batch the drawing of things that aren't using the same frame of an animation (or more generally, everything that's on the same material) greatly enhancing performance. This may not matter too much for modern PCs depending on your game, but it definitely matters on, say, the iPhone.