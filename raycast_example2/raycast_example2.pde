/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/8573*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
int[][] wall = new int[30][30];
int[] savemap1 = new int[5000];
String wallmap;
float[][] ray = new float[641][4]; //0-dist 1-texmap 2-texture 3-shade 
boolean[] keys = new boolean[7];
final int up = 0;
final int down = 1;
final int left = 2;
final int right = 3;
final int alt=4;
final int shift=5;
final int control=6;

float px=655,py=655,opx,opy,pa; //position and angle
float playerSize=15; 
float xa,ya; //ray starting position relative to the grid.
float oldxa,oldya;
float xc,yc,wh;
float moveSpeed=5;
float rd; //current ray distance between player and wall.
float sa=1; //slice accuracy (1 is 1 line per ray)
float light=100;
int screenwidth=640,screenheight=400;
int rn; //current ray number within raydist()
int texon=1;
int editmode=0;
int col,xCol,yCol;
PImage brick,dirt,sdirt;
PImage ptex[][]=new PImage[10][64];
PFont font;


void setup(){ 
  frameRate(30); 
  size(640,400);
  smooth();  
  font = createFont("FFScala", 16);
  textFont(font);
  textureparse();
  wall[15][10]=1;
}
void draw(){  
  //sa=mouseX/10+1;
  noStroke();  
  fill(0);  
  rect(0,0,width,height/2);  //ceiling
  fill(0);  
  rect(0,height/2,width,height/2);  //floor
  stroke(100);  
  println(frameRate);
  controls();
  if(editmode==0){
    xCol=0;
    raydist();  //cast rays and collect distances
    //åsprites();
    render();  //render raydist() info
  }
  if(editmode==1){
    edit();
  }
  fill(255);
  text(frameRate,0,height-15);
  if(sa<1){
    sa=1;
  }
}

void edit(){

  for(int x=0;x<30;x++){
    for(int y=0;y<30;y++){
      if(wall[x][y]>0){
        fill(100-10*wall[x][y]);
      }
      else{
        fill(200);
      }
      rect(x*10,y*10,10,10);
    }
  }
  pushMatrix();
  pushStyle();
  fill(255);
  stroke(0);
  translate(px/64*10,py/64*10);
  ellipse(0,0,10,10);
  stroke(255,0,0);
  rotate(pa);
  line(0,0,15,0);
  popStyle();
  popMatrix();
  text("Light Intensity:"+light,320,40);
}


void raydist(){  /*
      if(px>0 &&px<640*3){        
 if(py>0 &&py<640*3){          
 if(wall[floor(px/64)][floor(py/64)]==1){   
 
 
 
 }
 }
 }
 */
  rn=0;  
  for(float r=-PI/6;r<PI/6;r=r+(PI/3)/(screenwidth/sa)){    
    ray[rn][0]=-1;    
    //HORIZONTAL  
    if(sin(pa+r)<0){      
      ya=floor(py/64)*64-.001;      
      xc=64/tan(-(pa+r));      
      yc=-64;    
    }    
    else{      
      ya=floor(py/64)*64+64;      
      xc=64/tan(pa+r);      
      yc=64;    
    }    
    xa=px+((py-ya)/tan(-(pa+r))); 


    oldxa=xa;    
    oldya=ya;    
    for(int i=0;i<10;i++){      
      if(xa>0 &&xa<640*3){        
        if(ya>0 &&ya<640*3){          
          if(wall[floor(xa/64)][floor(ya/64)]>0){        

            rd=dist(xa,ya,px,py);

            if(ray[rn][0]==-1){              
              ray[rn][0]=rd*cos(r); 
              ray[rn][2] =wall[floor(xa/64)][floor(ya/64)];
              ray[rn][1]=int(xa%64); 
              ray[rn][3]=40;        
            }            
            else{              
              if(rd<ray[rn][0]/cos(r)){                
                ray[rn][0]=rd*cos(r);    
                ray[rn][1]=int(xa%64); 
                ray[rn][2] =wall[floor(xa/64)][floor(ya/64)];
                ray[rn][3]=40;            
              }    

            }


          }        
        }      
      }      
      xa=oldxa+xc;      
      ya=oldya+yc;      
      oldxa=xa;      
      oldya=ya;    
    }       
    if(sin(pa+PI/2+r)<0){      
      xa=floor(px/64)*64-.001;      
      yc=64*tan(-(pa+r));      
      xc=-64;    
    }    
    else{      
      xa=floor(px/64)*64+64;      
      yc=64*tan(pa+r);      
      xc=64;    
    }    
    ya=py+((px-xa)/tan(pa+PI/2+r));    
    oldxa=xa;    
    oldya=ya;    
    for(int i=0;i<10;i++){      
      if(xa>0 &&xa<640*3){        
        if(ya>0 &&ya<640*3){          
          if(wall[floor(xa/64)][floor(ya/64)]>0){            
            rd=dist(xa,ya,px,py);    

            if(ray[rn][0]==-1){              
              ray[rn][0]=rd*cos(r);
              ray[rn][1]=int(ya%64);  
              ray[rn][2] =wall[floor(xa/64)][floor(ya/64)];
              ray[rn][3]=10;                
            }            
            else{              
              if(rd<ray[rn][0]/cos(r)){                
                ray[rn][0]=rd*cos(r);  
                ray[rn][1]=int(ya%64);  
                ray[rn][2] =wall[floor(xa/64)][floor(ya/64)];
                ray[rn][3]=10;                
              }    

            }          
          }        
        }      
      }      
      xa=oldxa+xc;      
      ya=oldya+yc;      
      oldxa=xa;      
      oldya=ya;    
    }    
    rn++;  
  }
}

void savearray() {
  int i = 0;
  for(int y = 0; y < 30; y++) {
    for(int x = 0; x < 30; x++) {
      savemap1[i] = wall[x][y];
      i++;
    }
  }
  saveStrings("savemap1.txt",str(savemap1));
}

void loadarray() {
  int i = 0;
  savemap1 = int(loadStrings("savemap1.txt"));
  for(int y = 0; y < 30; y++) {
    for(int x = 0; x < 30; x++) {
      wall[x][y] = savemap1[i];
      i++;
    }
  }
}




