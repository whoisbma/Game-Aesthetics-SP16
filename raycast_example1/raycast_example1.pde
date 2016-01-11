/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/138964*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
/*
  Line grid algorithm from lodev.org
  
  Much more developed version here: 
  http://asalga.github.io/P5RayCaster/
  
  My OpenFramework blog about how this works: 
  http://asalga.wordpress.com/2014/01/22/understanding-raycasting-step-by-step/
  
  Andor Salga
  
  *** WORK IN PROGRESS***
*/
/*
  Raycast algorithm from lodev.org
  
  Andor Salga
  
  WORK IN PROGRESS
*/

// TODO: fix me
int[][] worldMap = new int[][] {
    {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
    {1,2,0,2,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
    {1,2,0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
    {1,2,0,2,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
    {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
    {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
    {1,2,0,3,3,2,2,2,0,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
    {1,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
    {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
    {1,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
    {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
    {1,3,3,3,3,3,3,3,0,0,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
    {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
    {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
    {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
    {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
    {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
    {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
    {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
    {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
    {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
    {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
    {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
    {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
    {1,0,0,0,2,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
    {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
    {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
    {1,0,0,0,0,0,0,0,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
    {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
    {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
    {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
    {1,3,3,3,3,3,3,3,0,0,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
    {1,0,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
    {1,3,0,0,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
    {1,2,0,0,0,2,0,0,3,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
    {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1}
};

float lastTime;
Debugger debug;

// 
PVector pos = new PVector(4, 4);
PVector dir = new PVector(0, 1);
PVector right = new PVector(1, 0);
float FOV = 0.6f;
int gameWidth;
int gameHeight;


int lineWeight = 1;

float rot = 0.0f;

// Put these in a user controller class
final float ROT_SPEED = 0.025f;
float walkSpeed = 0.005f;

void setup() {
    size(400, 400,P2D);
    
    gameWidth = width;
    gameHeight = height;

    strokeCap(PROJECT);
    debug = new Debugger();
}

/*

*/
void update(float dt){
  if(Keyboard.isKeyDown(KEY_LEFT)){
    rot += ROT_SPEED;
  }
  if(Keyboard.isKeyDown(KEY_RIGHT)){
    rot -= ROT_SPEED;
  }
  if(Keyboard.isKeyDown(KEY_UP)){
    pos.add(new PVector( dir.x * walkSpeed * dt,  dir.y * walkSpeed * dt));
  }
  if(Keyboard.isKeyDown(KEY_DOWN)){
    pos.add(new PVector(-dir.x * walkSpeed * dt, -dir.y * walkSpeed * dt));
  }
}

/*
*/
void draw() {
  
    float dt = millis() - lastTime;
    update(dt);

    background(128);

    noStroke();
    fill(0);
    rect(width/2-gameWidth/2, height/2 - gameHeight/2,  gameWidth , gameHeight);

    //
    debug.clear();
    debug.addString("FPS: " + floor(frameRate));
    debug.addString("Arrow keys: movement");
    debug.addString("D: toggle debug info");
    debug.addString("Q & W: change dimensions");
    debug.addString("E & R: change resolution");

    //
    dir.x =  cos(rot);
    dir.y = -sin(rot);
    
    right.x = sin(rot);
    right.y = cos(rot);
    
    strokeWeight(lineWeight);

    int startX = width/2 - gameWidth/2;

    // For every vertical line on the viewport
    for (int x = startX; x < width - startX; x += lineWeight) {

        float camX = 2.0f * x / float(width) - 1;
        PVector rayPos = new PVector(pos.x, pos.y);
        PVector rayDir = new PVector(dir.x + right.x * camX, dir.y + right.y * camX);

        int mapX = int(rayPos.x);
        int mapY = int(rayPos.y);

        float sideDistX;
        float sideDistY;

        float scaleX = 1.0 / rayDir.x;
        float scaleY = 1.0 / rayDir.y;

        // scale the vector by the inverse of the x component,
        // which makes the x component equal to one.
        // then calculate the magnitude
        float deltaDistX = (new PVector(1, rayDir.y * scaleX)).mag();
        float deltaDistY = (new PVector(1, rayDir.x * scaleY)).mag();

        float wallDist;

        int stepX;
        int stepY;

        int hit = 0;
        int side = 0;

        if (rayDir.x < 0) {
            stepX = -1;
            sideDistX = (rayPos.x - mapX) * deltaDistX;
        } else {
            stepX = 1;
            sideDistX = (mapX + 1.0 - rayPos.x) * deltaDistX;
        }

        if (rayDir.y < 0) {
            stepY = -1;
            sideDistY = (rayPos.y - mapY) * deltaDistY;
        } else {
            stepY = 1;
            sideDistY = (mapY + 1.0 - rayPos.y) * deltaDistY;
        }

        ////////////////////////////////////////////////////////////////
        // Search
        while (hit == 0) {
            if (sideDistX < sideDistY) {
                sideDistX += deltaDistX;
                mapX += stepX;
                side = 0;
            } else {
                sideDistY += deltaDistY;
                mapY += stepY;
                side = 1;
            }
            //if(mapX < 0 || mapY < 0){
            //  hit = 1;

            if (worldMap[mapX][mapY] > 0) {
                hit = 1;
            }
        }
        ////////////////////////////////////////////////////////////////

        //Calculate distance projected on camera direction (oblique distance will give fisheye effect!)
        if (side == 0){
            wallDist = abs((mapX - rayPos.x + (1.0 - stepX) / 2.0) / rayDir.x);
        }
        else{
            wallDist = abs((mapY - rayPos.y + (1.0 - stepY) / 2.0) / rayDir.y);
        }
        
        float lineHeight = abs(gameHeight / wallDist);
        lineHeight = min(lineHeight, gameHeight);

        if (mapX >= 0 && mapY >= 0) {
            switch (worldMap[mapX][mapY]) {
            case 0:
                break;
            case 1:
                stroke(255, 0, 0);
                break;
            case 2:
                stroke(0, 255, 0);
                break;
            case 3:
                stroke(0, 0, 255);
                break;
            }
        }

        if (side == 1) {
            switch (worldMap[mapX][mapY]) {
            case 1:
                stroke(255 / 2., 0, 0);
                break;
            case 2:
                stroke(0, 255 / 2., 0);
                break;
            case 3:
                stroke(0, 0, 255 / 2.);
                break;
            }
        }

        // Center the line 
        float startY = height / 2 - lineHeight / 2;
        line(x, startY, x, startY + lineHeight);
    }

    debug.draw();


    lastTime = millis();
}

void keyReleased(){
  Keyboard.setKeyDown(keyCode, false);
}

void keyPressed(){
  Keyboard.setKeyDown(keyCode, true);

  if(Keyboard.isKeyDown(KEY_R)){
    lineWeight += 2;
  }
  if(Keyboard.isKeyDown(KEY_E)){
    lineWeight -= 2;
    lineWeight = max(1, lineWeight);
  }

  if(Keyboard.isKeyDown(KEY_Q)){
    gameWidth -= 50;
    gameHeight -= 50;
  }

  if(Keyboard.isKeyDown(KEY_W)){
    gameWidth += 50;
    gameHeight += 50;
  }

  if(Keyboard.isKeyDown(KEY_D)){
    debug.toggle();
  }
}
/*
 * Classes poll keyboard state to get state of keys.
 */
public static class Keyboard{
  
  private static final int NUM_KEYS = 128;
  
  // Locking keys are good for toggling things.
  // After locking a key, when a user presses and releases a key, it will register and
  // being 'down' (even though it has been released). Once the user presses it again,
  // it will register as 'up'.
  private static boolean[] lockableKeys = new boolean[NUM_KEYS];
  
  // Use char since we only need to store 2 states (0, 1)
  private static char[] lockedKeyPresses = new char[NUM_KEYS];
  
  // The key states, true if key is down, false if key is up.
  private static boolean[] keys = new boolean[NUM_KEYS];
  
  /*
   * The specified keys will stay down even after user releases the key.
   * Once they press that key again, only then will the key state be changed to up(false).
   */
  public static void lockKeys(int[] keys){
    for(int k : keys){
      if(isValidKey(k)){
        lockableKeys[k] = true;
      }
    }
  }
  
  /*
   * TODO: if the key was locked and is down, then we unlock it, it needs to 'pop' back up.
   */
  public static void unlockKeys(int[] keys){
    for(int k : keys){
      if(isValidKey(k)){
        lockableKeys[k] = false;
      }
    }
  }
  
  /*
   *
   */
  public static void reset(){
    
  }
  
  /* This is for the case when we want to start off the game
   * assuming a key is already down.
   */
  public static void setVirtualKeyDown(int key, boolean state){
    setKeyDown(key, true);
    setKeyDown(key, false);
  }
  
  /**
   */
  private static boolean isValidKey(int key){
    return (key > -1 && key < NUM_KEYS);
  }
  
  /*
   * Set the state of a key to either down (true) or up (false)
   */
  public static void setKeyDown(int key, boolean state){
    
    if(isValidKey(key)){
      
      // If the key is lockable, as soon as we tell the class the key is down, we lock it.
      if( lockableKeys[key] ){
          // First time pressed
          if(state == true && lockedKeyPresses[key] == 0){
            lockedKeyPresses[key]++;
            keys[key] = true;
          }
          // First time released
          else if(state == false && lockedKeyPresses[key] == 1){
            lockedKeyPresses[key]++;
          }
          // Second time pressed
          else if(state == true && lockedKeyPresses[key] == 2){
             lockedKeyPresses[key]++;
          }
          // Second time released
          else if (state == false && lockedKeyPresses[key] == 3){
            lockedKeyPresses[key] = 0;
            keys[key] = false;
          }
      }
      else{
        keys[key] = state;
      }
    }
  }
  
  /* 
   * Returns true if the specified key is down.
   */
  public static boolean isKeyDown(int key){
    return keys[key];
  }
}

// These are outside of keyboard simply because I don't want to keep
// typing Keyboard.KEY_* in the main Tetrissing.pde file
final int KEY_BACKSPACE = 8;
final int KEY_TAB       = 9;
final int KEY_ENTER     = 10;

final int KEY_SHIFT     = 16;
final int KEY_CTRL      = 17;
final int KEY_ALT       = 18;

final int KEY_CAPS      = 20;
final int KEY_ESC       = 27;

final int KEY_SPACE  = 32;
final int KEY_PGUP   = 33;
final int KEY_PGDN   = 34;
final int KEY_END    = 35;
final int KEY_HOME   = 36;

final int KEY_LEFT   = 37;
final int KEY_UP     = 38;
final int KEY_RIGHT  = 39;
final int KEY_DOWN   = 40;

final int KEY_0 = 48;
final int KEY_1 = 49;
final int KEY_2 = 50;
final int KEY_3 = 51;
final int KEY_4 = 52;
final int KEY_5 = 53;
final int KEY_6 = 54;
final int KEY_7 = 55;
final int KEY_8 = 56;
final int KEY_9 = 57;

final int KEY_A = 65;
final int KEY_B = 66;
final int KEY_C = 67;
final int KEY_D = 68;
final int KEY_E = 69;
final int KEY_F = 70;
final int KEY_G = 71;
final int KEY_H = 72;
final int KEY_I = 73;
final int KEY_J = 74;
final int KEY_K = 75;
final int KEY_L = 76;
final int KEY_M = 77;
final int KEY_N = 78;
final int KEY_O = 79;
final int KEY_P = 80;
final int KEY_Q = 81;
final int KEY_R = 82;
final int KEY_S = 83;
final int KEY_T = 84;
final int KEY_U = 85;
final int KEY_V = 86;
final int KEY_W = 87;
final int KEY_X = 88;
final int KEY_Y = 89;
final int KEY_Z = 90;

// Function keys
final int KEY_F1  = 112;
final int KEY_F2  = 113;
final int KEY_F3  = 114;
final int KEY_F4  = 115;
final int KEY_F5  = 116;
final int KEY_F6  = 117;
final int KEY_F7  = 118;
final int KEY_F8  = 119;
final int KEY_F9  = 120;
final int KEY_F10 = 121;
final int KEY_F12 = 122;

//final int KEY_INSERT = 155;

/*
 * Prints text on top of everything for real-time object tracking.
 */
class Debugger{
  private ArrayList strings;
  private PFont font;
  private int fontSize;
  private boolean isOn;
  
  public Debugger(){
    isOn = true;
    strings = new ArrayList();
    fontSize = 15;
    font = createFont("Arial", fontSize);
  }
  
  public void addString(String s){
    if(isOn){
      strings.add(s);
    }
  }
  
  /*
   * Should be called after every frame
   */
  public void clear(){
    strings.clear();
  }
  
  /**
    If the debugger is off, it will ignore calls to addString and draw saving
    some processing time.
  */
  public void toggle(){
    isOn = !isOn;
  }
  
  public void draw(){
    if(isOn){
      int y = 20;
      fill(255);
      for(int i = 0; i < strings.size(); i++, y+=fontSize){
        textFont(font);
        text((String)strings.get(i),0,y);
      }
    }
  }
}