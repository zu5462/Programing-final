class back{
  PImage mback;
  float iX;
  float iY;
  int size=6396;
  float runmove;
  int Fnum;
  int Snum;
  int Bnum=0;
  float nextX;
  
void load(){
  mback=loadImage("data/background.jpg");
}

void move(){
  pushMatrix();
  translate(iX+636, 0);
  iX+=runmove;
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
  image(mback,-size*Fnum,0);
  image(mback,-size*Snum,0);
  nextX=iX+636-Bnum*size;
}

back(){
  iX=0;
  Fnum=1;
  Snum=2;
  runmove=4;
  iY=0;
  }
}
