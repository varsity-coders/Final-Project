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
    
  }

  void display(float nx, float ny) {
    fill(c);
    stroke(c);
    loc.x = nx;
    loc.y = ny;
    ellipse(loc.x, loc.y, diam, diam);
  }

  void update(float nx, float ny) {
    nx = x;
    ny = y;
    loc.set(x, y);
  }
  void shoot(float vx) {
    vel = new PVector(vx,0);
    loc.add(vel);
  }
}