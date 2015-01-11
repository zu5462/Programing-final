class magic{
  PImage magic;
  float mX;
  float mY;
  float size=10;
  boolean gone;
  

void load(){
  magic=loadImage("data/pic/magic.png");
 }

void display(){
    imageMode(CENTER);
    image(magic,mX,mY);
}

void move(){
   mX+=6;
   if(mX>(width+1000)){
   mX=0;
   mY=random(Witch.wY-20,Witch.wY+20);
   }
   
}

magic(){
   mX=0;
   mY=height/2;
  }
}
