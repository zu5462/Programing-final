class witch{
  PImage witch;
  float Xsize=90;
  float Ysize=55;
  float wX=550;
  float wY=230;
  int wSpeed;
  float RwX=0;
  float RwY=height/2.0;
  float rot=0.0; 
  
void load(){
   witch=loadImage("data/pic/Witch.png");
}

void display(){
    imageMode(CENTER);
    image(witch,wX,wY);
}

void Dead(){
      background((int)random(150,255),(int)random(255),(int)random(255));
      yell.play();
      pushMatrix();
      translate(wX,wY);
      rotate(rot);
      imageMode(CENTER);
      image(witch,0,0); 
      wY += 5.0;
      rot += 2*PI/30;
      popMatrix();
       if (wY > height) {
         yell.pause();
         gameState=game_LOSE;
       }  
}

witch(){
   wX=550;
   wY=235.5;
   wSpeed=30;
  }
}
