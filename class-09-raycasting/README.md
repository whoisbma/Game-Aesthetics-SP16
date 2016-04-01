# RAYCASTING

###### 3/31/16

---

![Raycasting](https://raw.githubusercontent.com/whoisbma/Game-Aesthetics-SP16/master/class-09-raycasting/images/raycast.png)

Lots of background and example code taken from this amazing primer: 
[http://lodev.org/cgtutor/raycasting.html](http://lodev.org/cgtutor/raycasting.html)

Another, ancient (1996) article is here at [permadi.com](http://permadi.com/1996/05/ray-casting-tutorial-table-of-contents/).

This class used p5.js and javascript create an implementation of this technique.

### Movement and collision in a 2D array

We started off programming a map only rendering that used a 2D array to create blocks of empty space. 

##### Drawing the map

This is the map I made but you could easily load in something from a file to generate a 2D array, or make a smaller one, or customize this one. ```0``` refers to an empty space. Anything that isn't a ```0``` is a wall. This will make walls of different colors when we eventually get to the raycast code.

```
var worldMap = [
  [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1], 
  [1, 2, 0, 2, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], 
  [1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], 
  [1, 2, 0, 2, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], 
  [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], 
  [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 1], 
  [1, 2, 0, 3, 3, 2, 2, 2, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 1, 2, 0, 0, 0, 0, 0, 1], 
  [1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 3, 0, 0, 0, 0, 1], 
  [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 1], 
  [1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 2, 0, 0, 0, 0, 0, 1], 
  [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1], 
  [1, 3, 3, 3, 3, 3, 3, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], 
  [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], 
  [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], 
  [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], 
  [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], 
  [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], 
  [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], 
  [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], 
  [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2, 0, 2, 2, 0, 0, 0, 0, 0, 0, 1], 
  [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 1], 
  [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 1], 
  [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 1], 
  [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 1], 
  [1, 0, 0, 0, 2, 3, 0, 0, 0, 0, 0, 2, 2, 2, 2, 1, 0, 1, 2, 2, 2, 2, 2, 0, 0, 1], 
  [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 2, 0, 0, 0, 2, 0, 0, 0, 2, 0, 0, 1], 
  [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 2, 0, 0, 1], 
  [1, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 2, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 1], 
  [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2, 2, 2, 0, 0, 0, 2, 0, 0, 0, 2, 0, 0, 1], 
  [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 2, 2, 2, 2, 2, 0, 0, 1], 
  [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 1], 
  [1, 3, 3, 3, 3, 3, 3, 3, 0, 0, 3, 0, 0, 0, 2, 1, 0, 1, 2, 0, 0, 0, 0, 0, 0, 1], 
  [1, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], 
  [1, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], 
  [1, 2, 0, 0, 0, 2, 0, 0, 3, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], 
  [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
];
```

In the draw loop of p5, we'll load in a function we use to actually draw the array out as an array of rectangles or tiles or whatever.

```
function drawMap() {
  background(255);
  for (var i = 0; i < worldMap.length; i++) {
    for (var j = 0; j < worldMap[0].length; j++) {
      if (worldMap[i][j] !== 0) {
        fill(0);
        rect(i * 20, j * 20, 20, 20);
      }
    }
  }
}
```

##### Player variables

Then we'll need to make some variables in global scope to keep track of our player. These are two vectors to store position and direction, and one number to store a rotation value. We'll use it to adjust the direction vector when the player presses a key on the keyboard.

In addition we'll make two more variables to store numbers that we'll use to adjust the movement and rotation speed.

```
var pos;
var dir;
var rot;

var walkSpeed;
var rotSpeed;

```

These all get given values in p5's setup function, as well as creating the canvas.
The position vector will be in relationship to the units of our 2D array - so we're starting it at position 10, 10 in the map array. Direction will be facing downwards (0,1).

```
function setup() {
  createCanvas(800,600);
  pos = createVector(10,10);
  dir = createVector(0,1);
  rot = 0;
  //these values probably need adjusting - they are for the final version of the map code, after we've added a deltatime modifier.
  walkSpeed = 0.01; 
  rotSpeed = 0.01;
}
```

##### Drawing the player

Back in the drawMap() function, we can add some stuff to draw our actual player after we draw the map rectangles.

```
fill(255,100,255);
ellipse(pos.x * 20, pos.y * 20, 20, 20);
line(pos.x * 20, pos.y * 20, (pos.x + dir.x) * 20, (pos.y + dir.y) * 20);
```
  
If this gets all loaded into the draw loop, like:

```
function draw() {
  drawMap();
}  
```

... we should see something looking like this:

![map](https://raw.githubusercontent.com/whoisbma/Game-Aesthetics-SP16/master/class-09-raycasting/images/map.png)

##### Key input for walking and turning

Finally we need the code to actually update the player's position and direction based on key presses. We can do this in another function that will do a bit of trigonometry to update the direction vector, then just look for key presses and either rotate for left or right or add/subtract the direction vector to the position vector.

```
function updatePlayer(dt) {
  dir.x = cos(rot);
  dir.y = sin(rot);
  
  if (keyIsDown(LEFT_ARROW)) {
    rot -= rotSpeed;
  }
  if (keyIsDown(RIGHT_ARROW)) {
    rot += rotSpeed;
  }
  if (keyIsDown(UP_ARROW)) {
  	pos.x += dir.x * walkSpeed;
  	pos.y += dir.y * walkSpeed;
  }
  if (keyIsDown(DOWN_ARROW)) {
  	pos.x -= dir.x * walkSpeed;
  	pos.y -= dir.y * walkSpeed;
  }
}
```

##### Basic collision

We won't collide with anything this way though. What we can do is check to make sure the next position to move to does not correspond to a non-zero value in the map array, and only move if its empty.

```
if (keyIsDown(UP_ARROW)) {
	if (worldMap[floor(pos.x + dir.x * walkSpeed)]
    			[floor(pos.y + dir.y * walkSpeed)] === 0) {
    	pos.x += dir.x * walkSpeed;
  		pos.y += dir.y * walkSpeed;
  	}
}

if (keyIsDown(DOWN_ARROW)) {
  	if (worldMap[floor(pos.x - dir.x * walkSpeed)]
    			[floor(pos.y - dir.y * walkSpeed)] === 0) {
    	pos.x -= dir.x * walkSpeed;
  		pos.y -= dir.y * walkSpeed;
  	}
}

```

##### Sliding collision

This will make sure we don't go through the walls (as long as our movement speed isn't TOO fast). But it doesn't really feel too good to have to back out of a collision. We should be able to keep sliding along the wall.

In order to do this, we'll split up the check for the x and y directions of movement. If we're free in the x direction, we'll keep moving in the x direction. If we're free in the y direction, we'll keep moving in the y direction.

```
if (keyIsDown(UP_ARROW)) {
    if (worldMap[floor(pos.x + dir.x * walkSpeed)][floor(pos.y)] === 0) {
      pos.x += dir.x * walkSpeed;
    }
    if (worldMap[floor(pos.x)][floor(pos.y + dir.y * walkSpeed)] === 0) {
       pos.y += dir.y * walkSpeed;
    }
  }
if (keyIsDown(DOWN_ARROW)) {
    if (worldMap[floor(pos.x - dir.x * walkSpeed)][floor(pos.y)] === 0) {
      pos.x -= dir.x * walkSpeed;
    }
    if (worldMap[floor(pos.x)][floor(pos.y - dir.y * walkSpeed)] === 0) {
       pos.y -= dir.y * walkSpeed;
    }
}
```

##### Deltatime movement modification

The last thing to add is a deltatime system that will modify the speed we move based on how much time has passed since the last frame. This will ensure that as we move, our movement speed won't be influenced by the framerate. If the framerate drops, we won't slow down - only the frame rate! We'll move a larger distance from frame to frame. If the framerate is high, we'll move smaller amounts, meaning smoother movement from location to location.

First, create a global ```lastTime``` variable. We'll use this to track how much time passes between frames.

```
var lastTime;
```


Next, change the updatePlayer() function to take in a deltatime argument:

```
function updatePlayer(dt) {
  dir.x = cos(rot);
  dir.y = sin(rot);
  
  if (keyIsDown(LEFT_ARROW)) {
    rot -= rotSpeed * dt;
  }
  if (keyIsDown(RIGHT_ARROW)) {
    rot += rotSpeed * dt;
  }
  if (keyIsDown(UP_ARROW)) {
    if (worldMap[floor(pos.x + dir.x * walkSpeed * dt)][floor(pos.y)] === 0) {
      pos.x += dir.x * walkSpeed * dt;
    }
    if (worldMap[floor(pos.x)][floor(pos.y + dir.y * walkSpeed * dt)] === 0) {
       pos.y += dir.y * walkSpeed * dt;
    }
  }
  if (keyIsDown(DOWN_ARROW)) {
    if (worldMap[floor(pos.x - dir.x * walkSpeed * dt)][floor(pos.y)] === 0) {
      pos.x -= dir.x * walkSpeed * dt;
    }
    if (worldMap[floor(pos.x)][floor(pos.y - dir.y * walkSpeed * dt)] === 0) {
       pos.y -= dir.y * walkSpeed * dt;
    }
  }
}
```

Then inside of draw() we will use the lastTime and pass in a continually updated deltatime.

```
function draw() {
  var dt = millis() - lastTime;
  updatePlayer(dt);
  drawMap();
  lastTime = millis();
}
```

Now for the hard part.

### Raycasting

*Images, information, and some text coming from the excellent [lodev.org](http://lodev.org/cgtutor/raycasting.html) site.*

We can keep all the same logic as above. Same movement, same deltatime, same key input, same map data. Now we're just going to display it in a different way instead of calling ```drawMap();``` in the draw loop.

Essentially, we are going to draw a bunch of imaginary lines spreading out from the player position, each corresponding to one vertical line in the canvas. When each one of those vertical lines hits a "wall" in our array, we'll measure the distance, and then for the vertical line we're representing, draw an actual line that corresponds to the distance to the wall. If the distance is great, the line will be small - its off in the distance, so it doesn't take up much of our view. If the distance is small, the line will fill most of the vertical distance of the screen.

##### Context

Raycasting is a pseudo-3D technique. Nothing about this approach is actually 3D, but we "read" it as 3D. Back when computers were much slower it was impossible to run a true 3D engine in real-time, and raycasting was the first solution. Wolfenstein 3D was a famous implementation of this approach.

![Wolfenstein3D](http://lodev.org/cgtutor/images/wolf3d.jpg)

![w3dmap](http://lodev.org/cgtutor/images/wolfmapedit.jpg)

The raycasting engine of Wolfenstein 3D was very limited, allowing it to run on a even a 286 computer: all the walls have the same height and are orthogonal squares on a 2D grid. Things like stairs, jumping, or height differences were impossible to make with this engine. 

Later games such as Doom and Duke Nukem 3D also used raycasting, but much more advanced engines that allowed sloped walls, different heights, textured floors and ceilings, transparent walls, etc... The sprites are 2D images that always "face the camera" (btw there is no camera. just lines remember).

Raycasting is not the same as raytracing! Raycasting is a fast semi-3D technique that works in realtime even on 4MHz graphical calculators, while raytracing is a realistic rendering technique that supports reflections and shadows in true 3D scenes, and only recently computers became fast enough to do it in realtime for reasonably high resolutions and complex scenes.

![spectrum](http://www.hardcoregaming101.net/wolfenstein/spectrum.png)

Midimaze on the Atari ST (later/elsewhere known as Faceball 2000 etc.) was another application of this early technique with less Nazis.

![midimaze](https://upload.wikimedia.org/wikipedia/en/1/1a/ST_Midi_Maze.png)

![faceball on gameboy](http://www.racketboy.com/images/faceball-2000-235x210.gif)

Aesthetically related but not actual raycasting would be examples like the [Wizardry series](https://www.youtube.com/watch?v=kpQXViRZB54) or Eye of the Beholder. Check [this](http://wiki.mimicprod.net/doku.php?id=dungeoneye:mazerendering) out for an explanation.

![Wizardry](http://www.mobygames.com/images/shots/l/43910-wizardry-proving-grounds-of-the-mad-overlord-apple-ii-screenshot.gif)

![EotB](https://lh3.ggpht.com/-cjQXuy2qugU/USzF8wFmQqI/AAAAAAAAFqI/hJ2j6PswB9k/s1600/5327-dungeon-master-dos-screenshot-combat-s.gif)

##### The deeper explanation

Go to [lodev.org/cgtutor/raycasting.html](http://lodev.org/cgtutor/raycasting.html) for a thorough explanation.

##### Adjusting our code

As said before, we're keeping the same stuff from before, but we do need a new ```plane``` vector to be perpendicular to the camera direction vector.

```var plane;```

and instantiated in setup():

```plane = createVector(1, 0);```

and updated with the rotation of the camera in update(dt):

```plane.x = sin(rot);```

```plane.y = cos(rot);```

We're otherwise just making a new function that will draw our series of lines:

```
function raycast() {
	//time for math

}
```

Create two vectors that we'll reuse for each one of our rays, corresponding to each vertical pixel:

```
var rayPos = createVector(0,0);
var rayDir = createVector(0,0);

```

Then we actually do the loop for each vertical line. 

```
for (var x = 0; x < width; x++) {
	//the cameraX variable gives us a value to modify each ray's vector based on its x position
	var cameraX = (2 * x / width) - 1;
	
	//set the ray to start at the camera position, and the direction based on the plane and cameraX
    rayPos.set(pos.x, pos.y);
    rayDir.set(dir.x + plane.x * cameraX, dir.y + plane.y * cameraX);
    
    //stores the current array position of the ray
    var mapX = floor(rayPos.x);
    var mapY = floor(rayPos.y);
    
    //we're doing all the below to see how much to move in each direction, each step the ray takes
    var sideDistX;
    var sideDistY;
    
    var scaleX = 1/rayDir.x;
    var scaleY = 1/rayDir.y;
    var deltaDistX = (createVector(1, rayDir.y * scaleX)).mag();
    var deltaDistY = (createVector(1, rayDir.x * scaleY)).mag();
    
    var wallDist;
    
    var stepX;
    var stepY;
    
    var hit = 0;
    var side = 0;
    
    //which direction are we moving?
    if (rayDir.x < 0) {
      stepX = -1;
      sideDistX = (rayPos.x - mapX) * deltaDistX;
    } else {
      stepX = 1;
      sideDistX = (mapX + 1 - rayPos.x) * deltaDistX;
    }
    
    if (rayDir.y < 0) {
      stepY = -1;
      sideDistY = (rayPos.y - mapY) * deltaDistY;
    } else {
      stepY = 1;
      sideDistY = (mapY + 1 - rayPos.y) * deltaDistY;
    }
    
    //DDA (digital differential analysis)
    
    //if we haven't hit a wall, step until we do.
    while (hit === 0) {
      if (sideDistX < sideDistY) {
        sideDistX += deltaDistX;
        mapX += stepX;
        side = 0;
      } else {
        sideDistY += deltaDistY;
        mapY += stepY;
        side = 1;
      }
      if (worldMap[mapX][mapY] > 0) {
        hit = 1;
      }
    }
    
    //calculate the distance to the wall (modified to avoid a fisheye effect)
    if (side === 0) {
      wallDist = abs((mapX - rayPos.x + (1 - stepX) / 2) / rayDir.x);
    } else {
      wallDist = abs((mapY - rayPos.y + (1 - stepY) / 2) / rayDir.y);
    }
    
    //get the height of the line to draw based on the distance
    var lineHeight = abs(height/wallDist);
    lineHeight = min(lineHeight, height);
    
    //set different line colors based on which number it is in the array
    if (mapX >= 0 && mapY >= 0) {
      switch (worldMap[mapX][mapY]) {
      case 0:
        break;
      case 1:
        stroke(200, 150, 150);
        break;
      case 2:
        stroke(50, 100, 100);
        break;
      case 3:
        stroke(random(255));
        break;
      }
    }
    
	//make the line color darker if the ray hit the Y-side of the wall 
    if (side == 1) {
      switch (worldMap[mapX][mapY]) {
      case 1:
        stroke(200/2, 150/2, 150/2);
        break;
      case 2:
        stroke(50/2, 100/2, 100/2);
        break;
      case 3:
        stroke(150/2, 75/2, 100/2);
        break;
      }
    }
    
    //finally draw the line for this step in the loop!
    var startY = height/2 - lineHeight/2;
    line(x, startY, x, startY + lineHeight);
}
```

Then we just call raycast in our draw loop and call it a day.

```
function draw() {
  background(255);
  var dt = millis() - lastTime;
  updatePlayer(dt);
  raycast();
  lastTime = millis();
}
```

Full code is [here](https://gist.github.com/whoisbma/8fd99f3679d8246e74a22b20bfa606ee)!