class background{
  PImage back;
  float iX;
  float iY;
  int size=6396;
  float move;
  int Fnum;
  int Snum;
  int Bnum=0;
  float nX;
  
void load(){
  back=loadImage("data/background.jpg");
}

void move(){
  pushMatrix();
  translate(iX+636, 0);
  iX+=move;
  display();
  popMatrix(); 
}

void display(){
  imageMode(CORNER);
  if(iX%(size*Fnum)==0){
  Fnum+=2;
  Bnum++;
  }
  if(iX%(size*Snum)==0){
  Snum+=2;
  Bnum++;
  }
  noStroke();
  image(back,-size*Fnum,0);
  image(back,-size*Snum,0);
  nX=iX+636;
}

background(){
  iX=0;
  Fnum=1;
  Snum=2;
  move=4;
  iY=0;
  }
}
