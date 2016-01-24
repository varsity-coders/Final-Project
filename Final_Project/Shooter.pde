class Shooter {
  float x,y,d;
  PVector speed;
  boolean shoot;
  PImage blast;
  Shooter() {
    shoot = false;
    speed = new PVector(4, 0);
    blast = loadImage("blast.png");
  }
  void setLocation(float startx, float starty, float direction) {
    x = startx;
    y = starty;
    d = direction;
    shoot = true;
  }
  void display() {
    fill(0,0,255);
    if (shoot == true){
    image(blast,x,y);
  }
  if (r!=0){
    scale(-1,1);
  }
  }
  void update() { //if level up shoot faster
    if (shoot == true) {
      x+=speed.x;
      if (x >enemy.x2-35 && y > enemy.y2) {
        shoot = false;
      }
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