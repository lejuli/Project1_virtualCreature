class Wormie {

  boolean debug = true;
  PVector position, target;
  PImage faceCurrent, worm1, worm2, worm3, worm4, angry1, angry2;
  float margin = 50;
  int foodChoice;
  
  boolean isBothered = false;
  int botheredMarkTime = 0;
  int botheredTimeout = 3000; // Processing measures time in milliseconds
  float botheredSpread = 5;
  
  boolean isBlinking = false;
  int blinkMarkTime = 0;
  int blinkTimeout = 40;
  int blinkDuration = 40;
  
  boolean isHunting = false;
  
  float triggerDistance1 = 100;
  float triggerDistance2 = 25;
  float movementSpeed = 0.08;
    
  // This is the constructor; it needs to have the same name as the class.
  Wormie(float x, float y) {
    position = new PVector(x, y);
    pickEscapeTarget();
    
    worm1 = loadImage("worm1.png");
    worm1.resize(worm1.width/3, worm1.height/3);
    worm2 = loadImage("worm2.png");
    worm2.resize(worm1.width, worm1.height);
    worm3 = loadImage("worm3.png");
    worm3.resize(worm1.width, worm1.height);
    worm4 = loadImage("worm4.png");
    worm4.resize(worm1.width, worm1.height);
     worm5 = loadImage("worm5.png");
    worm5.resize(worm1.width, worm1.height);
     angry1 = loadImage("angry1.png");
    angry1.resize(worm1.width, worm1.height);
    
    faceCurrent = worm1;
  }
  
  void update() {
    PVector mousePos = new PVector(mouseX, mouseY);
    isBothered = position.dist(mousePos) < triggerDistance1;
    
    if (isBothered) {
      isHunting = false;
      botheredMarkTime = millis();
      faceCurrent = angry1; // worried expression
      if (position.dist(target) < triggerDistance2) {
        pickEscapeTarget();
        
      }
    } else if (!isBothered && millis() > botheredMarkTime + botheredTimeout) {
      if (!isBlinking && millis() > blinkMarkTime + blinkTimeout) {
        isBlinking = true;
        blinkMarkTime = millis();
      } else if (isBlinking && millis() > blinkMarkTime + blinkDuration) {
        isBlinking = false;
      }
  
           
      // Wormie heads toward food if happy
      if (!isHunting) {
        pickFoodTarget();
        isHunting = true;
      }
    } else if (!isBothered && millis() > botheredMarkTime + botheredTimeout/6) {
      faceCurrent = worm2; // neutral expression
    }
  
    if (isBothered || isHunting) {
      position = position.lerp(target, movementSpeed).add(new PVector(random(-botheredSpread, botheredSpread), random(-botheredSpread, botheredSpread)));
    }
    
    if (isHunting && position.dist(target) < 5) {
      foods[foodChoice].alive = false; 
      pickFoodTarget();
    }
    
    position.y += sin(millis()) / 2;
  }
  
  void draw() {    
    /*ellipseMode(CENTER);
    rectMode(CENTER);
    imageMode(CENTER);
  */
    image(faceCurrent, position.x, position.y);
  
  /*  if (debug) {
      noFill();
      stroke(0, 255, 0);
      ellipse(position.x, position.y, triggerDistance1*2, triggerDistance1*2);
      ellipse(position.x, position.y, triggerDistance2*2, triggerDistance2*2);
      line(target.x, target.y, position.x, position.y);
      stroke(255, 0, 0);
      rect(target.x, target.y, 10, 10);*/
    //}
  }
  
  void run() {
    update();
    draw();
  }
  
  void pickEscapeTarget() {
    target = new PVector(random(margin, width-margin), random(margin, height-margin));
  }
  
  void pickFoodTarget() {
    foodChoice = int(random(foods.length));
    if (foods[foodChoice].alive) {
      target = foods[foodChoice].position;
    }
  }
  
}
