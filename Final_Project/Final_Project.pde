import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
//fix mousePressed error when entering campaign

Sprite player;
Map map;
Enemy enemy;
Levels level;
Shooter shoot;
Minim minim;

AudioPlayer full;
AudioPlayer dream;
AudioPlayer night;
AudioPlayer rollover;
AudioPlayer rollover1;
AudioPlayer rollover2;
AudioPlayer loadscreen;
AudioPlayer laserblast;
AudioPlayer laserblast2;

float fill = 255;
float l = 0;
float r = 0;
float up = 0;
float grav = .5;
float floor = 750;
float speedStat = 1;
float x, y, vy, vx, rh, rw1, rw2, rw3, rx, ry1, ry2, ry3, c, z, d, rw4, 
  rw5, rw6, rh1, ry4, ry5, ry6, rx1, rx2, rx3, rx4, ry7, rh2, rw7, rx5, ry8, rh3, rw8, 
  rx6, ry9, rh4, rw9, rx10, rw10, ry10, rh10, rx11, rw11, ry11, rh11;
PImage zig, dreams, back, load, campaignbackground;
PFont cool;
float loadx, loadw, loadfill, stage, newstage, nextlevel;
float customtime = 1;
PImage getSubImage(PImage image, int row, int column, int frameWidth, int frameHeight) {
  return image.get(column * frameWidth, row * frameHeight, frameWidth, frameHeight);
}
void setup() {
  size(1000, 800);
  enemy = new Enemy();
  player = new Sprite();
  map = new Map();
  level = new Levels();
  shoot = new Shooter();
  x = width/2;
  y = height/2;
  loadx = 0;
  loadw = 10;
  nextlevel = 1;
  vy = 5;
  vy = 5;
  stage=3;
  newstage = 0;
  rh=50;
  rw1=990;
  rw2=990;
  rw3=990;
  rx=5;
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
  rx10 = 50;
  ry10 = 50;
  rw10 = 50;
  rh10 = 50;
  rx11 = 50;
  ry11 = 50;
  rw11 = 50;
  rh11= 50;
  loadfill = 255;
  minim = new Minim(this); //minim audio import
  full = minim.loadFile("FULL.mp3");
  dream = minim.loadFile("DREAMS.mp3");
  night = minim.loadFile("NIGHTMARES.mp3");
  rollover = minim.loadFile("rollover.mp3");
  rollover1 = minim.loadFile("rollover.mp3");
  rollover2 = minim.loadFile("rollover.mp3");
  laserblast = minim.loadFile("LaserBlasts.mp3");
  laserblast2 = minim.loadFile("LaserBlasts.mp3");
}


void draw() {
  cool = loadFont("BankGothicBT-Medium-48.vlw");    
  textFont(cool);
  if (stage == 1) {
    load = loadImage("loading.png"); 
    image(load, 0, 0, 1000, 800);
    textSize(88);
    textAlign(CENTER);
    fill(255);
    text("Varsity-Coders", width/2, 80);
    text("Present", width/2, 180);
    fill(255);
    rect(loadx, 770, loadw, 30);
    loadw+=(random(1, 20));
    fill(200);
    textSize(48);
    textAlign(CENTER);
    if (millis()<1450) {
      text("Yawning", width/2, 700);
    }
    if (millis()>1450 && millis()<2700) {
      text("Getting Drowzy", width/2, 700);
    }
    if (millis() >2700 && millis()<3950) {
      text("Laying Head Down", width/2, 700);
    }
    if (millis() >3950 && millis()<5200) {
      text("Falling Asleep", width/2, 700);
    }
    if (millis() >5200 && millis()<6450) {
      text("Knocked Out", width/2, 700);
    }
    if (millis() >6450) {
      text("Entering Dreams...", width/2, 700);
    }
    if (loadw > 1100) {
      full.play();
      full.loop();
      stage = 2;
    }
  }

  if (stage==2) {
    background(0);
    zig = loadImage("ZIG.png");
    image(zig, 0, 150, 1000, 300);
    fill(255);
    textSize(60);
    textAlign(CENTER);
    text("DREAMS AND NIGHTMARES", width/2, 100);
    textSize(24);
    noFill();
    stroke(255);
    strokeWeight(1);
    rect(rx, ry1, rw1, rh);
    fill(c);
    textAlign(CENTER);
    text("CAMPAIGN", width/2, 525);
    noFill();
    rect(rx, ry2, rw2, rh);
    fill(r);
    text("SURVIVAL", width/2, 625);
    noFill();
    rect(rx, ry3, rw3, rh);
    fill(d);
    text("SETTINGS", width/2, 725);
    if (mouseX>=rx && mouseX<=rx+rw1 && mouseY>=ry1 && mouseY<=ry1+rh) {
      c=255;
      rollover.play();
      if (mousePressed) {
        stage=2.5;
      }
    } else {
      c=50;
      rollover.rewind();
    }
    if (mouseX>=rx && mouseX<=rx+rw2 && mouseY>=ry2 && mouseY<=ry2+rh) {
      r=255;
      rollover1.play();
      if (mousePressed) {
        stage=3.5;
      }
    } else {
      r=50;
      rollover1.rewind();
    }
    if (mouseX>=rx && mouseX<=rx+rw3 && mouseY>=ry3 && mouseY<=ry3+rh) {
      d=255;
      rollover2.play();
      if (mousePressed) {
        stage=5;
      }
    } else {
      d=50;
      rollover2.rewind();
    }
  }
  if (stage==2.5) {
    full.pause();
    background(0);
    fill(0);
    textSize(64);
    fill(255);
    textAlign(CENTER);
    String s= "You have been diagnosed with a rare sleeping disorder. The doctors do not know what to do. You will be faced with this problem forever, unless you conquer your Dreams. Enter the world of dreams and control your destiny.";
    text(s, 20, 20, 980, 780);
    textSize(48);
    if (customtime < 10000) {
      customtime+=50;
      loadfill-=5;
      if (loadfill < 0) {
        loadfill = 255;
      }
      fill(loadfill);  
      text("Loading...", width/2, 750);
    }
    if (customtime >10000) {
      fill(255);
      text("CLICK TO PLAY", width/2, 750);
      if (mousePressed) {
        //fix the player after this happens
        // add second level
        stage = 3;
      }
    }
  }
  if (stage==3) {
    campaign();
  }
  if (stage == 3.5) {
    full.pause();
    background(0);
    fill(0);
    textSize(64);
    fill(255);
    textAlign(CENTER);
    String s= "Now that you have conquered your Dreams, you will be faced with your Nightmares. Put an end to your horrid nightmares to ensure they never come back.";
    textAlign(CENTER);
    text(s, 15, height/2-200, 980, 780);
    textSize(48);
    if (customtime < 10000) {
      customtime+=50;
      loadfill-=5;
      if (loadfill < 0) {
        loadfill = 255;
      }
      fill(loadfill);  
      text("Loading...", width/2, 750);
    }
    if (customtime >10000) {
      fill(255);
      text("NOW SURVIVE", width/2, 750);
      if (mousePressed) {
        stage = 4;
      }
    }
  }
  if (stage==4) {
    //fix survival
    //test survival A LOT
    survival();
  }
  if (stage==5) {
    background(0);
    back = loadImage("BackButton.png");
    dreams = loadImage("DreamsNight.png");
    noFill();
    rect(rx4, ry7, rw7, rh2);
    image(dreams, 365, 155, 280, 280);
    image(back, 50, 50, 53, 53);
    rect(rx5, ry8, rw8, rh3);
    rect(rx6, ry9, rw9, rh4);
    textAlign(CENTER);
    textSize(48);
    fill(255);
    text("SETTINGS", 500, 100);
    textAlign(NORMAL);
    textSize(15);
    fill(255);
    text("SPACE: Shoot      UP: Jump      Left/Right: Move      Z: Sprint     P: Pause", 350, 597);
    textSize(25);
    fill(255);
    text("ON                         OFF", 400, 500);
    textAlign(LEFT);
    textSize(32);
    fill(255);
    text("Sound", 50, 500);
    text("How To Play:", 50, 600);
    text("Game Developers:", 50, 700);
    text("Gilbson Val  Tyler Crown  Mihir Mehta", 50, 720, 780, 800);
    text("Giovanni Chacon  Mateo Ginocchi", 50, 760);
  }
  if (mouseX>=rx4 && mouseX<=rx4+rw7 && mouseY>=ry7 && mouseY<=ry7+rh2) {
    if (mousePressed) {
      stage=2;
    }
  }
  if (mouseX>=rx6 && mouseX<=rx6+rw9 && mouseY>=ry9 && mouseY<=ry9+rh4) {//this is the ON hitbox
    if (mousePressed) {
      full.unmute();
      dream.unmute();
      night.unmute();
      rollover.unmute();
      rollover1.unmute();
      rollover2.unmute();
      laserblast.unmute();
    }
  }
  if (mouseX>=rx5 && mouseX<=rx5+rw8 && mouseY>=ry8 && mouseY<=ry8+rh3) {//this is the OFF hitbox
    if (mousePressed) {
      full.mute();
      dream.mute();
      night.mute();
      rollover.mute();
      rollover1.mute();
      rollover2.mute();
      laserblast.mute();
    }
  }
  if ( newstage ==6 ) {
    dream.mute();
    background(0);
    textSize(72);
    textAlign(CENTER);
    text("Game Over", width/2, height/2);
    textSize(48);
    text("Click to Go Back to Menu", width/2, height/2+100);
    if (mousePressed) { //problem here after click
      stage =2;
      dream.pause();
    }
  }
  if (newstage == 7) {
    night.mute();
    background(0);
    textSize(72);
    textAlign(CENTER);
    text("You Failed", width/2, height/2);
    textSize(48);
    text("Click to Go Back to Menu", width/2, height/2+100);
    if (mousePressed) { ////problem here after click
      night.pause();
      stage =2;
    }
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
    laserblast.rewind();
    laserblast.pause();
  }
  if (keyCode == LEFT) {
    l = 0;
    laserblast2.rewind();
    laserblast2.pause();
  }
  if (keyCode == UP) {
    up = 0;
  }
  if (key == 'z') {
    player.sp -= speedStat;
  }
} 
void campaign() {
  dream.play();
  //campaignbackground = loadImage("campaign.png");
  //image(campaignbackground, 1000,800);
  if (nextlevel==1) {
    map.display2();
    enemy.displaylvl2();
    enemy.updatelvl2();
    //shoot.updateleftlvl2();
    //shoot.updaterightlvl2();
    enemy.enemydissapearlvl2();
    if (enemy.health4 > -2) {
      if (player.per.y >= map.y4-map.h4-10 &&  player.per.x > map.x4) {
        player.vel.y = 0;
      if (up !=0) {
        player.vel.y= -player.ysp;
      }
      }else if (player.per.y>=map.y-map.h4 && player.per.x > map.x4) {
        player.vel.y += grav-0.1;
      }
    }
    if (enemy.health4 <0 && enemy.health5 <0 && enemy.health6 <0) {
      if (player.per.x-35>= width && player.per.y > height/2) {
        nextlevel = 2;
        player.per.x = 0;
        player.per.y = 0;
      }
    } else {
      if (player.per.x + 40 > width) {
        player.per.x = width-40;
      }
    }
  }
  if (nextlevel == 2) {
    map.display();
    shoot.updateleftlvl1();
    shoot.updaterightlvl1();
    enemy.displaylvl1();
    enemy.updatelvl1();
    enemy.enemydissapearlvl1();
    enemy.isInContactEnemyfromRight();
    enemy.isInContactEnemyfromLeft();
    enemy.isInContactEnemyfromRight2();
    enemy.isInContactEnemyfromLeft2();
    enemy.isInContactEnemyfromRight3();
    enemy.isInContactEnemyfromLeft3();
    enemy.isEnemyinContactWith1();
    enemy.isEnemyinContactWith2();
    enemy.isEnemyinContactWith3();
    if (enemy.health >-2) {
      if (player.per.y >= map.y-map.h && player.per.x < map.w) {
        player.vel.y = 0;
        if (up !=0) {
          player.vel.y= -player.ysp;
        }
      } else if (player.per.y>map.h && player.per.x< 600) {
        player.vel.y += grav;
      }
    }
    if (enemy.health2>-2) {
      if (player.per.y > map.y2-map.h2 && player.per.x > map.x2 ) {
        player.vel.y =0;
        if (up !=0) {
          player.vel.y = -player.ysp;
        }
      }
    }

    if (player.per.y >= map.y3-map.h3) {
      player.vel.y = 0;
      if (up !=0) {
        player.vel.y = -player.ysp;
      }
    }

    if (enemy.health <0 && enemy.health2 <0 && enemy.health3 <0) {
      if (player.per.x-35>= width && player.per.y > height/2) {
        nextlevel = 3;
        player.per.x = 760;
        player.per.y = 0;
      }
    } else {
      if (player.per.x + 40 > width) {
        player.per.x = width-40;
      }
    }
  }
  if (nextlevel==3) {
    map.displayBOSS();
  }
  pushMatrix();
  imageMode(CENTER);
  translate(player.per.x, player.per.y);
  PImage frameImage = getSubImage(player.image, player.frameRow, player.frameColumn, 100, 105);
  // Draw this image instead of player.image
  image(frameImage, 0, 0);
  popMatrix();
  // This function  returns a new smaller crop from the spritesheet.
  level.display();
  player.health();
  level.levelup();
  player.loselife();
  shoot.displayright();
  shoot.displayleft();
  if (r!=0) {
    if (keyPressed) {
      if (key == ' ') {
        shoot.shoot = true;
        shoot.setLocationright(player.per.x+50, player.per.y-6);
        laserblast.play();
      }
    }
  }
  if (l!=0) {
    if (keyPressed) {
      if (key == ' ') {
        shoot.shootleft = true;
        shoot.setLocationleft(player.per.x-50, player.per.y-6);
        laserblast.play();
      }
    }
  }
  if (player.lives == 0) {
    newstage = 6;
  }
  if (player.per.y < -2) {
    player.vel.y = -player.vel.y;
  }

  if (player.per.x-35<= -1) {
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
    if (player.sp > 3 || player.sp<1) {
      player.sp = 2;
    }
  }
  if (level.l == 2) {
    speedStat = 2;
    shoot.speed = 5;
    shoot.speed2 = 5;
    if (player.sp > 4 || player.sp<1) {
      player.sp = 2;
    }
  }
  if (level.l == 3) {
    speedStat = 3;
    shoot.speed = 6;
    shoot.speed2 = 6;
    if (player.sp > 5 || player.sp<0) {
      player.sp = 2;
    }
  }
  if (level.l == 4) {
    speedStat = 4;
    shoot.speed = 7;
    shoot.speed2 = 7;
    if (player.sp > 6 || player.sp<0) {
      player.sp = 2;
    }
  }
  if (level.l == 5) {
    speedStat = 5;
    shoot.speed = 8;
    shoot.speed2 = 8;
    if (player.sp > 7 || player.sp<-1) {
      player.sp = 2;
    }
  }
  if (key == 'p' || key == 'P') {
    background(100, 100);
    back = loadImage("BackButton.png");
    textSize(72);
    textAlign(CENTER);
    fill(255);
    text("Paused", width/2, height/2);
    textAlign(CENTER);
    textSize(48);
    text(" Press Space to Resume", width/2, 600);
    noFill();
    rect(rx10, ry10, rw10, rh10);
    imageMode(CENTER);
    image(back, 75, 75, 50, 50);
    if (keyPressed) {
      if (key == ' ') {
        stage = 3;
      }
    }
  }
  if (mousePressed) {
    if (mouseX > rx10 && mouseX <rx10+rw10 && mouseY > ry10 && mouseY< ry10+rh10) {
      dream.rewind();
      dream.pause();
      full.play();
      stage = 2;
    }
  }
}

void survival() {  
  night.play();
  //map.survival();

  pushMatrix();
  translate(player.per.x, player.per.y);
  imageMode(CENTER);
  PImage frameImagered = getSubImage(player.imagered, player.frameRow, player.frameColumn, 100, 105);
  // Draw this image instead of player.image
  image(frameImagered, 0, 0);
  popMatrix();
  // Our function to return a new smaller crop from the spritesheet.
  //enemy.displaysurvival();
  //enemy.isInContactEnemy();
  player.survivalhealth();
  enemy.enemydissapearlvl1();
  if (player.lives == 0) {
    newstage = 7;
  }
  if (player.per.y >= map.y-map.h && player.per.x < map.w) {
    player.vel.y = 0;
  }
  if (player.per.y > map.y-map.h) {
    player.vel.y += grav;
  } else {
    player.vel.y = 0;
  }
  if (player.per.y >= floor && up != 0) {
    player.vel.y = -player.ysp;
  }
  if (player.per.x-30>= width) {
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
  if (key == 'p' || key == 'P') {
    background(100, 100);
    back = loadImage("BackButton.png");
    image(back, 75, 75, 50, 50);
    textSize(72);
    textAlign(CENTER);
    fill(255);
    text("Paused", width/2, height/2);
    textAlign(CENTER);
    textSize(48);
    text(" Press Space to Resume", width/2, 600);
    noFill();
    rect(rx11, ry11, rw11, rh11);
    if (keyPressed) {
      if (key == ' ') {
        stage = 4;
      }
    }
    if (mousePressed) {
      if (mouseX > rx11 && mouseX<rx11+rw11 && mouseY > ry11 && mouseX< ry11+rh11) {
        night.rewind();
        night.pause();
        full.play();
        stage = 2;
      }
    }
  }
}