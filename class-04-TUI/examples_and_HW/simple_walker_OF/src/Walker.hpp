//
//  Walker.hpp
//  simple-walker-OF
//
//  Created by Bryan Ma on 2/24/16.
//
//

#ifndef Walker_hpp
#define Walker_hpp

#include <stdio.h>
#include "ofmain.h"

class Walker {
public:
    Walker();
    int x;
    int y;
    int numMoves;
    const int TOTALMOVES = 100;
    
    void update();
    void display();
};

#endif /* Walker_hpp */
