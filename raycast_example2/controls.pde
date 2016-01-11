void controls(){  
  if(editmode==0){
    opx=px;
    opy=py;



    if(keys[shift]==true){
      if(editmode==1){
        if(mouseX<300&&mouseY<300){
          wall[int(mouseX/10)][int(mouseY/10)]=2;
        }
      }
      if (keys[alt]==true){
        if(keys[up]==true){    
          px=px+(moveSpeed+3)*cos(pa);    
          py=py+(moveSpeed+3)*sin(pa);  
        }  
        if(keys[down]==true){    
          px=px-(moveSpeed+3)*cos(pa);    
          py=py-(moveSpeed+3)*sin(pa);  
        }
        if(keys[left]==true){    
          px=px+(moveSpeed+3)*cos(pa-PI/2);    
          py=py+(moveSpeed+3)*sin(pa-PI/2);  
        }  
        if(keys[right]==true){    
          px=px+(moveSpeed+3)*cos(pa+PI/2);    
          py=py+(moveSpeed+3)*sin(pa+PI/2);   
        }  
      }
      else{
        if(keys[up]==true){    
          px=px+moveSpeed*cos(pa);    
          py=py+moveSpeed*sin(pa);  
        }  
        if(keys[down]==true){    
          px=px-moveSpeed*cos(pa);    
          py=py-moveSpeed*sin(pa);  
        }  
        if(keys[left]==true){    
          px=px+moveSpeed*cos(pa-PI/2);    
          py=py+moveSpeed*sin(pa-PI/2); 
        }  
        if(keys[right]==true){    
          px=px+moveSpeed*cos(pa+PI/2);    
          py=py+moveSpeed*sin(pa+PI/2);  
        }
      }
    }
    else{

      if (keys[alt]==true){
        if(editmode==1){
          if(mouseX<300&&mouseY<300){
            wall[int(mouseX/10)][int(mouseY/10)]=0;
          }
        }
        if(keys[up]==true){    
          px=px+(moveSpeed+3)*cos(pa);    
          py=py+(moveSpeed+3)*sin(pa);  
        }  
        if(keys[down]==true){    
          px=px-(moveSpeed+3)*cos(pa);    
          py=py-(moveSpeed+3)*sin(pa);  
        }
        if(keys[left]==true){    
          pa-=.15;  
        }  
        if(keys[right]==true){    
          pa+=.15;  
        }  
      }
      else{
        if(keys[up]==true){    
          px=px+moveSpeed*cos(pa);    
          py=py+moveSpeed*sin(pa);  
        }  
        if(keys[down]==true){    
          px=px-moveSpeed*cos(pa);    
          py=py-moveSpeed*sin(pa);  
        }  
        if(keys[left]==true){    
          pa-=.1;  
        }  
        if(keys[right]==true){    
          pa+=.1;  
        }
      }
    }

    if(px>30 && px<1920){
      if(py>30 && py<1920){

        if(wall[floor((px+playerSize)/64)][floor((py+playerSize)/64)]>0){
          col=1;
          float cpx=px;
          px=opx;
          if(wall[floor((px+playerSize)/64)][floor((py+playerSize)/64)]>0){
            py=opy;
            px=cpx;
          }
        }
        if(wall[floor((px-playerSize)/64)][floor((py+playerSize)/64)]>0){
          col=1;
          float cpx=px;
          px=opx;
          if(wall[floor((px-playerSize)/64)][floor((py+playerSize)/64)]>0){
            py=opy;
            px=cpx;
          }
        }
        if(wall[floor((px+playerSize)/64)][floor((py-playerSize)/64)]>0){
          col=1;
          float cpx=px;
          px=opx;
          if(wall[floor((px+playerSize)/64)][floor((py-playerSize)/64)]>0){
            py=opy;
            px=cpx;
          }
        }
        if(wall[floor((px-playerSize)/64)][floor((py-playerSize)/64)]>0){
          col=1;
          float cpx=px;
          px=opx;
          if(wall[floor((px-playerSize)/64)][floor((py-playerSize)/64)]>0){
            py=opy;
            px=cpx;
          }
        }
      }
    }
  }
  else{
    if(keys[up]==true){    
      light+=1;
    }  
    if(keys[down]==true){    
      light-=1;
    }  
    if(keys[left]==true){  
      savearray(); 

    }  
    if(keys[right]==true){    
      loadarray();
    }


  }
  if(keys[shift]==true){
    if(editmode==1){
      if(mouseX<300&&mouseY<300){
        //wall[int(mouseX/10)][int(mouseY/10)]=2;
      }
    }
  }
}

void mousePressed(){
  if(mouseButton==RIGHT){
    editmode++;
    if(editmode>1){
      editmode=0;
    }
  }
  if(mouseButton==LEFT){
    texon++;
    if(texon>1){
      texon=0;
    }

    if(editmode==1){
      if(mouseX<300&&mouseY<300){
        wall[int(mouseX/10)][int(mouseY/10)]++;
        if(wall[int(mouseX/10)][int(mouseY/10)]>1){
          wall[int(mouseX/10)][int(mouseY/10)]=0;
        }
      }
    }
  }
}

void keyPressed() {  
  if (keyCode == UP) {    
    keys[up] = true;  
  }    
  else if(keyCode == DOWN) {    
    keys[down] = true;  
  }   
  else if(keyCode == LEFT) {    
    keys[left] = true;  
  }   
  else if (keyCode == RIGHT) {    
    keys[right] = true;  
  }
  else if (keyCode == ALT) {    
    keys[alt] = true;  
  }
  else if (keyCode == SHIFT) {    
    keys[shift] = true;  
  }
}
void keyReleased() {  
  if (keyCode == UP) {    
    keys[up] = false;  
  }  
  else if(keyCode == DOWN) {    
    keys[down] = false;  
  }   
  else if(keyCode == LEFT) {    
    keys[left] = false;  
  }   
  else if (keyCode == RIGHT) {    
    keys[right] = false;  
  }
  else if (keyCode == ALT) {    
    keys[alt] = false;  
  }
  else if (keyCode == SHIFT) {    
    keys[shift] = false;  
  }
}  




