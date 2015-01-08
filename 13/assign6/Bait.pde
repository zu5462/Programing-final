class Bait{
      int x;
      int y;
      int sx;
      int sy;
      
      Bait(){
        this.x=0;
        this.y=0;
        this.sx=-20;
        this.sy=-20;
      }

      void setBait(Snake snake){
        x = int(random(width-10));
        y = int(random(20,height-10));;
        for(Snake tmp = snake ;tmp!=null;tmp=tmp.next){  
          if(tmp.x+snakeSize >= x && tmp.x <= x+10 &&
             tmp.y+snakeSize >= y && tmp.y <= y+10){
            x = int(random(width-10));
            y = int(random(20,height-10));
            tmp = snake;
          }
        }
      }
      
      void baitShow(){
        noStroke();
        fill(255);
        rect(x,y,10,10);
      }
      
      
      //-------------------BONUS----------------------
      //special bait
      //-----------------------------------------------
      void setSpecialBait(Snake snake){
        if(baitNums % 10 == 0 && score!= 0 && specialBait){
          sx = int(random(width-20));
          sy = int(random(40,height-20));
          for(Snake tmp = snake ;tmp!=null;tmp=tmp.next){  
            if(tmp.x+snakeSize >= sx - 5 && tmp.x <= sx+5 &&
               tmp.y+snakeSize >= sy - 5 && tmp.y <= sy+5){
              sx = int(random(width-20));
              sy = int(random(20,height-20));
              tmp = snake;  
            }
          }
          specialBait = false;
          specialBaitTime = millis();
        }
        if(millis() - specialBaitTime > 10000){
          sx = -20;
          sy = -20;
          if(baitNums % 10 == 3){
            specialBait = true;
          }
        }
      }
      
      void specialBaitShow(){
          noStroke();
          fill(random(255),random(255),random(255));
          ellipse(sx,sy,10,10);
      }
      //----------------------------------------------
}
