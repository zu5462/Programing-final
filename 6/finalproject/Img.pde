class Img{
      PImage background;
      PImage boy;
      PImage boyopen;
      PImage boycry;
      PImage greengirl;
      PImage greengirlopen;
      PImage redgirl;
      PImage redgirlopen;
      PImage chococake;
      PImage strawcake;      
      PImage heart;
      PImage ccake;
      PImage scake;
      PImage donet;
      PImage startimage;
      PImage endimage;
      PImage house;
      
      Img(){
        this.endimage   = loadImage("data/END.png");
        this.startimage = loadImage("data/START.png");
        this.background = loadImage("data/background.png") ;
        this.boy        = loadImage("data/boy.png"); 
        this.boycry     = loadImage("data/boycry.png"); 
        this.greengirl  = loadImage("data/ggirl.png");
        this.redgirl    = loadImage("data/rgirl.png");        
        this.heart      = loadImage("data/heart.png");
        this.ccake      = loadImage("data/ccake.png");
        this.scake      = loadImage("data/scake.png");
        this.donet      = loadImage("data/donet.png");
        this.boyopen    = loadImage("data/boy mouthopen.png");
        this.greengirlopen    = loadImage("data/ggirlopen.png");
        this.redgirlopen      = loadImage("data/rgirlopen.png");
        this.house      = loadImage("data/house.png");
      }
      
      void show(){
       image(this.background,0,0);
       image(this.house,0,0);
       image(this.boy,20,435,250,250);
       image(this.greengirl,childrenX+155,childrenY,childrenXsize,childrenYsize);
       image(this.redgirl,  childrenX+310,childrenY,childrenXsize,childrenYsize);
      }
      void boycry(){
        image(this.boycry,20,435,250,250);
      }
      void boyeat(){
        image(this.boyopen,20,435,250,250);
      }
      void ggirleat(){
        image(this.greengirlopen,childrenX+155,childrenY,childrenXsize,childrenYsize);
      }
      void rgirleat(){
        image(this.redgirlopen,childrenX+310,childrenY,childrenXsize,childrenYsize);
      }
      void startshow(){
       image(this.startimage,0,0);
      }
      void endshow(){
        image(this.endimage,0,0);
      }
}

