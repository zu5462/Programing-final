import ddf.minim.*;
Minim minim;
AudioPlayer bgm;
AudioPlayer yell;

kid[] klist;
stone[] stonelist;
spider[] slist;
witch Witch;
back moveback;
bird blist;
magic mlist;
building build;

PImage start;
PImage lose;
PImage stop;
PImage silver;
PImage bronze;
PImage golden;

int countSpiderFrame;    
int SpiderNum;           
int KidNum;
int stonenum=0;
int score=0;
int kidscore=0;
int magicscore=0;
int showscore=0;
int plusSpeed=1;
int bgmPos;

String killer;

final int game_START=0;
final int game_RUN=1;
final int game_DEAD=2;
final int game_LOSE=3;
final int game_PAUSE=4;
int gameState;

void setup(){
  size(640,480);
  textFont(createFont("data/diediedie.regular.ttf", 20));
  
  moveback=new back();
  build=new building();
  mlist=new magic();
  blist=new bird();
  klist=new kid[30];
  stonelist=new stone[30];
  slist= new spider[30];
  Witch=new witch();
  
  Witch.wload();
  moveback.backload();
  loadBack();
  
  gameState=game_START;
  KidNum=2;
  countSpiderFrame=30;
  
  minim = new Minim(this);
  yell= minim.loadFile("data/yell.mp3");
  bgm = minim.loadFile("data/bgm.mp3");
  bgm.play();
  
}

void draw(){
  switch(gameState){
    case game_START:
      imageMode(CENTER);
      image(start,320,240);
      replay();
      yell.rewind();
      break;
      
    case game_RUN:
      background(255);
      replay();
      
      moveback.move();
      Witch.display();
      
      KidDead();
      WitchDead();
      BirdHit();
      build.crush();
      MagicHit();
      
      drawkid(1800);
      drawbird();
      drawMagic();
      drawStone();
      drawSpider();
      drawScore();
      
      countSpiderFrame+=1;
      score++;
      break;
      
    case game_PAUSE:
    image(stop,320,240);
    replay();
      break;
      
    case game_DEAD:
      bgm.pause();
      Witch.Dead();
      bgm.rewind();
      break;
      
    case game_LOSE:
      bgm.play();
      replay();
      if(showscore<5000){
      image(lose,320,240);
      }else if(showscore>=5000 && showscore<15000){
      image(bronze,320,240);
      }else if(showscore>=15000 && showscore<20000){
      image(silver,320,240);
      }else{
      image(golden,320,240);
      }
      finalScore();
      break;
  }
}

void replay(){
  bgmPos=bgm.position();
  if(bgmPos>=177000){
    bgm.rewind();
  }
}

void loadBack(){
    start=loadImage("data/start.jpg");
    lose=loadImage("data/lose.jpg");
    bronze=loadImage("data/bronze.jpg");
    stop=loadImage("data/pause.jpg");
    golden=loadImage("data/golden.jpg");
    silver=loadImage("data/silver.jpg");
}

void drawScore(){
  fill(255);
  textSize(20);
  showscore=score*2+kidscore+magicscore;
  text("Score:"+showscore, 36, 30);
}

void finalScore(){
  String a="\n";
  fill(255);
  textSize(25);
  text("SCORE:"+showscore, 20, 40);
  textSize(20);
  text("YOU KILLED "+kidscore/1000 +" KIDS !",20,80);
  text("MURDERED BY "+a+killer+"!",20,120);
}

void drawSpider() {
  for (int i=0; i<slist.length-1; i++) {
    spider spider = slist[i];
    if (spider!=null && !spider.gone) { // Check Array isn't empty and bullet still exist
      spider.move();     //Move Bullet
      spider.display();  //Draw Bullet on the Screen
      if (spider.bY<0 || spider.bX>width || spider.bX<0) {
        removeSpider(spider); //Remove Bullet from the Screen
      }
    }
  }
}

void drawkid(int frame){
    if(score%frame==0 && score>1000){
      KidNum++;
    }

    for(int i=0; i<KidNum;i++){
      if((klist[i]!=null && klist[i].gone==true) || klist[i]==null ){
        if(i%2==0){
        klist[i]=new kid(1320,450,(int)random(-6,-4),60);
        }else{
        klist[i]=new kid(-1000,450,(int)random(6,4),60); 
        }
      }
    }
    
    for(int i=0; i<klist.length;i++){
      if(klist[i]!=null){
        klist[i].kload();
        klist[i].display();
      }
     }
}

void drawStone(){
  for(int i=0;i<stonelist.length-1;i++){
  if(stonelist[i]!=null && stonelist[i].gone!=true){
   stonelist[i].display();
   stonelist[i].move();
   if(stonelist[i].y<=0){
     removeStone(stonelist[i]);
    }
   }
  }
}

void drawbird(){
   if(score>=1600){
   blist.birdload();
   blist.display();
   blist.move();
  }
}

void drawMagic(){
  if(score>=1000){
  mlist.mload();
  mlist.display();
  mlist.move();
  }
}

void shootSpider(int frame) {
      if(key == ' ' && countSpiderFrame > frame){
      slist[SpiderNum]= new spider(Witch.wX,Witch.wY+10, 7, 0);
      if (SpiderNum<slist.length-2) {
        SpiderNum+=1;
      } else {
        SpiderNum = 0;
      }
    countSpiderFrame = 0;  
   }
}

void WitchDead(){
   for(int i=0;i<stonelist.length;i++){
     if(stonelist[i]!=null && stonelist[i].gone!=true){
     float Xdist=dist(stonelist[i].x,0,Witch.wX,0);
     float Ydist=dist(0,stonelist[i].y,0,Witch.wY);
       if(Xdist<(stonelist[i].size+Witch.Xsize)/2 &&
          Ydist<(stonelist[i].size+Witch.Ysize)/2  ){
        removeStone(stonelist[i]);
        killer="THE KID";
        gameState=game_DEAD;
       }
     }
   }
}
            
            
void KidDead(){
  for(int i=0;i<slist.length;i++){
  for(int j=0;j<klist.length;j++){
  if(slist[i]!=null && slist[i].gone!=true && klist[j]!=null && klist[j].gone!=true){
     float Xdist=dist(slist[i].bX,0,klist[j].x,0);
     float Ydist=dist(0,slist[i].bY,0,klist[j].y); 
    if(Xdist<(slist[i].bSize+klist[j].Xsize)/2 &&
       Ydist<(slist[i].bSize+klist[j].Ysize)/2  ){
        kidscore+=1000;
        removeKid(klist[j]);
        removeSpider(slist[i]);
          }
        }
      }
   }
}

void BirdHit(){
   float Xdist=dist(blist.bX,0,Witch.wX,0);
   float Ydist=dist(0,blist.bY,0,Witch.wY);
     if(Xdist<(blist.size+Witch.Xsize)/2 &&
        Ydist<(blist.size+Witch.Ysize)/2  ){
        removeBird(blist);
        killer="THE OWL";
        gameState=game_DEAD;
       }
  }

void MagicHit(){
     float Xdist=dist(mlist.mX,0,Witch.wX,0);
     float Ydist=dist(0,mlist.mY,0,Witch.wY);
       if(Xdist<(mlist.size+Witch.Xsize)/2 &&
          Ydist<(mlist.size+Witch.Ysize)/2  ){
        magicscore+=500;
        removeMagic(mlist);
       }
   }

void  removeSpider(spider obj) {
  obj.gone = true;
  obj.bX = 2000;
  obj.bY = 2000;
}

void  removeStone(stone obj) {
  obj.gone = true;
  obj.x = 2000;
  obj.y = 2000;
}

void removeKid(kid obj){
    obj.x=3000;
    obj.y=3000;
    obj.gone=true;
}

void removeBird(bird obj){
    obj.bX=3000;
    obj.bY=3000;
}

void removeMagic(magic obj){
    obj.mX=1000;
    obj.mY=1000;
}

void keyPressed() {
  if(key == ENTER && gameState==game_START){
    gameState=game_RUN;
  }
  
  if(key == ENTER && gameState==game_LOSE){
    reset();
    gameState=game_START;
  }
  
   if((key == 'Z' || key == 'z') && gameState==game_RUN){
    gameState=game_PAUSE;
   }else if((key == 'Z' || key == 'z') && gameState==game_PAUSE){
    gameState=game_RUN;
   }
   
  shootSpider(30);
   
  if(key == CODED && gameState==game_RUN){
    if(keyCode == UP){
       if(Witch.wY>=Witch.Ysize/2){
           plusSpeed+=0.8;
           Witch.wSpeed*=plusSpeed;
           Witch.wY-=Witch.wSpeed;
       }
    }
    
    if (keyCode == DOWN) {
        if(Witch.wY<=380){
           plusSpeed+=0.8;
           Witch.wSpeed*=plusSpeed;
           Witch.wY+=Witch.wSpeed;
       }
    } 
    if(keyCode == LEFT) {
           if(Witch.wX>=Witch.Xsize/2+30){
             plusSpeed+=0.8;
             Witch.wSpeed*=plusSpeed;
             Witch.wX-=Witch.wSpeed;
           }
    } 
    
   if(keyCode == RIGHT){
        if(Witch.wX<=width-Witch.Xsize/2){
             plusSpeed+=0.8;
             Witch.wSpeed*=plusSpeed;
             Witch.wX+=Witch.wSpeed;
        }
    }
    
    plusSpeed=1;  
  }
}

void reset(){
  showscore=0;
  magicscore=0;
  kidscore=0;
  score=0;
  moveback=new back();
  moveback.backload();
  Witch=new witch();
  Witch.wload();
  mlist=new magic();
  blist=new bird();
  for(int i=0;i<stonelist.length;i++){
    stonelist[i]=null;
    slist[i]=null;
    klist[i]=null;
  }
  KidNum=2;
}
  
