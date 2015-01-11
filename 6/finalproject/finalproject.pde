
Img img;
Dessert dessert;
Dessert dessert1;
Dessert dessert2;
int childrenX = 20;
int childrenY = 435;
int dessertSize =100;
int dessertX  = 85;
int dessert1X = 240;
int dessert2X = 395;
int dessertY  = 100;
int dessert1Y = 100;
int dessert2Y = 100;
int childrenXsize=250;
int childrenYsize=250;
int life ;
int cakenum;
int point =0;
 import ddf.minim.*;
Minim minim;
AudioPlayer song;
AudioPlayer alarm;

  

//Game state
int game_state ;
final int GAME_INITIAL = 1;
final int GAME_RUN     = 2;
final int GAME_LOSE    = 3;
final int GAME_FAIL    = 4;

void setup(){
  size (600,640);
  life = 3 ; 
  img = new Img();
  dessert  = new Dessert(dessertX,dessertY,0,4.5,1.5);
  dessert1 = new Dessert(dessert1X,dessert1Y,2,4,2);
  dessert2 = new Dessert(dessert2X,dessert2Y,1,3,1);
  game_state = 1;
  
    minim = new Minim(this);
  song = minim.loadFile("data/music.mp3");
  alarm = minim.loadFile("data/alarmring.mp3");
}

void draw(){
  switch(game_state){
   case GAME_INITIAL:
   img.startshow();  
    song.play();
   break;
      
   case GAME_RUN:
   img.show();
   dessert.show(img);
   dessert.move();
   dessert1.show(img);
  dessert1.move(); 
  dessert2.show(img);
  dessert2.move(); 

   displaylife();
   drawScore();
   break;
   
   case GAME_LOSE :
   img.endshow();
   finalScore();
   alarm.play();
   break;
  
}
}



void displaylife(){
   int []lifeArr = new int[3];
   for (int n = 0; n < life ; n++ ) {  
   image(img.heart,400+50*n,60);
   lifeArr[n] = n;
   
   }
}

void drawScore() {
  noStroke();
  fill(104,37,138);
  textAlign(CENTER, CENTER);
  textSize(23);
  text("SCORE:"+point, 100, 70);
}
void finalScore(){
  noStroke();
  fill(255,241,0);
  textAlign(CENTER,CENTER);
  textSize(50);
  text(point,310,160);
}

  void reset(){
   displaylife();
   life=3;
   point = 0;
   drawScore(); 
   dessert.speed = 4.5;
   dessert1.speed = 4;
   dessert2.speed = 3;
   dessert.y=100;
   dessert1.y=100;
   dessert2.y=100;
game_state = GAME_INITIAL ;
  } 


void keyPressed() {
  if(key == ENTER &&  (game_state == GAME_INITIAL)){
    game_state = GAME_RUN ;
  }
  
  if(key == ENTER &&  (game_state == GAME_LOSE)){
    game_state = GAME_INITIAL ;
    reset();
  }
  
      if(key == 'z'  && (game_state == GAME_RUN)  ){  
    img.boyeat();
   if((dessert.y)>=(390) && (dessert.y) <= (640) ){
   point+=10*(int)(1+dessert.speed*0.5);
   dessert.y=100;   }
   millis() ;  }

    
  if(key == 'x' && (game_state == GAME_RUN)){
    img.ggirleat();
  if((dessert1.y)>=(390) && (dessert1.y) <= (640) ){
   point+=10*(int)(1+dessert1.speed*0.5);
   dessert1.y=100;}
  }
  if(key == 'c' && (game_state == GAME_RUN)){
    img.rgirleat();
   if((dessert2.y)>=(390) && (dessert2.y) <= (640) ){
   point+=10*(int)(1+dessert2.speed*0.5);
   dessert2.y=100;   }
  }
}

