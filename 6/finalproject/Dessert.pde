  
class Dessert{
  int type;
  float x,y;
  int some_properties_you_can_implement;  
  float speed;
  float r;
 
  
  Dessert(float x, float y,int type,float speed, float r){
    this.x=x;
    this.y=y;
    this.type=type;
    this.speed=speed;
    this.r=r;
  }
  
  void move(){
    this.y=y+this.speed;
 if(this.y<=110){ // 
 
      this.type=(int) random(3);
 }
    
   if(this.y>=640-childrenYsize+120){ // 
      this.y = dessertY;
      this.speed+=this.r;
      this.type=(int) random(3);
      life--;
      
      if (life == 0){
         game_state = GAME_LOSE ;   
      }

   }
  }
  
  
 
  void show(Img img){
       
       switch(type){
         case 0:
              image(img.ccake,this.x,this.y,dessertSize,dessertSize);
              break;
         case 1:
              image(img.scake,this.x,this.y,dessertSize,dessertSize);         
              break;
         case 2:
              image(img.donet,this.x,this.y,dessertSize,dessertSize);         
              break;
         default:
              break;
       }
  }
}


