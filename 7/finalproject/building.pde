class building{
  float AX;
  float AY=379;
  float AH=200;
  float AW=120;
  float BX;
  float BY=74;
  float BH=150;
  float BW=120;
  float CX;
  float CY=404;
  float CH=150;
  float CW=120;
  float DX;
  float DY=99;
  float DH=200;
  float DW=120;
  float EX;
  float EY=403;
  float EH=148;
  float EW=120;
  float FX;
  float FY=95;
  float FH=192;
  float FW=120;
  float GX;
  float GY=95;
  float GH=192;
  float GW=120;
  float HX;
  float HY=437;
  float HH=112;
  float HW=127;
  float IX;
  float IY=75;
  float IH=150;
  float IW=120;
  float JX;
  float JY=404;
  float JH=150;
  float JW=120;
  float KX;
  float KY=329;
  float KH=300;
  float KW=120;
  float LX;
  float LY=379;
  float LH=200;
  float LW=120;
  float MX;
  float MY=287;
  float MH=384;
  float MW=120;
  float NX;
  float NY=287;
  float NH=384;
  float NW=120;
  float OX;
  float OY=328;
  float OH=300;
  float OW=120;
  float PX;
  float PY=404;
  float PH=150;
  float PW=120;
  float QX;
  float QY=328;
  float QH=300;
  float QW=120;
  float RX;
  float RY=354;
  float RH=250;
  float RW=120;
  float SX;
  float SY=404;
  float SH=150;
  float SW=120;
  float TX;
  float TY=354;
  float TH=250;
  float TW=120;
  float UX;;
  float UY=329;
  float UH=300;
  float UW=118;
  float VX;
  float VY=381;
  float VH=200;
  float VW=118; 
  float WX;
  float WY=287;
  float WH=384;
  float WW=120;
  float XX;
  float XY=334;
  float XH=288;
  float XW=120;
  float YX;
  float YY=383;
  float YH=192;
  float YW=120;
  float ZX;
  float ZY=334;
  float ZH=288;
  float ZW=120;
  float ZAX;
  float ZAY=287;
  float ZAH=384;
  float ZAW=120;
  float ZBX;
  float ZBY=430;
  float ZBH=85;
  float ZBW=97;
  float ZCX;
  float ZCY=37;
  float ZCH=75;
  float ZCW=128;
  float ZDX;
  float ZDY=354;
  float ZDH=250;
  float ZDW=128;
  float ZEX;
  float ZEY=416;
  float ZEH=125;
  float ZEW=203;

void trans(){
   AX=-300+moveback.nextX;
   BX=-600+moveback.nextX;
   CX=-900+moveback.nextX;
   DX=-1200+moveback.nextX;
   EX=-1397+moveback.nextX;
   FX=-1600+moveback.nextX;
   GX=-1600+moveback.nextX;
   HX=-1852+moveback.nextX;
   IX=-2000+moveback.nextX;
   JX=-2200+moveback.nextX;
   KX=-2500+moveback.nextX;
   LX=-2800+moveback.nextX;
   MX=-3100+moveback.nextX;
   NX=-3100+moveback.nextX;
   OX=-3400+moveback.nextX;
   PX=-3525+moveback.nextX;
   QX=-3650+moveback.nextX;
   RX=-4000+moveback.nextX;
   SX=-4200+moveback.nextX;
   TX=-4400+moveback.nextX;
   UX=-4700+moveback.nextX;
   VX=-4850+moveback.nextX;
   WX=-5200+moveback.nextX;
   XX=-5350+moveback.nextX;
   YX=-5500+moveback.nextX;
   ZX=-5650+moveback.nextX;
   ZAX=-5800+moveback.nextX;
   ZBX=-5787+moveback.nextX;
   ZCX=-6100+moveback.nextX;
   ZDX=-6100+moveback.nextX;
   ZEX=-6268+moveback.nextX;
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
