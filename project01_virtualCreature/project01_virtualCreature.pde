PVector position, target;
boolean isRunnimars = false;
PImage worm1, worm2, worm3, worm4, worm5, pepper, mars;
int numFoods = 10;
int numWormies = 1;
Wormie[] wormies = new Wormie[numWormies];
Food[] foods = new Food[numFoods];
void setup() { 
  size(800, 600, P2D);
  mars = loadImage("mars.jpg");
  pepper= loadImage("pepper.png");
  position = new PVector(width/2, height/2);
  target = new PVector(random(width), random(height));  
  
  ellipseMode(CENTER);
  for (int i=0; i<wormies.length; i++) {
    wormies[i] = new Wormie(random(width), random(height));
  }
    for (int i=0; i<foods.length; i++) {
    foods[i] = new Food(random(width), random(height));
    }
}

void draw() {
  background(mars);
  cursor(pepper);
   for (int i=0; i<foods.length; i++) {
    foods[i].run();
  }
 for (int i=0; i<wormies.length; i++) {
    wormies[i].run();
  }
  }
  
