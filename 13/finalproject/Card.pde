class Card{
  int cardID;
  int cardState;
  String imgPath,imgMPath;
  PImage img,imgM,back;
  
  Card(int state,int id){
    this.cardID = id;
    this.cardState = state;
    this.imgPath  = "data/card/"+cardID+".png";
    this.imgMPath = "data/card/"+cardID+"M.png";
    this.img  = loadImage(imgPath);
    this.imgM = loadImage(imgMPath);
    back = loadImage("data/card/back.jpg"); 
  }
  
  void display(float x, float y){
    if(cardState == CARD_HIDE){
      image(back     , x, y, slotSize-2, slotSize-2);
    }else if(cardState == CARD_MATCH){
      image(this.imgM, x, y, slotSize-2, slotSize-2);
    }else{
      image(this.img , x, y, slotSize-2, slotSize-2);
    }
  }
 
}
