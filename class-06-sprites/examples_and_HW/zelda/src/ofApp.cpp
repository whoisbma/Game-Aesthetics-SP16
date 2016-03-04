#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup(){
    ofSetFrameRate(30);
    spriteRenderer = new ofxSpriteSheetRenderer(1, 10000, 1, 16);
    spriteRenderer->loadTexture("link.png", 64, GL_NEAREST);
    
    player = new animatingSprite();
    player->pos.set(ofGetWindowWidth()/2, ofGetWindowHeight()/2);
//
    player->animation = walkAnimation;
    player->animation.index = 6;
    
    for (int i = 0; i < 50; i++) {
        for (int j = 0; j < 50; j++) {
            basicSprite * background = new basicSprite();
            background->pos.set(j * spriteRenderer->getTileSize() * SCALE,i * spriteRenderer->getTileSize() * SCALE);
            background->tileName = floor(ofRandom(8, 12));
            backgrounds.push_back(background);
        }
    }
}

//--------------------------------------------------------------
void ofApp::update(){
    spriteRenderer->clear();
    spriteRenderer->update(ofGetElapsedTimeMillis());
    
    
    for (int i = 0; i < backgrounds.size(); i++) {
        spriteRenderer->addCenteredTile(backgrounds[i]->tileName, 0, backgrounds[i]->pos.x, backgrounds[i]->pos.y, 0, 1, 1, F_NONE, SCALE);
    }
    spriteRenderer->addCenteredTile(&player->animation, player->pos.x, player->pos.y, 1, F_NONE, SCALE);

}

//--------------------------------------------------------------
void ofApp::draw(){
    spriteRenderer->draw();
}

//--------------------------------------------------------------
void ofApp::keyPressed(int key){

}

//--------------------------------------------------------------
void ofApp::keyReleased(int key){

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
