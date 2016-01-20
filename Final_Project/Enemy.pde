class Enemy {
  PVector loc, vel;
  int diam;
  
  Enemy(float x, int y) {
    diam = 25;
    loc = new PVector (x,y);
    loc = new PVector (-3,0);
    vel.mult(1);
  }
  void display () {
    fill(0,200,255);
    noStroke(); 
    ellipse(loc.x,loc.y,diam,diam);
  }
  void move () {
    loc.add(vel);
  }
}