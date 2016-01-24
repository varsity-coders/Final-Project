class Shooter {
  float x, y, d, x2, y2, d2;
  float speed, speed2;
  boolean shoot, shootleft;
  PImage blastblue, blast;
  PImage blastblueleft, blastleft;
  Shooter() {
    shoot = false;
    speed = 4;
    speed2 = 4;
    blast = loadImage("blast.png");
    blastleft = loadImage("blast2.png");
    blastblue = loadImage("blastblue.png");
    blastblueleft = loadImage("blastblue2.png");
  }
  void setLocationright(float initialx, float initialy) { // float direction) {
    x = initialx;
    y = initialy;
    // d = direction;
    shoot = true;
  }
  void setLocationleft(float initialx2, float initialy2) { // float direction) {
    x2 = initialx2;
    y2 = initialy2;
    // d = direction;
    shootleft = true;
  }
  void displayright() {
    if (shoot == true) {
      image(blastblue, x, y);
    }
  }
  void displayleft() {
    if (shootleft == true) {
      image(blastblueleft, x2, y2);
    }
  }
  void updateright() { //if level up shoot faster
    if (shoot == true) {
      x+=speed;
    }
     if (x >enemy.x2-35 && y > enemy.y2) {
      shoot = false;
    }
    
  }
      void updateleft() { 
    if (shootleft == true) {
      x2-=speed2;
    }
         if (x2 < enemy.x2+35 && y2 > enemy.y2) {
      shootleft = false;
    }
  }
}


/*
  PVector loc;  //bottom left point
 PVector vel; 
 float c; //set color
 float x, y;  //set location
 float bSpeed;  //bullet speed
 float fr;  //gun firerate
 float diam;
 Shooter(float newC, float newX, float newY, float bs, float nFr, float tdiam) {
 c = newC;
 diam = tdiam;
 x = newX;
 y = newY;
 bSpeed = bs;
 fr = nFr;
 loc = new PVector(x, y);
 vel = new PVector(5,0);
 }
 
 void display() {
 fill(c);
 stroke(c);
 ellipse(loc.x, loc.y, diam, diam);
 }
 
 void update() {
 loc.set(x, y);
 }
 void shoot() {
 ellipse(loc.x,loc.y,diam,diam);
 loc.add(vel);
 }}
 */