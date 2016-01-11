void textureparse(){
  dirt=loadImage("wall64.jpg");
  for(int i=0;i<1;i++){
    for(int t=0;t<64;t++){
      if(i==0){
        ptex[i][t]=dirt.get(t,0,1,64);
      }
    }
  }
}


