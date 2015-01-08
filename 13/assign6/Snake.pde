class Snake{
      int x;
      int y;
      Snake prev;
      Snake next;
      
      Snake(int posX, int posY){
        this.x=posX;
        this.y=posY;
        this.prev=null;
        this.next=null;
      }
      Snake getSnakeTail(){
            Snake tmp;
            for(tmp = this;tmp.next!= null;tmp = tmp.next){   
            }
            return tmp;
      }
      void initSnake(){
        Snake tmp = this;
        for(int i=1;i<bodyLength;i++){ 
          tmp.next = new Snake(this.x-i*snakeSize,this.y);
          tmp.next.prev=tmp;
          tmp = tmp.next;
        }
      }
      void snakeShow(int headDir,Img img){
           for(Snake tmp = this;tmp!=null;tmp=tmp.next){
              if(tmp==this){
                   image(img.head[headDir-1],tmp.x,tmp.y,snakeSize,snakeSize);
              }
              else if(tmp.next!=null){
                   float x1=tmp.prev.x;
                   float x2=tmp.x;
                   float y1=tmp.prev.y;
                   float y2=tmp.y;
                   int bodyDir=0;
                   if(x1==x2){
                     bodyDir=(y2-y1>0?0:1);
                   }
                   if(y1==y2){
                     bodyDir=(x2-x1>0?2:3);
                   }
                   image(img.body[bodyDir],tmp.x,tmp.y,snakeSize,snakeSize);
              }
              else{
                   image(img.tail,tmp.x,tmp.y,snakeSize,snakeSize);
              }
           }
      }
      void snakeMove(int dir,int frame){
        if(currentFrame >= frame){
          for(Snake tmp = this.getSnakeTail(); tmp.prev != null;tmp = tmp.prev){
              tmp.x=tmp.prev.x;
              tmp.y=tmp.prev.y;         
          }
          switch(dir){
             case DIR_UP:
                    this.y-=snakeSize;
                    if(this.y < 20){
                      this.y = height-snakeSize;
                    }
                    break;
             case DIR_DOWN:
                    this.y+=snakeSize;
                    if(this.y > height-snakeSize){
                      this.y = 20;
                    }
                    break;
             case DIR_LEFT:
                    this.x-=snakeSize;
                    if(this.x < 0){
                      this.x = width - snakeSize;
                    }
                    break;
             case DIR_RIGHT:
                    this.x+=snakeSize;
                    if(this.x > width - snakeSize){
                      this.x = 0;
                    }
                    break;
             default:
                    break;
          }
          currentFrame=0;
        }
      }
    void appendBody(){
      Snake tmp = snake.getSnakeTail();
         float x1=tmp.prev.x;
         float x2=tmp.x;
         float y1=tmp.prev.y;
         float y2=tmp.y;
         int bodyDir=0;
         if(x1==x2){
           bodyDir=(y2-y1>0?0:1);
         }
         if(y1==y2){
           bodyDir=(x2-x1>0?2:3);
         }
      switch(bodyDir){
        case 0:
          tmp.next = new Snake(tmp.x,tmp.y+snakeSize);
          break;
          
        case 1:
          tmp.next = new Snake(tmp.x,tmp.y-snakeSize);
          break;
          
        case 2:
          tmp.next = new Snake(tmp.x+snakeSize,tmp.y);
          break;
          
        case 3:
          tmp.next = new Snake(tmp.x-snakeSize,tmp.y);
          break;
      }
      tmp.next.prev=tmp;
      tmp = tmp.next;
    }  
    int eatSelf(){
      for(Snake tmp = this.next;tmp!=null;tmp=tmp.next)
        if(snake.x == tmp.x && snake.y == tmp.y){
          return GAME_LOSE;
        }
      return GAME_RUN;
        
    }
}

