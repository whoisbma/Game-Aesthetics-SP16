#pragma once

#include "ofMain.h"
#include "ofxSpriteSheetRenderer.h"

struct basicSprite {
    int tileName; //which tile to draw?
    ofPoint pos; //tile position
};

struct animatingSprite {
    animation_t animation;
    ofPoint pos;
};

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
		
    ofxSpriteSheetRenderer * spriteRenderer;
    vector<basicSprite *> backgrounds;
    animatingSprite * player;
    
    const float SCALE = 3;
    
    
};
