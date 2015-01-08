class LoadAnimation {
  PImage[] images;
  int imageCount;
  int frame ;
  
  LoadAnimation(String imagePrefix, int count) {
    this.imageCount = count;
    this.images = new PImage[imageCount];

    for (int i = 0; i < imageCount; i++) {
      String filename = imagePrefix + nf(i, 3) + ".png";
      images[i] = loadImage(filename);
    }
  }

  void display(float xpos, float ypos) {
    frame = (frame+1) % imageCount;
    image(images[frame], xpos, ypos);
  }
  
}
