float x, y, vy, vx, a;
void setup() {
  size(800, 600);
  x = width/2;
  y = height/2;
  vx = 5;
  vy = -5;
  a = 1;
}

void draw() {
  background(0);
  fill(random(255), random(255), random(255));
  ellipse(x, y, 10, 10);
  if (keyPressed) {
    if (keyCode == RIGHT) {
      x+=vx;
    }
    if (keyCode == LEFT) {
      x+=-vx;
    }
  }
}