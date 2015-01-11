class Snow {
  float maxVy = 2;
  float angle;
  float amplitude;
  float vx, vy;
  float x, y;
  float snowSize;
  float snowAlpha;
  
  Snow(){
    x = random(0,width);
    y = random(-100,0);
    snowSize = random(1);
    
    vx = 0;
    vy = 1 + snowSize*maxVy; // at least 1

    snowAlpha = random(255);
    
    angle = random(2*PI);
    amplitude = random(2);
  }
  
  void display(){
    angle += 0.15;
    vx = sin(angle) * amplitude;
    x += vx;
    y += vy;
    if (x > width){
      x = 0;
    }
    if (x < 0){
      x = width;
    }
    if (y > height){
      y  = 0;
      vy = 1 + snowSize*maxVy;
    }   
    fill(255,snowAlpha);
    noStroke();
    ellipse(x,y,snowSize*10,snowSize*10);
  }
  
}
