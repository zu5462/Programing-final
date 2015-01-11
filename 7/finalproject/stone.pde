class stone{
  float x;
  float y;
  int size=20;
  int speed;
  int thing;
  boolean gone=false;
  PImage kids1,kids2,kids3;

void load(){
  kids1=loadImage("data/pic/kids1.png");
  kids2=loadImage("data/pic/kids2.png");
  kids3=loadImage("data/pic/kids3.png");
}

void display(){
  if(thing==0){
  imageMode(CENTER);
  image(kids1,x,y);
  }else if(thing==1){
  imageMode(CENTER);
  image(kids2,x,y);
  }else{
  imageMode(CENTER);
  image(kids3,x,y);
  }
}

void move(){
  if(gone!=true){
   y-=speed;
  }
}
    
stone(float x,float y){
  this.x=x;
  this.y=y;
  speed=3;
}
}
