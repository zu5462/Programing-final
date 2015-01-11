import ddf.minim.*;

Minim minim;
AudioPlayer startBGM,playBGM;
AudioPlayer winS,loseS;
AudioPlayer introClickS,playClickS,countHintS,startHintS;
AudioPlayer matchS,wrongS,specialGoodS,specialBadS,levelUpS;

Card[][] playCard;
Card[] matchCard;
Snow[] snows;
Anim introAnim,winAnim,loseAnim,creditAnim;

PImage playBG,startBG,storyBG,ruleBG,winBG,loseBG,creditBG;
PImage playButton,ruleA,ruleB,ruleC;

final int GAME_START   = 0;
final int GAME_INTRO   = 1;
final int GAME_PLAYING = 2;
final int GAME_WIN     = 3;
final int GAME_LOSE    = 4;
final int GAME_CREDIT  = 5;

final int LEVEL_1 = 0;
final int LEVEL_2 = 1;
final int LEVEL_3 = 2;

final int CARD_HIDE  = 0;
final int CARD_SHOW  = 1;
final int CARD_MATCH = 2;

int gameState,levelState;
int slotW,slotH,slotSize,totalSlot;
int ix,iy,tranX,tranY;
int score;
int matchNums;
int countDown;
int currentTime,startTime,countClick,wrongClick,jonesClick;
boolean levelUping,intro_1,playintro,matchA;


void setup(){
  size(640,480);
  imageMode(CENTER);
  textAlign(RIGHT);
  minim = new Minim(this);
  
  slotW = 6;
  slotH = 6;
  slotSize = 67;
  totalSlot = slotW*slotH;
  ix = int((width  - slotW*slotSize)/2);
  iy = int((height - slotH*slotSize)/2);
  tranX = 60;
  tranY = 30;
  countDown = 20000;
  
  startBGM     = minim.loadFile("data/music/startBG.mp3");
  playBGM      = minim.loadFile("data/music/playBG.mp3");
  winS         = minim.loadFile("data/music/win.mp3");;
  loseS        = minim.loadFile("data/music/fail.mp3");;
  introClickS  = minim.loadFile("data/music/introClick.mp3");
  startHintS   = minim.loadFile("data/music/startHint.mp3");
  countHintS   = minim.loadFile("data/music/countHint.mp3");
  playClickS   = minim.loadFile("data/music/playClick.mp3");
  matchS       = minim.loadFile("data/music/match.mp3");
  wrongS       = minim.loadFile("data/music/wrong.mp3");
  specialGoodS = minim.loadFile("data/music/specialGood.mp3"); 
  specialBadS  = minim.loadFile("data/music/specialBad.mp3");
  levelUpS     = minim.loadFile("data/music/levelup.mp3");
  
  playBG     = loadImage("data/background.png");
  startBG    = loadImage("data/startBG.png");
  storyBG    = loadImage("data/story.png");
  ruleBG     = loadImage("data/rule.png");
  winBG      = loadImage("data/win.png");
  loseBG     = loadImage("data/lose.png");
  creditBG   = loadImage("data/credit.png");
  
  playButton = loadImage("data/playbutton.png");
  ruleA      = loadImage("data/rule_A.png");
  ruleB      = loadImage("data/rule_B.png");
  ruleC      = loadImage("data/rule_C.png");
  
  playCard   = new Card[slotW][slotH];
  matchCard  = new Card[2];
  snows      = new Snow[100];
  for (int i = 0; i < snows.length; i++){
    snows[i] = new Snow();
  }
  introAnim  = new Anim(550,380,GAME_INTRO);
  winAnim    = new Anim(160,260,GAME_WIN);
  loseAnim   = new Anim(width/2,480,GAME_LOSE);
  creditAnim = new Anim(60,350,GAME_CREDIT);
  
  reset();
  
  gameState  = GAME_START;
  levelState = LEVEL_1;
}

void draw(){
  switch(gameState){
    case GAME_START:
      image(startBG,width/2,height/2);
      drawSnow();
      break;
      
    case GAME_INTRO:
      if(intro_1){
        image(storyBG,width/2,height/2);
      }else{
        image(ruleBG,width/2,height/2);
      }
      introAnim.display();
      introAnim.move();
      break;
    
    case GAME_PLAYING:
      playingSetting();
      break;
    
    case GAME_WIN:
      image(winBG,width/2,height/2);
      winAnim.display();
      break;
    
    case GAME_LOSE:
      image(loseBG,width/2,height/2);
      loseAnim.display();
      loseAnim.move();
      break;
      
    case GAME_CREDIT:
      image(creditBG,width/2,height/2);
      creditAnim.display();
      break;
  }    
}

void mouseClicked(){
  startClick();
  introClick();
  playintroClick();
  playClick();
  otherClick();
}

void drawSnow(){
  for (int i=0; i<snows.length; i++){
    snows[i].display();
  }
}

void playingSetting(){
  if(playintro){
    switch(levelState){
      case LEVEL_1:
        image(ruleA,width/2,height/2);
        image(playButton,550,400);
        break;
        
      case LEVEL_2:
        image(ruleB,width/2,height/2);
        image(playButton,550,400);
        break;
        
      case LEVEL_3:
        image(ruleC,width/2,height/2);
        image(playButton,550,400);
        break;
    }
  }else{
    image(playBG,width/2,height/2);
    drawSlot();
    showCard();
    showTime();
    checkMatch();
    showScore();
    levelUp();
    checkLose();
  }
}

void drawSlot(){
  strokeWeight(2);
  stroke(91,55,21);
  for(int i = 0;i < slotW+1;i++){
    line(i*slotSize+ix+tranX,iy+tranY,i*slotSize+ix+tranX-1,height-iy+tranY);
  }
  for(int i = 0;i < slotH+1;i++){
    line(ix+tranX,iy+i*slotSize+tranY ,width-ix+tranX,iy+i*slotSize+tranY-1);
  }
}

void showCard(){
  for(int i = 0;i < slotW;i++){
    for(int j = 0;j < slotH;j++){
      int x = int(ix+i*slotSize+slotSize/2 + tranX);
      int y = int(iy+j*slotSize+slotSize/2 + tranY);
      if(playCard[i][j].cardState == CARD_SHOW){
        if(millis()-startTime >= countDown &&
           millis()-startTime <= countDown+500){
           playCard[i][j].cardState = CARD_HIDE;
        } 
      }
      playCard[i][j].display(x,y);
    }
  }
}

void showTime(){
  if(millis()-startTime < countDown){
    int restTime = int(countDown/1000-(millis()-startTime)/1000+1);
    fill(0,115,109);
    textSize(25);
    text("COUNTDOWN",172,270);
    textSize(120);
    text(nf(restTime, 2),165,390);
    textSize(15);
    text("second(s)",175,420);
  }
  for(int i = 1;i < int(countDown/1000);i++){
    if(millis()-startTime >= countDown-i*1000 &&
       millis()-startTime <  countDown-i*1000+20){
      countHintS.rewind();
      countHintS.play();
    }
  }
  if(millis()-startTime >= countDown &&
     millis()-startTime <  countDown+20){
    startHintS.rewind();
    startHintS.play();
  }
}

void showScore(){
  if(millis()-startTime >= countDown){
    fill(255,255,255);
    textFont(loadFont("data/SourceSansPro-Regular-35.vlw"),35);
    text("SCORE",130,245);
    if(levelUping || score <= 0){
      fill(random(255),random(255) ,random(255));
    }
    textFont(loadFont("data/SourceSansPro-Regular-80.vlw"),80);
    text(score,175,340);
    fill(119,91,60);
    textFont(loadFont("data/SourceSansPro-Regular-35.vlw"),35);
    text("Wrong "+ wrongClick,160,400);
    if(levelState == LEVEL_2 || levelState == LEVEL_3){
      if(jonesClick >= 3){
        fill(random(255),random(255) ,random(255));
      }
      text("Jones  "+ jonesClick,158,450);
    }
  }
}

void setCard(){
  int [] cardIDList;
  cardIDList = new int[totalSlot];
  
  for(int i = 0;i < slotW;i++){
    for(int j = 0;j < slotH;j++){
      playCard[i][j] = null;
    }
  }
  switch(levelState){
    case LEVEL_1:
      for(int i = 0;i < totalSlot;i++){   
        cardIDList[i] = int(i/2);  
      }
      break;
      
    case LEVEL_2:
      for(int i = 0;i < totalSlot-4;i++){   
        cardIDList[i] = int(i/2);  
      }
      for(int i = totalSlot-4;i < totalSlot;i++){
        cardIDList[i] = int(i/2+3);
      }
      break;
      
    case LEVEL_3:
      for(int i = 0;i < totalSlot-6;i++){   
        cardIDList[i] = int(i/2);  
      }
      for(int i = totalSlot-6;i < totalSlot;i++){
        cardIDList[i] = int(i/2+4);
      }
      break;
  }
  for(int i = 0;i < totalSlot;i++){
    int a = int(random(totalSlot));
    int temp = cardIDList[i];
    cardIDList[i] = cardIDList[a];
    cardIDList[a] = temp;   
  }
  for(int i = 0;i < totalSlot;i++){     
    int col = int(i % slotW);
    int row = int(i / slotW);
    int x   = int(ix+col*slotSize+slotSize/2);
    int y   = int(iy+row*slotSize+slotSize/2);   
    playCard[col][row] = new Card(CARD_SHOW,cardIDList[i]);
  }
}

void checkMatch(){
  if(millis()-currentTime >= 1000){
    if(matchCard[0] != null && matchCard[1] != null){
      //MATCH
      if(matchCard[0].cardID == matchCard[1].cardID){
        //DOUBLE CARD
        if(matchCard[0].cardID >= 0 &&
           matchCard[0].cardID <= 2){
           score += 20;
           matchNums++;
        //NORMAL CARD   
        }else if(matchCard[0].cardID >= 3 &&
           matchCard[0].cardID <= 18){
           score += 10;
           matchNums++;
        } 
        for(int i = 0;i < 2 ;i++){
          matchCard[i].cardState = CARD_MATCH;
          matchCard[i] = null;
        }
        countClick = 0;
        wrongClick = 0;
        matchS.rewind();
        matchS.play();
      //WRONG MATCH
      }else{
        //second click special card
        if(matchCard[1].cardID >= 19 && 
           matchCard[1].cardID <= 21){
           specialCard(1);
        //normal wrong match   
         }else{
           for(int i = 0;i < 2 ;i++){
             matchCard[i].cardState = CARD_HIDE;
             matchCard[i] = null;
           }
           countClick = 0;
           wrongClick ++;
           if(wrongClick < 3){
             wrongS.rewind();
             wrongS.play();
           }else{
             score -= 5;
             wrongClick = 0; 
             specialBadS.rewind();
             specialBadS.play();
           }
         }
      }
    //first click special card
    }else if(matchCard[0] != null && matchCard[1] == null){
       specialCard(0);
    }
  }
}

void specialCard(int clickNO){
  switch(matchCard[clickNO].cardID){ 
    case 19: //LOOK AGAIN CARD
      if(matchCard[clickNO].cardState == CARD_SHOW){
        specialGoodS.rewind();
        specialGoodS.play();
        score += 10;
        matchCard[clickNO].cardState = CARD_MATCH;
      }
      if(millis()-currentTime >= 2000){
        if(!levelUping){
          for(int i = 0; i < slotW;i++){
            for(int j = 0; j < slotH;j++){
              if(playCard[i][j].cardState == CARD_HIDE){
                playCard[i][j].cardState = CARD_SHOW;
              }
            }
          }
          startTime = millis()-10000;
          for(int i = 0; i <clickNO+1;i++){
            matchCard[i] = null;
          }
        }  
      }
      matchA = true;
      countClick = 0;
      wrongClick = 0;
      break;
     
    case 20: //JONES CARD
      startTime = millis();
      setCard();
      score = int(score/2);
      for(int i = 0; i <clickNO+1;i++){
        matchCard[i] = null;
      }
      if(jonesClick < 3){
        specialBadS.rewind();
        specialBadS.play();
      }
      matchA = true;
      countClick = 0;
      wrongClick = 0;
      matchNums  = 0;
      break;
      
    case 21: //MOUSE CARD
      score = int(score/10);
      if(score > 0){
        specialBadS.rewind();
        specialBadS.play();
      }
      matchCard[0].cardState = CARD_HIDE;
      matchCard[clickNO].cardState = CARD_MATCH;
      for(int i = 0; i <clickNO+1;i++){
        matchCard[i] = null;
      }
      matchA = true;
      countClick = 0;
      wrongClick = 0;
      break;
  }
}

void levelUp(){
  if(gameState == GAME_PLAYING){
    switch(levelState){
      case LEVEL_1:
        if(score >= 100|| matchNums >= 18){
          levelUping = true;   
          if(millis()-currentTime >= 2000 &&
             millis()-currentTime <= 2020){
             playBGM.pause();
             levelUpS.rewind();
             levelUpS.play();
             for(int i = 0;i < slotW;i++){
               for(int j= 0;j < slotH;j++){
                 if(playCard[i][j].cardState == CARD_HIDE){
                   playCard[i][j].cardState = CARD_SHOW;
                 }
               }
             }
          }
          if(millis()-currentTime >= 5000){
             playBGM.rewind();
             playBGM.loop();
             levelState = LEVEL_2;
             setCard();
             reset();
          }
        }
        break;
        
      case LEVEL_2:
        if(score >= 150|| matchNums >= 16){
          levelUping = true;
          if(millis()-currentTime >= 2000 &&
             millis()-currentTime <= 2020){
             playBGM.pause();
             levelUpS.rewind();
             levelUpS.play();
             for(int i = 0;i < slotW;i++){
               for(int j= 0;j < slotH;j++){
                 if(playCard[i][j].cardState == CARD_HIDE){
                   playCard[i][j].cardState = CARD_SHOW;
                 }
               }
             }
          }
          if(millis()-currentTime >= 5000){
             playBGM.rewind();
             playBGM.loop();
             levelState = LEVEL_3;
             setCard();
             reset();
          }
        }
        break;
        
      case LEVEL_3:
        if(score >= 200 || matchNums >= 15){
          levelUping = true;
          if(millis()-currentTime >= 2000 &&
             millis()-currentTime <= 2020){
             playBGM.pause();
             levelUpS.rewind();
             levelUpS.play();
             for(int i = 0;i < slotW;i++){
               for(int j= 0;j < slotH;j++){
                 if(playCard[i][j].cardState == CARD_HIDE){
                   playCard[i][j].cardState = CARD_SHOW;
                 }
               }
             }
           }
          if(millis()-currentTime >= 5000){
            gameState = GAME_WIN;
            winS.rewind();
            winS.play();
          }
        }
        break; 
    }
  }
}

void checkLose(){
  if(score <= 0 &&
     millis()-currentTime >= 3000){
     gameState = GAME_LOSE;
     playBGM.pause();
     loseS.rewind();
     loseS.play();
  }
  else if(jonesClick >= 3 &&
          millis()-currentTime >= 2000){
     gameState = GAME_LOSE;
     playBGM.pause();
     loseS.rewind();
     loseS.play();
  }
}
 
void reset(){  
  for(int i = 0; i < 2;i++){
    matchCard[i] = null;
  }
  introAnim.x = 550;
  loseAnim.x  = width/2;
  score = 50;
  matchNums   = 0;
  currentTime = 0;
  startTime   = 0;
  countClick  = 0;
  wrongClick  = 0;
  jonesClick  = 0;
  levelUping = false;
  intro_1    = false;
  playintro  = true;
  matchA     = true;

  if(gameState == GAME_START){
    startBGM.rewind();
    startBGM.loop();
  }
}

void startClick(){
  if(mouseButton == LEFT &&
     gameState == GAME_START){
     if(mouseX > 310 && mouseX < 438 &&
        mouseY > 357 && mouseY < 407){
        intro_1 = true;
        gameState = GAME_INTRO;
        introClickS.rewind();
        introClickS.play();
     }
     if(mouseX > 310 && mouseX < 438 &&
        mouseY > 420 && mouseY < 470){
        gameState = GAME_CREDIT;
        introClickS.rewind();
        introClickS.play();
     }
  }
}

void introClick(){
  if(mouseButton == LEFT &&
     gameState == GAME_INTRO &&
     mouseX >= 500 && mouseX <= 600 && 
     mouseY >= 280 && mouseY <= 480){
    if(intro_1){
      intro_1 = false;
    }else{
      introAnim.mouseClick = true;
    }
    introClickS.rewind();
    introClickS.play();
  }
}

void playintroClick(){
  if(mouseButton == LEFT &&
     gameState == GAME_PLAYING &&
     playintro &&
     mouseX >= 500 && mouseX <= 600 && 
     mouseY >= 330 && mouseY <= 480){
     startTime = millis();
     playintro = false;
     introClickS.rewind();
     introClickS.play();
  }
}

void playClick(){
  if(mouseButton == LEFT &&
     gameState == GAME_PLAYING &&
     !playintro &&
     !levelUping &&
     mouseX >= ix + tranX && mouseX <= ix+slotW*slotSize + tranX && 
     mouseY >= iy + tranY && mouseY <= iy+slotH*slotSize + tranY){
     int col = int((mouseX - ix - tranX)/slotSize);
     int row = int((mouseY - iy - tranY)/slotSize);
      
     if(playCard[col][row].cardState == CARD_HIDE &&
        countClick < 2 ){
        playCard[col][row].cardState = CARD_SHOW;
        currentTime = millis();
         
        if(matchA){
          matchCard[0] = playCard[col][row];
          matchA = !matchA;
          if(matchCard[0].cardID >= 19 &&
             matchCard[0].cardID <= 21){
             countClick += 2;
          }else{
             countClick ++;
          }
          if(matchCard[0].cardID == 20){
            jonesClick++;
          }
          playClickS.rewind();
          playClickS.play();  
        }
        else{
          matchCard[1] = playCard[col][row];
          matchA = !matchA;
          countClick ++;
          if(matchCard[1].cardID == 20){
            jonesClick++;
          }
          playClickS.rewind();
          playClickS.play();
        }    
     }
  }
}

void otherClick(){
  if(mouseButton == LEFT){
    if(gameState == GAME_WIN ||
       gameState == GAME_LOSE  ){
       if(mouseX >= 430 && mouseX <= 625 && 
          mouseY >= 395 && mouseY <= 460){
          gameState  = GAME_START;
          levelState = LEVEL_1;
          reset();
          introClickS.rewind();
          introClickS.play();
       }
    }else if(gameState == GAME_CREDIT){
       if(mouseX >= 0   && mouseX <= 100 && 
          mouseY >= 380 && mouseY <= 450){
          gameState  = GAME_START;
          introClickS.rewind();
          introClickS.play();
       }
    }
  }
}

