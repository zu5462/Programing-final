class Img{
      PImage[] head;
      PImage[] body;
      PImage tail;
      Img(){
        head=new PImage[4];
        body=new PImage[4];
        for(int i=0;i<4;i++){
            head[i]=loadImage("data/head"+(i+1)+".png");
            body[i]=loadImage("data/body"+(i+1)+".png");
        }
        tail=loadImage("data/tail.png");
      }
};
