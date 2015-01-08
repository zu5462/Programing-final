class Anim {
  float x, y;
  float speedX = 0;
  float speedY = 0;
  int animState;
  boolean mouseClick = false;
  LoadAnimation intro,win,lose,doll,credit;

  Anim(float x, float y, int state) {
    this.x = x;
    this.y = y;
    this.animState = state;

    win    = new LoadAnimation("data/winAnim/win_",     30);
    lose   = new LoadAnimation("data/loseAnim/dead_",   60);
    doll   = new LoadAnimation("data/loseDoll/dead_",   60);
    intro  = new LoadAnimation("data/introIcon/next_",  20);
    credit = new LoadAnimation("data/creditIcon/icon_", 20);
  }

  void display() {
    switch(animState){
      case GAME_INTRO:
        intro.display(x, y);
        break;
  
      case GAME_WIN:
        win.display(x, y);
        break;
  
      case GAME_LOSE:
        lose.display(x, y);
        break;
        
      case GAME_CREDIT:
        credit.display(x,y);
        break;
    }
  }

  void move() {
    switch(animState) {
      case GAME_INTRO:
        if (!intro_1 && mouseClick) {
          speedX = 5;
          x += speedX;
  
          if (x > width + 80) {
            gameState  = GAME_PLAYING;
            levelState = LEVEL_1;
            setCard();
            playintro  = true;
            mouseClick = false;
            startBGM.pause();
            playBGM.loop();
          }
        }
        break;
      
      case GAME_LOSE:
        if(gameState == GAME_LOSE){
          speedY = -3;
          y += speedY;
          
          if(y < -120){
            doll.display(560,240);
          }
        }
        break;
      }
  }
  
}

