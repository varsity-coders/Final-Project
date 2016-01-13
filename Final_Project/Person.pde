class Person {
  PVector per, vel,grav;
  Person(float x,float y) {
  per = new PVector(x,y);
  vel = PVector.random2D(); 
  grav = new PVector(0, 0.08); 
  }

  void display() {
    fill(0);
    ellipse(per.x+10, per.y-6.8, 16, 16);
    rect(per.x, per.y, 20, 20);
    rect(per.x, per.y+20, 8, 10);
    rect(per.x+12, per.y+20, 8, 10);
  }
  void move() {
    if (keyCode == UP) {
        per.add(vel);
      vel.sub(grav);
    }
  }
}