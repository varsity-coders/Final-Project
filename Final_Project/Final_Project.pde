float x, y, vy, vx;
void setup() {
  size(800, 600);
  x = width/2;
  y = height/2;
  vy = 5;
  vy = 5;
}

void draw() {
  background(0);
  fill(random(255),random(255),random(255));
  ellipse(x, y, 10, 10);
  if(y > height/2) {
  }
  if (keyPressed) {
    if (keyCode == UP) {
      y+=vy;
    }
  }
}