class building{
  float AX=-300+back.nX;
  float AY=379;
  float AH=200;
  float AW=120;
  float BX=-600+back.nX;
  float BY=74;
  float BH=150;
  float BW=120;
  float CX=-900+back.nX;
  float CY=404;
  float CH=150;
  float CW=120;
  float DX=-1200;
  float DY=99;
  float DH=200;
  float DW=120;
  float EX=-1397;
  float EY=403;
  float EH=148;
  float EW=120;
  float FX=-1600;
  float FY=95;
  float FH=192;
  float FW=120;
  float GX=-1600;
  float GY=95;
  float GH=192;
  float GW=120;
  float HX=-1852;
  float HY=437;
  float HH=112;
  float HW=127;
  float IX=-2000;
  float IY=75;
  float IH=150;
  float IW=120;
  float JX=-2200;
  float JY=404;
  float JH=150;
  float JW=120;
  float KX=-2500;
  float KY=329;
  float KH=300;
  float KW=120;
  float LX=-2800;
  float LY=379;
  float LH=200;
  float LW=120;
  float MX=-3100;
  float MY=287;
  float MH=384;
  float MW=120;
  float NX=-3100;
  float NY=287;
  float NH=384;
  float NW=120;
  float OX=-3400;
  float OY=328;
  float OH=300;
  float OW=120;
  float PX=-3525;
  float PY=404;
  float PH=150;
  float PW=120;
  float QX=-3650;
  float QY=328;
  float QH=300;
  float QW=120;
  float RX=-4000;
  float RY=354;
  float RH=250;
  float RW=120;
  float SX=-4200;
  float SY=404;
  float SH=150;
  float SW=120;
  float TX=-4400;
  float TY=354;
  float TH=250;
  float TW=120;
  float UX=-4700;
  float UY=329;
  float UH=300;
  float UW=118;
  float VX=-4850;
  float VY=381;
  float VH=200;
  float VW=118; 
  float WX=-5200;
  float WY=287;
  float WH=384;
  float WW=120;
  float XX=-5350;
  float XY=334;
  float XH=288;
  float XW=120;
  float YX=-5500;
  float YY=383;
  float YH=192;
  float YW=120;
  float ZX=-5650;
  float ZY=334;
  float ZH=288;
  float ZW=120;
  float ZAX=-5800;
  float ZAY=287;
  float ZAH=384;
  float ZAW=120;
  float ZBX=-5787;
  float ZBY=430;
  float ZBH=85;
  float ZBW=97;
  float ZCX=-6100;
  float ZCY=37;
  float ZCH=75;
  float ZCW=128;
  float ZDX=-6100;
  float ZDY=354;
  float ZDH=250;
  float ZDW=128;
  float ZEX=-6268;
  float ZEY=416;
  float ZEH=125;
  float ZEW=103;

void trans(){
   AX=-300+back.nX;
   BX=-600+back.nX;
   CX=-900+back.nX;
   DX=-1200+back.nX;
   EX=-1397+back.nX;
   FX=-1600+back.nX;
   GX=-1600+back.nX;
   HX=-1852+back.nX;
   IX=-2000+back.nX;
   JX=-2200+back.nX;
   KX=-2500+back.nX;
   LX=-2800+back.nX;
   MX=-3100+back.nX;
   NX=-3100+back.nX;
   OX=-3400+back.nX;
   PX=-3525+back.nX;
   QX=-3650+back.nX;
   RX=-4000+back.nX;
   SX=-4200+back.nX;
   TX=-4400+back.nX;
   UX=-4700+back.nX;
   VX=-4850+back.nX;
   WX=-5200+back.nX;
   XX=-5350+back.nX;
   YX=-5500+back.nX;
   ZX=-5650+back.nX;
   ZAX=-5800+back.nX;
   ZBX=-5787+back.nX;
   ZCX=-6100+back.nX;
   ZDX=-6100+back.nX;
   ZEX=-6268+back.nX;
}

void  crush(){
  trans();
   float AXdist=dist(AX,0,Witch.wX,0);
   float AYdist=dist(0,AY,0,Witch.wY);
     if(AXdist<(AW+Witch.Xsize)/2 &&
        AYdist<(AH+Witch.Ysize)/2  ){
        killer="THE WALL";
        gameState=game_DEAD;
       }
   
   float BXdist=dist(BX,0,Witch.wX,0);
   float BYdist=dist(0,BY,0,Witch.wY);
     if(BXdist<(BW+Witch.Xsize)/2 &&
        BYdist<(BH+Witch.Ysize)/2  ){
        killer="THE WALL";
        gameState=game_DEAD;
       }    
       
   float CXdist=dist(CX,0,Witch.wX,0);
   float CYdist=dist(0,CY,0,Witch.wY);
     if(CXdist<(CW+Witch.Xsize)/2 &&
        CYdist<(CH+Witch.Ysize)/2  ){
        killer="THE WALL";
        gameState=game_DEAD;
       }  
       
   float DXdist=dist(DX,0,Witch.wX,0);
   float DYdist=dist(0,DY,0,Witch.wY);
     if(DXdist<(DW+Witch.Xsize)/2 &&
        DYdist<(DH+Witch.Ysize)/2  ){
        killer="THE WALL";  
        gameState=game_DEAD;
       }  
       
   float EXdist=dist(EX,0,Witch.wX,0);
   float EYdist=dist(0,EY,0,Witch.wY);
     if(EXdist<(EW+Witch.Xsize)/2 &&
        EYdist<(EH+Witch.Ysize)/2  ){
        killer="THE WALL";
        gameState=game_DEAD;
       }  
       
   float FXdist=dist(FX,0,Witch.wX,0);
   float FYdist=dist(0,FY,0,Witch.wY);
     if(FXdist<(FW+Witch.Xsize)/2 &&
        FYdist<(FH+Witch.Ysize)/2  ){
        killer="THE WALL";
        gameState=game_DEAD;
       }  
       
   float GXdist=dist(GX,0,Witch.wX,0);
   float GYdist=dist(0,GY,0,Witch.wY);
     if(GXdist<(GW+Witch.Xsize)/2 &&
        GYdist<(GH+Witch.Ysize)/2  ){
        killer="THE WALL";
        gameState=game_DEAD;
       }  
       
   float HXdist=dist(HX,0,Witch.wX,0);
   float HYdist=dist(0,HY,0,Witch.wY);
     if(HXdist<(HW+Witch.Xsize)/2 &&
        HYdist<(HH+Witch.Ysize)/2  ){
        killer="THE WALL";
        gameState=game_DEAD;
       }  
       
   float IXdist=dist(IX,0,Witch.wX,0);
   float IYdist=dist(0,IY,0,Witch.wY);
     if(IXdist<(IW+Witch.Xsize)/2 &&
        IYdist<(IH+Witch.Ysize)/2  ){
        killer="THE WALL";
        gameState=game_DEAD;
       }  
   
   float JXdist=dist(JX,0,Witch.wX,0);
   float JYdist=dist(0,JY,0,Witch.wY);
     if(JXdist<(JW+Witch.Xsize)/2 &&
        JYdist<(JH+Witch.Ysize)/2  ){
        killer="THE WALL";
        gameState=game_DEAD;
       }  
       
   float KXdist=dist(KX,0,Witch.wX,0);
   float KYdist=dist(0,KY,0,Witch.wY);
     if(KXdist<(KW+Witch.Xsize)/2 &&
        KYdist<(KH+Witch.Ysize)/2  ){
        killer="THE WALL";
        gameState=game_DEAD;
       }  
   
   float LXdist=dist(LX,0,Witch.wX,0);
   float LYdist=dist(0,LY,0,Witch.wY);
     if(LXdist<(LW+Witch.Xsize)/2 &&
        LYdist<(LH+Witch.Ysize)/2  ){
        killer="THE WALL";
        gameState=game_DEAD;
       }  
   
   float MXdist=dist(MX,0,Witch.wX,0);
   float MYdist=dist(0,MY,0,Witch.wY);
     if(MXdist<(MW+Witch.Xsize)/2 &&
        MYdist<(MH+Witch.Ysize)/2  ){
        killer="THE WALL";
        gameState=game_DEAD;
       }  
   
   float NXdist=dist(NX,0,Witch.wX,0);
   float NYdist=dist(0,NY,0,Witch.wY);
     if(NXdist<(NW+Witch.Xsize)/2 &&
        NYdist<(NH+Witch.Ysize)/2  ){
        killer="THE WALL";
        gameState=game_DEAD;
       }  
   
   float OXdist=dist(OX,0,Witch.wX,0);
   float OYdist=dist(0,OY,0,Witch.wY);
     if(OXdist<(OW+Witch.Xsize)/2 &&
        OYdist<(OH+Witch.Ysize)/2  ){
        killer="THE WALL";
        gameState=game_DEAD;
       }  
   
   float PXdist=dist(PX,0,Witch.wX,0);
   float PYdist=dist(0,PY,0,Witch.wY);
     if(PXdist<(PW+Witch.Xsize)/2 &&
        PYdist<(PH+Witch.Ysize)/2  ){
        killer="THE WALL";
        gameState=game_DEAD;
       }  
   
   float QXdist=dist(QX,0,Witch.wX,0);
   float QYdist=dist(0,QY,0,Witch.wY);
     if(QXdist<(QW+Witch.Xsize)/2 &&
        QYdist<(QH+Witch.Ysize)/2  ){
        killer="THE WALL";
        gameState=game_DEAD;
       }  
   
   float RXdist=dist(RX,0,Witch.wX,0);
   float RYdist=dist(0,RY,0,Witch.wY);
     if(RXdist<(RW+Witch.Xsize)/2 &&
        RYdist<(RH+Witch.Ysize)/2  ){
        killer="THE WALL";
        gameState=game_DEAD;
       }  
   
   float SXdist=dist(SX,0,Witch.wX,0);
   float SYdist=dist(0,SY,0,Witch.wY);
     if(SXdist<(SW+Witch.Xsize)/2 &&
        SYdist<(SH+Witch.Ysize)/2  ){
        killer="THE WALL";
        gameState=game_DEAD;
       }  
   
   float TXdist=dist(TX,0,Witch.wX,0);
   float TYdist=dist(0,TY,0,Witch.wY);
     if(TXdist<(TW+Witch.Xsize)/2 &&
        TYdist<(TH+Witch.Ysize)/2  ){
        killer="THE WALL";
        gameState=game_DEAD;
       }  
   
   float UXdist=dist(UX,0,Witch.wX,0);
   float UYdist=dist(0,UY,0,Witch.wY);
     if(UXdist<(UW+Witch.Xsize)/2 &&
        UYdist<(UH+Witch.Ysize)/2  ){
        killer="THE WALL";
        gameState=game_DEAD;
       }  
   
   float VXdist=dist(VX,0,Witch.wX,0);
   float VYdist=dist(0,VY,0,Witch.wY);
     if(VXdist<(VW+Witch.Xsize)/2 &&
        VYdist<(VH+Witch.Ysize)/2  ){
        killer="THE WALL";
        gameState=game_DEAD;
       }  
   
   float WXdist=dist(WX,0,Witch.wX,0);
   float WYdist=dist(0,WY,0,Witch.wY);
     if(WXdist<(WW+Witch.Xsize)/2 &&
        WYdist<(WH+Witch.Ysize)/2  ){
        killer="THE WALL";
        gameState=game_DEAD;
       }  
   
   float XXdist=dist(XX,0,Witch.wX,0);
   float XYdist=dist(0,XY,0,Witch.wY);
     if(XXdist<(XW+Witch.Xsize)/2 &&
        XYdist<(XH+Witch.Ysize)/2  ){
        killer="THE WALL";
        gameState=game_DEAD;
       }  
    
   float YXdist=dist(YX,0,Witch.wX,0);
   float YYdist=dist(0,YY,0,Witch.wY);
     if(YXdist<(YW+Witch.Xsize)/2 &&
        YYdist<(YH+Witch.Ysize)/2  ){
        killer="THE WALL";
        gameState=game_DEAD;
       }  
    
   float ZXdist=dist(ZX,0,Witch.wX,0);
   float ZYdist=dist(0,ZY,0,Witch.wY);
     if(ZXdist<(ZW+Witch.Xsize)/2 &&
        ZYdist<(ZH+Witch.Ysize)/2  ){
        killer="THE WALL";
        gameState=game_DEAD;
       }  
    
   float ZAXdist=dist(ZAX,0,Witch.wX,0);
   float ZAYdist=dist(0,ZAY,0,Witch.wY);
     if(ZAXdist<(ZAW+Witch.Xsize)/2 &&
        ZAYdist<(ZAH+Witch.Ysize)/2  ){
        killer="THE WALL";
        gameState=game_DEAD;
       }  
       
   float ZBXdist=dist(ZBX,0,Witch.wX,0);
   float ZBYdist=dist(0,ZBY,0,Witch.wY);
     if(ZBXdist<(ZBW+Witch.Xsize)/2 &&
        ZBYdist<(ZBH+Witch.Ysize)/2  ){
        killer="THE WALL";
        gameState=game_DEAD;
       }  
       
   float ZCXdist=dist(ZCX,0,Witch.wX,0);
   float ZCYdist=dist(0,ZCY,0,Witch.wY);
     if(ZCXdist<(ZCW+Witch.Xsize)/2 &&
        ZCYdist<(ZCH+Witch.Ysize)/2  ){
        killer="THE WALL";
        gameState=game_DEAD;
       }  
       
   float ZDXdist=dist(ZDX,0,Witch.wX,0);
   float ZDYdist=dist(0,ZDY,0,Witch.wY);
     if(ZDXdist<(ZDW+Witch.Xsize)/2 &&
        ZDYdist<(ZDH+Witch.Ysize)/2  ){
        killer="THE WALL";
        gameState=game_DEAD;
       }  
       
   float ZEXdist=dist(ZEX,0,Witch.wX,0);
   float ZEYdist=dist(0,ZEY,0,Witch.wY);
     if(ZEXdist<(ZEW+Witch.Xsize)/2 &&
        ZEYdist<(ZEH+Witch.Ysize)/2  ){
        killer="THE WALL";
        gameState=game_DEAD;
       }     
    
   }

building(){
}

}
