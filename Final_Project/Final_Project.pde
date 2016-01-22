Sprite player;
Map map;
Save save;
Enemy enemy;
Levels level;
Over gameover;

float l = 0;
float r = 0;
float down = 0;
float up = 0;
float grav = .5;
float floor = 700;
float speedStat = 2;
float w, x, y, vy, vx, rh, rw1, rw2, rw3, rx, ry1, ry2, ry3, stage, c, z, d, rw4, rw5, rw6, rh1, ry4, ry5, ry6, rx1, rx2, rx3, rx4, ry7, rh2, rw7, rx5, ry8, rh3, rw8, rx6, ry9, rh4, rw9;
PImage zig, dreams, back;
PFont cool;
    PImage getSubImage(PImage image, int row, int column, int frameWidth, int frameHeight) {
      return image.get(column * frameWidth, row * frameHeight, frameWidth, frameHeight);
    }
void setup() {
  size(1000, 800);
  enemy = new Enemy();
  player = new Sprite();
  map = new Map();
  save = new Save();
  level = new Levels();
  gameover = new Over();
  x = width/2;
  y = height/2;
  w = 0;
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
  rx4=50;
  ry7=50;
  rh2=50;
  rw7=50;
  rx5=600;
  ry8=475;
  rh3=35;
  rw8=103;
  rx6=375;
  ry9=475;
  rh4=35;
  rw9=87;
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
        stage=1.5;
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
  if (stage==1.5) {
    background(0);
    fill(0);
    textSize(64);
    fill(255);
    textAlign(CENTER);
    String s= "So, you have been diagnosed with a rare sleeping disorder. The doctors do not know what to do. You will be faced with this problem forever, unless you fight the Dreams and Nightmares. Put an end to your never-ending nightmares and the dreams as well to ensure the nightmares never come back.";
    text(s, 20, 20, 980, 780);
    textSize(32);
    fill(w);
    text("PRESS SPACE TO PLAY", 500, 700);
    if (millis()>= 5000) {
      w=255;
    }
    if (millis()>= 5000) {
      w=255;
    }
    if (millis()>= 6000) {
      w=0;
    }
    if (millis()>= 6500) {
      w=255;
    }
    if (millis()>= 8000) {
      w=0;
    }
    if (millis()>= 8500) {
      w=255;
    }
    if (keyPressed) {
      if (key== ' ') {
        stage = 2;
      }
    }
  }
  if (stage==2) {
    map.display();
    save.savegame();
    enemy.displaystg1lvl1();
    enemy.isInContactEnemy(player);
    level.display();
    player.health();
    level.levelup();
    enemy.enemydissapear();
    player.loselife();
    if (player.lives == 0) {
      gameover.display();
    }
    if (save.saving == 1) {
      if (mouseX > save.x && mouseY > save.y && mouseX < save.x+save.r && mouseY < save.y+save.h) {
        save.mouseReleased();
      }
    }
    if (player.per.y >= map.y-map.h && player.per.x < map.w) {
      player.vel.y = 0;
    }
    if (player.per.x-30>= width) {
      background(0, 0, 255);
      save.savegame();
      player.per.x = 0;
    }
    if (player.per.x-30<= 0) {
      player.per.x = 35;
    }
    player.vel.x = player.sp * (l + r);
    player.per.add(player.vel);
    if (player.per.y < floor) {
      player.vel.y += grav;
    } else {
      player.vel.y = 0;
    }
    if (player.per.y >= floor && up != 0) {
      player.vel.y = -player.ysp;
    }
    player.frameTime += .25; 
    if (player.frameTime >= 8) { 
      player.frameTime = 1;
    }
    player.frameColumn = (int)player.frameTime;

    if (player.vel.x == 0 && player.vel.y == 0) {
      player.frameColumn = 0;
    }

    if (l != 0) {
      player.frameRow = 0;
    }
    if (r != 0) {
      player.frameRow = 1;
    } 
    if (level.l == 1) {
      if (player.sp > 4 || player.sp<1) {
        player.sp = 2;
      }
    }
    if (level.l == 2) {
      speedStat = 4;
      if (player.sp > 8 || player.sp<1) {
        player.sp = 2;  //add other levels to game
      }
    }
    pushMatrix();
    translate(player.per.x, player.per.y);
    imageMode(CENTER);

    PImage frameImage = getSubImage(player.image, player.frameRow, player.frameColumn, 100, 105);
    PImage frameImagered = getSubImage(player.imagered, player.frameRow, player.frameColumn, 100, 105);
    // Draw this image instead of player.image
    if (stage ==2) {
      image(frameImage, 0, 0);
    }
    if (stage == 3) {
      image(frameImagered, 0, 0);
    }
    popMatrix();
    // Our function to return a new smaller crop from the spritesheet.

  }
  if (stage == 2.5){
        background(0);
    fill(0);
    textSize(64);
    fill(255);
    textAlign(CENTER);
    String s= "So, you have been diagnosed with a rare sleeping disorder. The doctors do not know what to do. You will be faced with this problem forever, unless you fight the Dreams and Nightmares. Put an end to your never-ending nightmares and the dreams as well to ensure the nightmares never come back.";
    text(s, 20, 20, 980, 780);
    textSize(32);
    fill(w);
    text("PRESS SPACE TO PLAY", 500, 700);
    if (millis()>= 5000) {
      w=255;
    }
    if (millis()>= 5000) {
      w=255;
    }
    if (millis()>= 6000) {
      w=0;
    }
    if (millis()>= 6500) {
      w=255;
    }
    if (millis()>= 8000) {
      w=0;
    }
    if (millis()>= 8500) {
      w=255;
    }
    if (keyPressed) {
      if (key== ' ') {
        stage = 3;
      }
    }
  }
  if (stage==3) {
    map.display();
    save.savegame();
    enemy.displaystg1lvl1();
    enemy.isInContactEnemy(player);
    level.display();
    player.health();
    level.levelup();
    enemy.enemydissapear();
    player.loselife();
    if (player.lives == 0) {
      gameover.display();
    }
    if (save.saving == 1) {
      if (mouseX > save.x && mouseY > save.y && mouseX < save.x+save.r && mouseY < save.y+save.h) {
        save.mouseReleased();
      }
    }
    if (player.per.y >= map.y-map.h && player.per.x < map.w) {
      player.vel.y = 0;
    }
    if (player.per.x-30>= width) {
      background(0, 0, 255);
      save.savegame();
      player.per.x = 0;
    }
    if (player.per.x-30<= 0) {
      player.per.x = 35;
    }
    player.vel.x = player.sp * (l + r);
    player.per.add(player.vel);
    if (player.per.y < floor) {
      player.vel.y += grav;
    } else {
      player.vel.y = 0;
    }
    if (player.per.y >= floor && up != 0) {
      player.vel.y = -player.ysp;
    }
    player.frameTime += .25; 
    if (player.frameTime >= 8) { 
      player.frameTime = 1;
    }
    player.frameColumn = (int)player.frameTime;

    if (player.vel.x == 0 && player.vel.y == 0) {
      player.frameColumn = 0;
    }

    if (l != 0) {
      player.frameRow = 0;
    }
    if (r != 0) {
      player.frameRow = 1;
    } 
    if (level.l == 1) {
      if (player.sp > 4 || player.sp<1) {
        player.sp = 2;
      }
    }
    if (level.l == 2) {
      speedStat = 4;
      if (player.sp > 8 || player.sp<1) {
        player.sp = 2;  //add other levels to game
      }
    }
    pushMatrix();
    translate(player.per.x, player.per.y);
    imageMode(CENTER);

    PImage frameImage = getSubImage(player.image, player.frameRow, player.frameColumn, 100, 105);
    PImage frameImagered = getSubImage(player.imagered, player.frameRow, player.frameColumn, 100, 105);
    // Draw this image instead of player.image
    if (stage ==2) {
      image(frameImage, 0, 0);
    }
    if (stage == 3) {
      image(frameImagered, 0, 0);
    }
    popMatrix();
    // Our function to return a new smaller crop from the spritesheet.
  }
  if (stage==4) {
    background(0);
    rect(rx5, ry8, rw8, rh3);
    rect(rx6, ry9, rw9, rh4);
    textAlign(CENTER);
    textSize(48);
    text("SETTINGS", 500, 100);
    textAlign(NORMAL);
    textSize(15);
    text("SPACE: Shoot      UP: Jump      Left/Right: Move      Z: Sprint", 400, 597);
    textSize(25);
    text("ON                         OFF", 400, 500);
    textAlign(LEFT);
    textSize(32);
    text("Sound", 100, 500);
    noFill();
    text("How To Play", 100, 600);      
    noFill();
    text("About The Creators", 100, 700);
    noFill();
    dreams = loadImage("DnN.png");
    image(dreams, 375, 175, 250, 250);
    noFill();
    rect(rx4, ry7, rw7, rh2);
    back = loadImage("BACK.png");
    image(back, 50, 50, 53, 53);
  }
  if (mouseX>=rx4 && mouseX<=rx4+rw7 && mouseY>=ry7 && mouseY<=ry7+rh2) {
    if (mousePressed) {
      stage=1;
    }
  }
  if (mouseX>=rx6 && mouseX<=rx6+rw9 && mouseY>=ry9 && mouseY<=ry9+rh4) {//this is the ON hitbox
  }
  if (mouseX>=rx5 && mouseX<=rx5+rw8 && mouseY>=ry8 && mouseY<=ry8+rh3) {//this is the OFF hitbox
  }
}
  void keyPressed() {
    if (keyCode == RIGHT) {
      r = 1;
    }
    if (keyCode == LEFT) {
      l = -1;
    }
    if (keyCode == UP) {
      up = -1;
    }
    if (key == 'z') {
      player.sp += speedStat;
    }
  }

  void keyReleased() {
    if (keyCode == RIGHT) {
      r = 0;
      player.frameTime = 1;
    }
    if (keyCode == LEFT) {
      l = 0;
    }
    if (keyCode == UP) {
      up = 0;
    }
    if (key == 'z') {
      player.sp -= speedStat;
    }
  } 