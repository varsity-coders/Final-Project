float x, y, vy, vx;
PImage zig;
PFont cool;
void setup() {
  size(800, 600);
  x = width/2;
  y = height/2;
  vy = 5;
  vy = 5;
}

void draw() {
  cool = loadFont("BankGothicBT-Medium-48.vlw");
  zig = loadImage("ZIG.png");
  background(0);
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