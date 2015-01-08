final int GAME_START = 1;
final int GAME_RUN   = 2;
final int GAME_PAUSE = 3;
final int GAME_LOSE  = 4;

final int DIR_UP    = 1;
final int DIR_DOWN  = 2;
final int DIR_LEFT  = 3;
final int DIR_RIGHT = 4;

Img img;
Snake snake;
Bait bait;
boolean ai=false;
int currentFrame = 0;
int currentTime  = 0;
int snakeSize = 20;
int speedLevel = 20;
int bodyLength = 5;
int gameState = 0;
int snakeDir = 0; 

//BONUS 
boolean d_up,d_down,d_left,d_right;
boolean specialBait = true;
int score,baitNums;
int specialBaitTime;


void setup(){
  img = new Img();
  size(640,480);
  gameState = GAME_START;
}

void draw(){

     switch (gameState){
       case GAME_START:                       
                       background(0);
                       textSize(30);
                       fill(255);
                       text("click to start",width/3,height/2);
                       break;
       case GAME_RUN:  
                       background(0);
                       currentFrame++;
                       gameState=snake.eatSelf();
                       snake.snakeMove(snakeDir,speedLevel);                       
                       snake.snakeShow(snakeDir,img);
                       bait.baitShow();
                       eatBait();
                       
                       //---------BONUS----------------
                       bait.setSpecialBait(snake);
                       bait.specialBaitShow();
                       eatSpecialBait();
                       directionLimit();
                       showScore();
                       break;       
       case GAME_PAUSE:
                       textSize(30);
                       fill(255);
                       text("PAUSE", width*2/5, 240);
                       break;       
       case GAME_LOSE:
                       background(0);
                       textSize(30);
                       fill(255);
                       text("You Lose",width*2/5,height/2);
                       textSize(18);
                       text("SCORE:"+ score ,width*2/5+20,height/2+20);
                       break;       
     }
}


void mousePressed(){
  if(gameState==GAME_START || gameState==GAME_LOSE){
     snakeDir = DIR_RIGHT;
     speedLevel=20;
     bodyLength=5;
     snake = new Snake(300,20);
     snake.initSnake();
     bait  = new Bait();
     bait.setBait(snake);
     
     score = 0;
     baitNums = 0;
     specialBait = true;
     
     gameState=GAME_RUN;
     currentTime=millis();
  }
}
void keyPressed(){
  if (key == CODED && gameState == GAME_RUN) {
    speedUp(); 
    
    switch(keyCode){
      case UP:
        if(d_up){
          snakeDir = DIR_UP;
        }
        break;
      case DOWN:
        if(d_down){
          snakeDir = DIR_DOWN;
        }
        break;
      case LEFT:
        if(d_left){
          snakeDir = DIR_LEFT;
        }
        break;
      case RIGHT:
        if(d_right){
          snakeDir = DIR_RIGHT;
        }
        break;  
    }
  }
  if(key == ENTER){
    switch(gameState){
      case GAME_RUN:
           gameState=GAME_PAUSE;           
           break;
      case GAME_PAUSE:
           gameState=GAME_RUN;
           break;
      default:
           break;
    }
  }
}

void eatBait(){
  if(snake.x + snakeSize > bait.x && snake.x < bait.x + 10 &&
     snake.y + snakeSize > bait.y && snake.y < bait.y + 10  ){
    bodyLength++;
    snake.appendBody();
    bait.setBait(snake);
    score+=10;
    baitNums++;
  }
}


//-------------------BONUS---------------------------- 

//----------------------------------------------------
//unable to change direction to opposite direction
//EX;
//if snakeDir == DIR_UP
//unable to change snakeDir to DIR_DOWN
void directionLimit(){
  switch(snakeDir){
        case DIR_UP:
          d_up    = true;
          d_down  = false;
          d_left  = true;
          d_right = true;
          break;
        case DIR_DOWN:
          d_up    = false;
          d_down  = true;
          d_left  = true;
          d_right = true;
          break;
        case DIR_LEFT:
          d_up    = true;
          d_down  = true;
          d_left  = true;
          d_right = false;
          break;
        case DIR_RIGHT:
          d_up    = true;
          d_down  = true;
          d_left  = false;
          d_right = true;
          break;  
      }
}
//------------------------------------------

// snake speed up
//------------------------------------------
void speedUp(){
    speedLevel--;
    if(speedLevel < 5){
      speedLevel = 5;
    }
}

void keyReleased(){
  speedLevel = 20;
}
//------------------------------------------

// show score and special bait
// set and show special bait are in class bait 
//------------------------------------------
void showScore(){
  int restTime = int(10-(millis()-specialBaitTime)/1000);
  stroke(255);
  line(0,20,width,20);
  textSize(18);
  fill(255);
  text("SCORE:"+ score ,10,18);
  if(!specialBait && restTime > 0){
    text("BAIT COUNTDOWN: "+nf(restTime, 2),150,18);
  }
}

void eatSpecialBait(){
  if(snake.x + snakeSize > bait.sx - 5 && snake.x < bait.sx + 5 &&
     snake.y + snakeSize > bait.sy - 5 && snake.y < bait.sy + 5 ){
    bodyLength++;
    snake.appendBody();
    bait.sx = -20;
    bait.sy = -20;
    specialBait = true;
    score+=50;
    baitNums++;
  }
}
//------------------------------------------

