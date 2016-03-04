#include "ofApp.h"

// comparison routine for sort - this would be used for elements on top of the background to ensure elements at the bottom of the screen are drawn in front of objects higher up on the screen. see the ofx addon example code.
bool sortVertically(basicSprite * a, basicSprite * b ) {
    return a->pos.y > b->pos.y;
}

// this method will be used to get the index of the sprite the player is standing on, or to check for possible collisions with "solid" tiles.
int ofApp::getTileName(int x, int y) {
    return backgrounds[y * GRIDW + x]->tileName;
}


//--------------------------------------------------------------
void ofApp::setup(){
    //set a limited frame rate, enable alpha blending, and set no anti-aliasing for more pixel arty kind of vibe.
    ofSetFrameRate(30);
    ofEnableAlphaBlending();
    ofDisableAntiAliasing();
    
    //create the sprite renderer with 2 layers, and 16x16 tiles.
    spriteRenderer = new ofxSpriteSheetRenderer(2, 10000, 0, 16);
    
    //load in the 64x64 pixels texture.
    spriteRenderer->loadTexture("link.png", 64, GL_NEAREST);
    
    //create "player" as an instance of our basicSprite struct, then set his position, speed, and default animation.
    player = new basicSprite();
    player->pos.set(ofGetWindowWidth()/2, ofGetWindowHeight()/2);
    player->speed = 0.1;
    player->animation = walkAnimation;
    
    //override the walkAnimation's default index to have Link starting facing down.
    player->animation.index = 6;
    
    //loop through the grid size that we want, make a new sprite for each background tile we want,
    //then set its position based on the grid and our scale, then push it to the vector to hold it.
    //we'll be looping through the vector to access these sprites' values.
    for (int i = 0; i < GRIDH; i++) {
        for (int j = 0; j < GRIDW; j++) {
            basicSprite * newSprite = new basicSprite();
            newSprite->pos.set(j*spriteRenderer->getTileSize()*SCALE, i*spriteRenderer->getTileSize()*SCALE);
            newSprite->tileName = (int)ofRandom(8,12);
            backgrounds.push_back(newSprite);
        }
    }
    
}

//--------------------------------------------------------------
void ofApp::update(){
    //clear and update the renderer
    spriteRenderer->clear();
    spriteRenderer->update(ofGetElapsedTimeMillis());
    
    //add the Link sprite to the renderer.
    spriteRenderer->addCenteredTile(&player->animation, player->pos.x - cameraCenter.x, player->pos.y - cameraCenter.y, 1, F_NONE, SCALE);
    
    //if there are backgrounds, loop through it and add each one to the renderer.
    if (backgrounds.size() > 0) {
        for (int i = backgrounds.size()-1; i>=0; i--) {
            //this line isn't necessary and in fact is imperfect, but uncomment to see how we might limit drawing to only the current screen area.
            //if (backgrounds[i]->pos.x > 0 && backgrounds[i]->pos.x < ofGetWindowWidth() && backgrounds[i]->pos.y > 0 && backgrounds[i]->pos.y < ofGetWindowHeight()) {
                spriteRenderer->addCenteredTile(backgrounds[i]->tileName, 0, backgrounds[i]->pos.x, backgrounds[i]->pos.y, 0, 1, 1, F_NONE, SCALE);
            //}
        }
    }
    
    //update the background position based on the grid and the camera position.
    for (int i = 0; i < GRIDH; i++) {
        for (int j = 0; j < GRIDW; j++) {
            backgrounds[i * GRIDW + j]->pos.set(j*spriteRenderer->getTileSize()*SCALE - cameraCenter.x, i*spriteRenderer->getTileSize()*SCALE - cameraCenter.y);
        }
    }
    
    //update the player's position and animation index based on key presses.
    if (leftPressed) {
        player->pos.x -= player->speed * spriteRenderer->getTileSize()*SCALE;
        player->animation.index = 4;
    }
    if (rightPressed) {
        player->pos.x += player->speed * spriteRenderer->getTileSize()*SCALE;
        player->animation.index = 2;
    }
    if (upPressed) {
        player->pos.y -= player->speed * spriteRenderer->getTileSize()*SCALE;
        player->animation.index = 0;
    }
    if (downPressed) {
        player->pos.y += player->speed * spriteRenderer->getTileSize()*SCALE;
        player->animation.index = 6;
    }
    
    //if no keys are being pressed, stop animating.
    //if keys are being pressed, animate Link's sprite.
    if (!leftPressed && !rightPressed && !upPressed && !downPressed) {
        player->animation.loops = 0;
    } else {
        player->animation.loops = -1;
        
        //this is an application of how we could check the player's position against the tiles.
        //we could use this approach to do collision detection for example.
        
        int tilePosX = floor((player->pos.x + (spriteRenderer->getTileSize() * SCALE)/2) / (spriteRenderer->getTileSize() * SCALE));
        int tilePosY = floor((player->pos.y + (spriteRenderer->getTileSize() * SCALE)/2) / (spriteRenderer->getTileSize() * SCALE));
        
        cout << "pos.x relative to tiles: " <<  tilePosX << ", pos.y relative to tiles: " <<  tilePosY << endl;
        
        cout << "background sprite index: " << getTileName(tilePosX, tilePosY) << endl;
    }

    //update the camera position to focus on the player's position.
    cameraCenter.x = player->pos.x - ofGetWindowWidth()/2;
    cameraCenter.y = player->pos.y - ofGetWindowHeight()/2;
}

//--------------------------------------------------------------
void ofApp::draw(){
    spriteRenderer->draw();
    
    //uncomment this code to see the origin point of all our sprites (remember we're using addCenteredTile)
    //for (int i = 0; i < 30; i++) {
        //for (int j = 0; j < 30; j++) {
            //ofDrawEllipse(backgrounds[i * 30 + j]->pos.x, backgrounds[i * 30 + j]->pos.y, 5, 5);
        //}
    //}
    //ofDrawEllipse(link->pos.x-cameraCenter.x, link->pos.y-cameraCenter.y, 10, 10);
    
}

//in keyPressed and keyReleased, we just check for the directional keys and then turn on or off our corresponding booleans.

//--------------------------------------------------------------
void ofApp::keyPressed(int key){
    if (key == OF_KEY_LEFT) {
        leftPressed = true;
    }
    if (key == OF_KEY_RIGHT) {
        rightPressed = true;
    }
    if (key == OF_KEY_UP) {
        upPressed = true;
    }
    if (key == OF_KEY_DOWN) {
        downPressed = true;
    }
}

//--------------------------------------------------------------
void ofApp::keyReleased(int key){
    if (key == OF_KEY_LEFT) {
        leftPressed = false;
    }
    if (key == OF_KEY_RIGHT) {
        rightPressed = false;
    }
    if (key == OF_KEY_UP) {
        upPressed = false;
    }
    if (key == OF_KEY_DOWN) {
        downPressed = false;
    }
}

//--------------------------------------------------------------
void ofApp::mouseMoved(int x, int y ){

}

//--------------------------------------------------------------
void ofApp::mouseDragged(int x, int y, int button){

}

//--------------------------------------------------------------
void ofApp::mousePressed(int x, int y, int button){

}

//--------------------------------------------------------------
void ofApp::mouseReleased(int x, int y, int button){

}

//--------------------------------------------------------------
void ofApp::mouseEntered(int x, int y){

}

//--------------------------------------------------------------
void ofApp::mouseExited(int x, int y){

}

//--------------------------------------------------------------
void ofApp::windowResized(int w, int h){

}

//--------------------------------------------------------------
void ofApp::gotMessage(ofMessage msg){

}

//--------------------------------------------------------------
void ofApp::dragEvent(ofDragInfo dragInfo){ 

}
