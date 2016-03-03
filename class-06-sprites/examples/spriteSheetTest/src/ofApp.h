#pragma once

#include "ofMain.h"
#include "ofxSpriteSheetRenderer.h"

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

struct basicSprite {
    animation_t animation;
    int tileName; //used for static sprites?
    ofPoint pos;
    float speed;
};

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
    
    ofxSpriteSheetRenderer* spriteRenderer;
    basicSprite * link;
    vector<basicSprite *> backgrounds;
    ofPoint playerpos;
    ofPoint cameraCenter;
    
    const float SCALE = 3;
    bool rightPressed;
    bool leftPressed;
    bool upPressed;
    bool downPressed;
    
    void spaceFree(int dir);
    int getTileName(int x, int y);
		
};
