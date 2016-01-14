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

/*PVector per, vel, grav, wall;

void setup() {
  wall = new PVector(0, 0);
  wall.set(0, 700);
  size(1000, 800);
  per = new PVector(0, 0);
  per.set(width/2, height/2);
  vel = new PVector(0, -3);
  grav = new PVector(0, 0.08);
}

void draw() {
  background(255);
  fill(0);
  ellipse(per.x+10, per.y-6.8, 16, 16);
  rect(per.x, per.y, 20, 20);
  rect(per.x, per.y+20, 8, 10);
  rect(per.x+12, per.y+20, 8, 10);
  rect(wall.x, wall.y, 1000, 50);
  if (per.y+30>= wall.y) {
    per.y=wall.y-30;
  }
      if (keyCode == UP) {
    per.add(vel);
    vel.add(grav);
  }
}

void keyPressed(){
        if (keyCode == LEFT) {
    per.sub(10,0);
  }
      if (keyCode == RIGHT) {
    per.add(10,0);
  }
        if (keyCode == DOWN) {

  }
}