#include "ofApp.h"


void ofApp::spaceFree(int dir) {
    
    switch (dir) {
        case 0:
            break;
        case 1:
            break;
        case 2:
            break;
        case 3:
            break;
        default:
            break;
    }
}

int ofApp::getTileName(int x, int y) {
    return backgrounds[y * 30 + x]->tileName;
}


//--------------------------------------------------------------
void ofApp::setup(){
    ofSetFrameRate(30);
    spriteRenderer = new ofxSpriteSheetRenderer(2, 10000, 0, 16);
    spriteRenderer->loadTexture("link.png", 64, GL_NEAREST);
    ofEnableAlphaBlending();
    ofDisableAntiAliasing();
    
    link = new basicSprite();
    link->pos.set(ofGetWindowWidth()/2, ofGetWindowHeight()/2);
    link->animation = walkAnimation;
    link->animation.index = 6;
    
    for (int i = 0; i < 30; i++) {
        for (int j = 0; j < 30; j++) {
            basicSprite * newSprite = new basicSprite();
            newSprite->pos.set(j*spriteRenderer->getTileSize()*SCALE, i*spriteRenderer->getTileSize()*SCALE);
            newSprite->tileName = (int)ofRandom(8,12);
            backgrounds.push_back(newSprite);
        }
    }
    
    playerpos.set(0,0);
}

//--------------------------------------------------------------
void ofApp::update(){
    spriteRenderer->clear();
    spriteRenderer->update(ofGetElapsedTimeMillis());
    
    spriteRenderer->addCenteredTile(&link->animation, link->pos.x - cameraCenter.x, link->pos.y - cameraCenter.y, 1, F_NONE, SCALE);

    if (backgrounds.size() > 0) {
        for (int i = backgrounds.size()-1; i>=0; i--) {
            spriteRenderer->addCenteredTile(backgrounds[i]->tileName, 0, backgrounds[i]->pos.x, backgrounds[i]->pos.y, 0, 1, 1, F_NONE, SCALE);
        }
    }
    
    for (int i = 0; i < 30; i++) {
        for (int j = 0; j < 30; j++) {
            backgrounds[i * 30 + j]->pos.set(j*spriteRenderer->getTileSize()*SCALE - cameraCenter.x, i*spriteRenderer->getTileSize()*SCALE - cameraCenter.y);
        }
    }
    
    if (leftPressed) {
        link->pos.x-=0.1 * spriteRenderer->getTileSize()*SCALE;
        link->animation.index = 4;
    }
    if (rightPressed) {
        link->pos.x+=0.1 * spriteRenderer->getTileSize()*SCALE;
        link->animation.index = 2;
    }
    if (upPressed) {
        link->pos.y-=0.1 * spriteRenderer->getTileSize()*SCALE;
        link->animation.index = 0;
    }
    if (downPressed) {
        link->pos.y+=0.1 * spriteRenderer->getTileSize()*SCALE;
        link->animation.index = 6;
    }
    
    if (!leftPressed && !rightPressed && !upPressed && !downPressed) {
        link->animation.loops = 0;
    } else {
        link->animation.loops = -1;
//        cout << "pos.x: " << link->pos.x << ", pos.y: " << link->pos.y << endl;
        
        int tilePosX = floor((link->pos.x + (spriteRenderer->getTileSize() * SCALE)/2) / (spriteRenderer->getTileSize() * SCALE));
        int tilePosY = floor((link->pos.y + (spriteRenderer->getTileSize() * SCALE)/2) / (spriteRenderer->getTileSize() * SCALE));
        
        cout << "pos.x relative to tiles: " <<  tilePosX << ", pos.y relative to tiles: " <<  tilePosY << endl;
        
        cout << getTileName(tilePosX, tilePosY) << endl;
    }
    
    cameraCenter.x = link->pos.x - ofGetWindowWidth()/2;
    cameraCenter.y = link->pos.y - ofGetWindowHeight()/2;
    
//    cout << "framerate: " << ofGetFrameRate() << endl;
    
}

//--------------------------------------------------------------
void ofApp::draw(){
    spriteRenderer->draw();
    
//    for (int i = 0; i < 30; i++) {
//        for (int j = 0; j < 30; j++) {
//            ofDrawEllipse(backgrounds[i * 30 + j]->pos.x, backgrounds[i * 30 + j]->pos.y, 5, 5);
//        }
//    }
//    ofDrawEllipse(link->pos.x-cameraCenter.x, link->pos.y-cameraCenter.y, 10, 10);
    
}

//--------------------------------------------------------------
void ofApp::keyPressed(int key){
    if (key == OF_KEY_LEFT) {
        leftPressed = true;
        link->animation.loops = -1;
    }
    if (key == OF_KEY_RIGHT) {
        rightPressed = true;
        link->animation.loops = -1;
    }
    if (key == OF_KEY_UP) {
        upPressed = true;
        link->animation.loops = -1;
    }
    if (key == OF_KEY_DOWN) {
        downPressed = true;
        link->animation.loops = -1;
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
