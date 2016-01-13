
float x, y, vy, vx, a;
Shooter gun1;
PImage zig;
PFont cool;

void setup() {
  size(800, 600);
  x = width/2;
  y = height/2;
  vx = 5;
  vy = -5;
  a = 1;
  
  gun1 = new Shooter(255, x+2, y+3, 5, 2);
}

void draw() {
  cool = loadFont("BankGothicBT-Medium-48.vlw");
  zig = loadImage("ZIG.png");
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
  
  gun1.display();
  gun1.update();

  image(zig, 0, 100, 1000, 250);
  textFont(cool);
  textSize(64);
  text("DREAMS AND NIGHTMARES", 0, 75);
  textSize(24);
  text("CAMPAIGN", 350, 400);
  text("SURVIVAL", 350, 500);
  text("SETTINGS", 350, 600);
  fill(255);

}