class kid{
  PImage kid,kidthrow,mom,momthrow;
  int speed;
  float x;
  float y;
  int Xsize=40;
  int Ysize=50;
  int stonerate;
  int throwcount;
  boolean dothrow;
  boolean gone;
  
void bload(){
  kid=loadImage("data/pic/KID1.png");
  kidthrow=loadImage("data/pic/KID2.png");
  mom=loadImage("data/pic/People1.png");
  momthrow=loadImage("data/pic/People2.png");
}

void display(){
  imageMode(CENTER);
  fill(0);
  if(dothrow==true && speed>0){
  image(kidthrow,x,y);
  }else if(speed>0){
  image(kid,x,y);
  }
  if(dothrow==true && speed<0){
  image(momthrow,x,y);
  }else if(speed<0){
  image(mom,x,y);
  }
  move();
  if(score%stonerate==0){
  throwcount=score;
  dothrow=true;
  throwStone();
  }
  if(score-throwcount>=20){
  dothrow=false;
  }
}

void move(){
  x+=speed;
  if(x>=1320){
    x=-320;
  }else if(x<-1000){
    x=1000;
  }
}

void throwStone(){
      stonenum+=1; 
      stonelist[stonenum]=new stone(x,y+10);
      stonelist[stonenum].bload();
      stonelist[stonenum].thing=(int)random(4);
    if(stonenum>stonelist.length-10){
      stonenum=0;
      }
}


kid(int x,int y,int speed,int stonerate){
  this.x=x;
  this.y=y;
  this.stonerate=stonerate;
  this.speed=speed;
  }
}
