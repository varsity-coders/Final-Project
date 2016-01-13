float x, y, vy, vx, rh, rw1, rw2,rw3, rx, ry1, ry2, ry3, stage;
PImage zig;
PFont cool;
void setup() {
  size(1000, 800);
  x = width/2;
  y = height/2;
  vy = 5;
  vy = 5;
  stage=1;
  rh=50;
  rw1=146;
  rw2=138;
  rw3=137;
  rx=450;
  ry1=500;
  ry2=600;
  ry3=700;
}

void draw() {
  if(stage==1){    
  cool = loadFont("BankGothicBT-Medium-48.vlw");
  zig = loadImage("ZIG.png");
  background(0);
  image(zig, 0, 150, 1000, 300);
  textFont(cool);
  textSize(64);
  text("DREAMS AND NIGHTMARES", 0, 100);
  textSize(24);
  fill(255,0,0);
  rect(rx,ry1,rw1,rh);
  fill(255);
  text("CAMPAIGN", 450, 525);
  fill(255,0,0);
  rect(rx,ry2,rw2,rh);
  fill(255);
  text("SURVIVAL", 450, 625);
  fill(255,0,0);
  rect(rx,ry3,rw3,rh);
  fill(255);
  text("SETTINGS", 450, 725);
}
  if(stage==2){
    
}
}