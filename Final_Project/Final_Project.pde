float x, y, vy, vx, rh, rw1, rw2, rw3, rx, ry1, ry2, ry3, stage, c, r, d;
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
  ry1=495;
  ry2=595;
  ry3=695;
}

void draw() {
  if (stage==1) {    
    cool = loadFont("BankGothicBT-Medium-48.vlw");
    zig = loadImage("ZIG.png");
    background(0);
    image(zig, 0, 150, 1000, 300);
    textFont(cool);
    textSize(64);
    fill(255);
    text("DREAMS AND NIGHTMARES", 0, 100);
    textSize(24);
    noFill();
    stroke(255);
    strokeWeight(1);
    rect(rx, ry1, rw1, rh);
    fill(c);
    text("CAMPAIGN", 450, 525);
    noFill();
    rect(rx, ry2, rw2, rh);
    fill(r);
    text("SURVIVAL", 450, 625);
    noFill();
    rect(rx, ry3, rw3, rh);
    fill(d);
    text("SETTINGS", 450, 725);
    if (mouseX>=rx && mouseX<=rx+rw1 && mouseY>=ry1 && mouseY<=ry1+rh) {
      c=255;
      if (mousePressed) {
        stage=2;
      }
    } else {
      c=50;
    }
    if (mouseX>=rx && mouseX<=rx+rw2 && mouseY>=ry2 && mouseY<=ry2+rh) {
      r=255;
      if (mousePressed) {
        stage=3;
      }
    } else {
      r=50;
    }
    if (mouseX>=rx && mouseX<=rx+rw3 && mouseY>=ry3 && mouseY<=ry3+rh) {
      d=255;
      if (mousePressed) {
        stage=4;
      }
    } else {
      d=50;
    }
  }
  if (stage==2) {
    background(255);
  }
  if (stage==3) {
    background(random(255),random(255),random(255));
  }
  if (stage==4) {
    background(255,0,0);
  }
}