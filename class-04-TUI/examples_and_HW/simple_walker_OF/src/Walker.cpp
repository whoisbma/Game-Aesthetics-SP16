//
//  Walker.cpp
//  simple-walker-OF
//
//  Created by Bryan Ma on 2/24/16.
//
//

#include "Walker.hpp"

Walker::Walker() {
    x = ofGetWindowWidth()/2;
    y = ofGetWindowHeight()/2;
    cout << "here i am at x: " << x << ", y: " << y << endl;
}

void Walker::update() {
    if (numMoves < TOTALMOVES) {
        int r = floor(ofRandom(4));
        if (r == 0) {
            y-=10;
        } else if (r == 1) {
            x+=10;
        } else if (r == 2) {
            y+=10;
        } else if (r == 3) {
            x-=10;
        }
        numMoves++;
        cout << "x: " << x << ", y: " << y << endl;
    }
}

void Walker::display() {
    cout << "drawing\n";
    ofSetColor(255,255,255);
    ofDrawEllipse(x, y, 10, 10);
}