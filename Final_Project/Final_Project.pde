
//Shooter gun1;

float x, y, vy, vx, rh, rw1, rw2, rw3, rx, ry1, ry2, ry3, stage, c, r, d, rw4, rw5, rw6, rh1, ry4, ry5, ry6, rx1, rx2, rx3;

PImage zig, dreams;
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
  rx1=443;
  rx2=385;
  rx3=315;
  ry1=495;
  ry2=595;
  ry3=695;
  rw4=115;
  rw5=225;
  rw6=365;
  rh1=30;
  ry4=478;
  ry5=578;
  ry6=678;
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
    background(random(255), random(255), random(255));
  }
  if (stage==4) {
    background(0);
    textAlign(CENTER);
    textSize(48);
    text("SETTINGS", 500, 100);
    textSize(32);
    text("Sound", 500, 500);
    noFill();
    rect(rx1, ry4, rw4, rh1);
    fill(c);
    text("How To Play", 500, 600);
    noFill();
    rect(rx2, ry5, rw5, rh1);
    fill(r);
    text("About The Creators", 500, 700);
    noFill();
    rect(rx3, ry6, rw6, rh1);
    fill(d);
    dreams = loadImage("DnN.png");
    image(dreams, 375, 175, 250, 250);
  }
  if (mouseX>=rx1&& mouseX<=rx1+rw4&& mouseY>=ry4 && mouseY<=ry4+rh1) {
    c=255;
    if (mousePressed) {
      stage=2;
    }
  } else {
    c=50;
  }
  if (mouseX>=rx1&& mouseX<=rx1+rw5&& mouseY>=ry5 && mouseY<=ry5+rh1) {
    r=255;
    if (mousePressed) {
      stage=3;
    }
  } else {
    r=50;
  }
  if (mouseX>=rx1&& mouseX<=rx1+rw6&& mouseY>=ry6 && mouseY<=ry6+rh1) {
    d=255;
    if (mousePressed) {
      stage=4;
    }
  } else {
    d=50;
  }
}