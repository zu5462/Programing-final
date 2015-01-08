class Snow {
  float maxVy = 2;
  float angle;
  float amplitude;
  float vx, vy;
  float x, y;
  float size;
  float alpha;
  
  Snow(){
    x = random(0,width);
    y = random(-100,0);
    size = random(1);
    
    vx = 0;
    vy = 1 + size*maxVy; // at least 1

    alpha = random(255);
    
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
      vy = 1 + size*maxVy;
    }   
    fill(255,alpha);
    noStroke();
    ellipse(x,y,size*10,size*10);
  }
  
}
