#pragma once

#include "ofMain.h"
#include "ofxSpriteSheetRenderer.h"


//an animation struct we'll be assigning to our player as a default.
//check the class header for ofxSpriteSheetRenderer for all the info.
//this is so we can assign our player sprite a basic animation pattern to pass into the renderer.
//we can also change all these values after the fact, like changing the sprite index to draw when the player changes direction
static animation_t walkAnimation = {
    0,  //.index
    0,  //.frame
    2,  //.totalframes
    1,  //.width
    1,  //.height
    90, //.frameduration
    0,  //.nexttick
    -1, //.loops
    -1, //.finalindex
    1   //.frameskip
};


//this is a simple sprite data structure we're creating that holds both an animation struct and also a tileName int.
//we are using the tileName int for our static sprites like the background, and the animation struct for our moving sprites.
//ofPoint stores the position and we apply speed for the player's movement.
struct basicSprite {
    animation_t animation;
    int tileName;
    ofPoint pos;
    float speed;
};
//you could create your own struct or a class to store sprite information, or you could do it all loosey goosey if you want with no classes at all.

class ofApp : public ofBaseApp{

	public:
		void setup();
		void update();
		void draw();

		void keyPressed(int key);
		void keyReleased(int key);
		void mouseMoved(int x, int y );
		void mouseDragged(int x, int y, int button);
		void mousePressed(int x, int y, int button);
		void mouseReleased(int x, int y, int button);
		void mouseEntered(int x, int y);
		void mouseExited(int x, int y);
		void windowResized(int w, int h);
		void dragEvent(ofDragInfo dragInfo);
		void gotMessage(ofMessage msg);
    
        //create the instance of the spriteSheetRenderer. we only need one.
        ofxSpriteSheetRenderer* spriteRenderer;
    
        //create an instance of our basicSprite struct that we'll use to store player information
        //(this is technically a pointer to a basicSprite object but we use it essentially the same as we would if it was the object itself)
        basicSprite * player;

        //a vector is a C++ data structure like an array, except dynamic and powerful like a Java ArrayList.
        //we'll use this vector to store basicSprite structs for all our background tiles.
        vector<basicSprite *> backgrounds;
    
        //instead of just moving the player around on a static background, lets move a "camera" position along with the player.
        //this will move all the background tiles relative to the camera, making the world appear to move around the player's perspective.
        ofPoint cameraCenter;
    
        const float SCALE = 3; //constant to store our sprite scaling value
        const int GRIDW = 30;  //width in tiles of the background grid
        const int GRIDH = 30;  //height in tiles of the background grid
    
        //booleans to store keyboard state so we can move the player
        bool rightPressed;
        bool leftPressed;
        bool upPressed;
        bool downPressed;
    
        //lastly, we'll make a simple function that returns which sprite a tile is at a given x and y position
        //this is useful so we can find out which sprites the player is near so we can collide or not, for example.
        int getTileName(int x, int y);
};
