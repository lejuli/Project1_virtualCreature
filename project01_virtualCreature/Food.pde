class Food {
  
  PVector position;
  float sizeVal;
  boolean alive = true;
  PImage loli;
  
  Food(float x, float y) {
    position = new PVector(x, y);
    sizeVal = random(80, 75);
    loli = loadImage("loli.png");
  }
  
  void update() {
    // TODO
  }
  
  void draw() {
    if (alive) {
     image(loli, position.x, position.y, sizeVal, sizeVal);
    }
  }
  
  void run() {
    update();
    draw();
  }
  
}
