class Shooter {

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
  }
}