class bird{
  PImage bird;
  float bX;
  float bY;
  float speed;
  float size;

void birdload(){
  bird=loadImage("data/pic/bird.png");
 }

void display(){
    imageMode(CENTER);
    image(bird,bX,bY);
}

void move(){
   bX+=speed;
   if(bX>width){
   bX=0;
   bY=random(Witch.wY-80,Witch.wY+80);
   }
}

bird(){
   bX=0;
   bY=height/2;
   speed=6;
  }
}
