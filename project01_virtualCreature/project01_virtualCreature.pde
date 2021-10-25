PVector position, target;
boolean isRunnimars = false;
PImage worm1, worm2, worm3, worm4, worm5, amarsry1, amarsry2, pepper, mars;
void setup() { 
  size(800, 600, P2D);
  mars = loadImage("mars.jpg");
  pepper= loadImage("pepper.png");
  position = new PVector(width/2, height/2);
  target = new PVector(random(width), random(height));  
  
  ellipseMode(CENTER);
}

void draw() {
  background(mars);
  PVector mousePos = new PVector(mouseX, mouseY);
  isRunnimars = position.dist(mousePos) < 100;
  cursor(pepper);
  if (isRunnimars) {
    position = position.lerp(target, 0.08);
    if (position.dist(target) < 5) {
      target = new PVector(random(width), random(height));
    }
  }
  
  ellipse(position.x, position.y, 20, 20);
}
