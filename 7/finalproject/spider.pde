class spider{
  float bX;
  float bY;
  int bSpeedX = 0;
  int bSpeedY = 0;
  int bSize = 10;
  int thing;
  boolean gone = false;
  PImage spider1,spider2,spider3;

void load(){
  spider1=loadImage("data/pic/spider.png");
  spider2=loadImage("data/pic/pumpkin.png");
  spider3=loadImage("data/pic/battle.png");
}

void display(){
  imageMode(CENTER);
  if(thing==0){
    image(spider1,bX,bY);
  }else if(thing==1){
    image(spider2,bX,bY);
  }else{
    image(spider3,bX,bY);
  }
  }


void move(){
   bY+=bSpeedY;
   bX+=bSpeedX;
}

spider(float x,float y,int speedY, int speedX){
    thing=(int)random(0,2);
    load();
    bX = x;
    bY = y;
    bSpeedY = speedY;
    bSpeedX = speedX;
}


}
