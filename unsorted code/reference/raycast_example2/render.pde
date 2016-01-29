void render(){  
  for(int rn=0;rn<screenwidth/sa;rn++){    
    if(ray[rn][0]>0){      
      wh=64/ray[rn][0]*255;      
      noStroke();      
      if(texon==1){
        tint((255/(ray[rn][0])*light)+ray[rn][3]);
        image(ptex[int(ray[rn][2])-1][int(ray[rn][1])],rn,height/2-wh,1,2*wh);
      }
      else{
        fill(((255/(ray[rn][0]))*light)+ray[rn][3]);
        rect(rn*sa,height/2-wh,sa,2*wh);
      }
    }  
  } 
  pushStyle();
  wh=64/ray[int(screenwidth/sa/2)][0]*255;   
  if(wh>0){   
    fill(255);
    rectMode(CENTER);
    //rect(width/2,height/2,wh/10,wh/10);
  }
  popStyle();
}

