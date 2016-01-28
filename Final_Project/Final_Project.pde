import ddf.minim.*;//the following lines are used to import and analyze the minim audio plugin
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
//fix mousePressed error when entering campaign

Sprite player;//creates a Sprite under the name player
Map map;//Map under the name map
Enemy enemy;//enemy called enemy
Levels level;//level
Shooter shoot;//shoot command for shooter (gun)
Minim minim;//initializes minim

AudioPlayer full;//initializes various sounds used throughout the game
AudioPlayer dream;//for the campaign mode song
AudioPlayer night;//survival mode song
AudioPlayer rollover;//menu sounds
AudioPlayer rollover1;
AudioPlayer rollover2;
AudioPlayer loadscreen;
AudioPlayer laserblast;//sounds for laser blasts
AudioPlayer laserblast2;

float fill = 255;//creates various floats for use later
float l = 0;//left movement of sprite is 0
float r = 0;//right movement 0
float up = 0;//used for identifying up key pressing later
float grav = .5;//gravity of sprite
float floor = 750;//sets y coordinate of the floor of the map
float speedStat = 1;//base speed of sprite player
float x, y, vy, vx, rh, rw1, rw2, rw3, rx, ry1, ry2, ry3, c, z, d, rw4, 
  rw5, rw6, rh1, ry4, ry5, ry6, rx1, rx2, rx3, rx4, ry7, rh2, rw7, rx5, ry8, rh3, rw8, 
  rx6, ry9, rh4, rw9, rx10, rw10, ry10, rh10, rx11, rw11, ry11, rh11;//mostly hitboxes for menu
PImage zig, dreams, back, load, campaignbackground;//various pictures used later
PFont cool;//creates PFont "cool"
float loadx, loadw, loadfill, stage, nextlevel;//creates floats to be able to change levels and stages consecutively without key presses
float customtime = 1,customtime2 = 1;//used later on for loading screen of campaign
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
  x = width/2;//this x and y are going to be used for various classes
  y = height/2;
  loadx = 0;
  loadw = 10;
  nextlevel = 1;
  vy = 5;
  vy = 5;
  stage=1;
  rh=50;//all of the following were used in creating the hitboxes used to click on menus and change settings (coordinates of each box)
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
  full = minim.loadFile("FULL.mp3");//mp3s used with minim
  dream = minim.loadFile("DREAMS.mp3");//^^^^
  night = minim.loadFile("NIGHTMARES.mp3");
  rollover = minim.loadFile("rollover.mp3");
  rollover1 = minim.loadFile("rollover.mp3");
  rollover2 = minim.loadFile("rollover.mp3");
  laserblast = minim.loadFile("LaserBlasts.mp3");
  laserblast2 = minim.loadFile("LaserBlasts.mp3");
}


void draw() {
  cool = loadFont("BankGothicBT-Medium-48.vlw");    //sets font for PFont cool
  textFont(cool);
  if (stage == 1) {//loading screen
    load = loadImage("loading.png"); //loading text
    image(load, 0, 0, 1000, 800);
    textSize(88);
    textAlign(CENTER);
    fill(255);
    text("Varsity-Coders", width/2, 80);//our team name!
    text("Present", width/2, 180);//we present to you...
    fill(255);
    rect(loadx, 770, loadw, 30);//loading bar rectangle
    loadw+=(random(1, 20));//increases width
    fill(200);
    textSize(48);
    textAlign(CENTER);
    if (millis()<1450) {
      text("Yawning", width/2, 700);//in the first 1.45 seconds of the screen "yawning" appears
    }
    if (millis()>1450 && millis()<2700) {
      text("Getting Drowzy", width/2, 700);//"getting drowsy" from 1.45s to 2.7
    }
    if (millis() >2700 && millis()<3950) {
      text("Laying Head Down", width/2, 700);//"laying head down" next
    }
    if (millis() >3950 && millis()<5200) {
      text("Falling Asleep", width/2, 700);//then "falling asleep"
    }
    if (millis() >5200 && millis()<6450) {
      text("Knocked Out", width/2, 700);//"knocked out
    }
    if (millis() >6450) {
      text("Entering Dreams...", width/2, 700);//at 6.45s it says "entering dreams"
    }
    if (loadw > 1100) {//once loading with reaches 1100...
      full.play();//game starts
      full.loop();
      stage = 2;//onto stage 2...
    }
  }

  if (stage==2) {
    background(0);//black background
    zig = loadImage("ZIG.png");//loads zigzag image in the background
    image(zig, 0, 150, 1000, 300);//coordinates
    fill(255);//fill of following text
    textSize(60);//size
    textAlign(CENTER);//centered
    text("DREAMS AND NIGHTMARES", width/2, 100);//title of game!
    textSize(24);//24 pt
    noFill();//no fill for box
    stroke(255);//stroke for box
    strokeWeight(1);//1 strokeweight
    rect(rx, ry1, rw1, rh);//box for campaign button
    fill(c);
    textAlign(CENTER);
    text("CAMPAIGN", width/2, 525);//campaign text
    noFill();
    rect(rx, ry2, rw2, rh);//box for survival button
    fill(r);
    text("SURVIVAL", width/2, 625);//extra text
    noFill();
    rect(rx, ry3, rw3, rh);//box for settings button
    fill(d);
    text("SETTINGS", width/2, 725);//settings
    if (mouseX>=rx && mouseX<=rx+rw1 && mouseY>=ry1 && mouseY<=ry1+rh) {
      c=255;//if mouse goes over campaign button it lights up
      rollover.play();//sound of button
      if (mousePressed) {
        stage=2.5;//campaign mode loading screen//story briefing
      }
    } else {
      c=50;//when you move mouse from button
      rollover.rewind();
    }
    if (mouseX>=rx && mouseX<=rx+rw2 && mouseY>=ry2 && mouseY<=ry2+rh) {//same thing as above but for survival mode
      r=255;
      rollover1.play();
      if (mousePressed) {
        stage=3.5;//survival mode briefing
      }
    } else {
      r=50;
      rollover1.rewind();
    }
    if (mouseX>=rx && mouseX<=rx+rw3 && mouseY>=ry3 && mouseY<=ry3+rh) {//same thing but for settings
      d=255;
      rollover2.play();
      if (mousePressed) {
        stage=5;//stage 5 is settings
      }
    } else {
      d=50;
      rollover2.rewind();
    }
  }
  if (stage==2.5) {
    full.pause();
    background(0);//black background
    fill(0);
    textSize(64);//size of proceeding text
    fill(255);//white fill
    textAlign(CENTER);//centered
    String s= "You have been diagnosed with a rare sleeping disorder. The doctors do not know what to do. You will be faced with this problem forever, unless you conquer your Dreams. Enter the world of dreams and control your destiny.";//storyline
    text(s, 20, 20, 980, 780);//coordinates for string s aka our text
    textSize(48);//size for proceeding text
    if (customtime < 10000) {//once customtime variable reachers 10000 (increments by 50)
      customtime+=50;
      loadfill-=5;
      if (loadfill < 0) {
        loadfill = 255;
      }
      fill(loadfill);  
      text("Loading...", width/2, 750);//loading text for screen
    }
    if (customtime >10000) {
      fill(255);
      text("CLICK TO PLAY", width/2, 750);
      if (mousePressed) {
        //fix the player after this happens
        // add second level
        stage = 3;//stage 3 = actual campaign
        dream.play(); //play first part of song
      }
    }
  }
  if (stage==3) {
    campaign();
  }
  if (stage == 3.5) {//survival mode
    full.pause();
    background(0);//black background
    fill(0);
    textSize(64);
    fill(255);
    textAlign(CENTER);
    String s= "Now that you have conquered your Dreams, you will be faced with your Nightmares. Put an end to your horrid nightmares to ensure they never come back.";//string for the following text
    textAlign(CENTER);//extra code?
    text(s, 15, height/2-200, 980, 780);//coordinates of string s
    textSize(48);//size for Loading
    if (customtime2 < 10000) {//same thing as the campaign loading screen
      customtime2+=50;
      loadfill-=5;
      if (loadfill < 0) {
        loadfill = 255;
      }
      fill(loadfill);  
      text("Loading...", width/2, 750);//Loading
    }
    if (customtime2 >10000) {
      fill(255);
      text("NOW SURVIVE", width/2, 750);
      if (mousePressed) {
        stage = 4;//if mouse is pressed, survival mode starts
      }
    }
  }
  if (stage==4) {
    survival();
  }
  if (stage==4.5) {
    background(0);
    textSize(32);
    textAlign(CENTER);
    text("THE NIGTMARES HAVE CONSUMED YOU", width/2, height/2);
    text("PRESS SPACE TO GO BACK TO MENU", width/2, height/2+100);
    if (mousePressed) {
      if (key == ' ') {
        stage = 2;
        night.pause();
        full.rewind();
        full.play();
      }
    }
  }
  if (stage==5) {//stage 5 is the settings page/instructions page
    background(0);//black background
    back = loadImage("BackButton.png");//back button in the left corner
    dreams = loadImage("DreamsNight.png");//funny picture near the middle
    noFill();
    rect(rx4, ry7, rw7, rh2);//hitboxes for settings buttons
    image(dreams, 365, 155, 280, 280);//coordinates for funny picture
    image(back, 50, 50, 53, 53);//back button coordinates
    rect(rx5, ry8, rw8, rh3);//sound off button hit box
    rect(rx6, ry9, rw9, rh4);//sound on button hit box
    textAlign(CENTER);
    textSize(48);
    fill(255);
    text("SETTINGS", 500, 100);//"Settings" text and coordinates
    textAlign(NORMAL);
    textSize(15);
    fill(255);
    text("SPACE: Shoot      UP: Jump      Left/Right: Move      Z: Sprint     P: Pause", 350, 597);//instructions and their coordinates
    textSize(25);
    fill(255);
    text("ON                         OFF", 400, 500);//sets spacing between on and off button text
    textAlign(LEFT);
    textSize(32);
    fill(255);
    text("Sound", 50, 500);//text for sound setting button
    text("How To Play:", 50, 600);//how to play text
    text("Game Developers:", 50, 700);//created by..
    text("Gilbson Val  Tyler Crown  Mihir Mehta", 50, 720, 780, 800);//yours truly
    text("Giovanni Chacon  Mateo Ginocchi", 50, 760);
  }
  if (mouseX>=rx4 && mouseX<=rx4+rw7 && mouseY>=ry7 && mouseY<=ry7+rh2) {
    if (mousePressed) {
      stage=2;//if mouse pressed on back button go back to main menu
    }
  }
  if (mouseX>=rx6 && mouseX<=rx6+rw9 && mouseY>=ry9 && mouseY<=ry9+rh4) {//this is the ON hitbox
    if (mousePressed) {//turns on all music and sounds if it was turned off
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
    if (mousePressed) {//turns off all music and sounds
      full.mute();
      dream.mute();
      night.mute();
      rollover.mute();
      rollover1.mute();
      rollover2.mute();
      laserblast.mute();
    }
  }
}

void keyPressed() {
  if (keyCode == RIGHT) {
    r = 1;//if right key pressed, r variable increases 1 and sprite moves to the right
  }
  if (keyCode == LEFT) {
    l = -1;//if left key pressed, l variable increases 1 and sprite moves to the left (hence negative increments)
  }
  if (keyCode == UP) {
    up = -1;//if up key pressed, up variable increases 1 and sprite moves up
  }
  if (key == 'z') {
    player.sp += speedStat;//if z key pressed, speedstat of 1 is added to players normal movement speed
  }
}

void keyReleased() {
  if (keyCode == RIGHT) {//when right key is released, the right movement stops increasing
    r = 0;
    player.frameTime = 1;
    laserblast.rewind();
    laserblast.pause();
  }
  if (keyCode == LEFT) {//when left key is released, left movement stops
    l = 0;
    laserblast2.rewind();
    laserblast2.pause();
  }
  if (keyCode == UP) {// if up key released, player stops jumping
    up = 0;
  }
  if (key == 'z') {//if z released player stops sprinting
    player.sp -= speedStat;
  }
} 
void campaign() {
  if (nextlevel==1) {//map level 1 and its properties
  println(enemy.health);
    println(enemy.health2);
      println(enemy.health3);
    map.display2();
    enemy.displaylvl2();
    enemy.updatelvl2();
    shoot.updateleftlvl2();
    shoot.updaterightlvl2();
    enemy.enemydissapearlvl2();
    enemy.isInContactEnemyfromRight4();
    enemy.isInContactEnemyfromLeft4();
    enemy.isEnemyinContactWith4();
    if (enemy.health4 > -2) {
      if (player.per.y >= map.y4-map.h4-10 &&  player.per.x > map.x4) {//when the player is on the 1st platform he can jump on the other platforms and wont fall thru, so long as the other enemies are still alive
        player.vel.y = 0;
        if (up !=0) {
          player.vel.y= -player.ysp;
        }
      } else if (player.per.y>=map.y4-map.h4 && player.per.x > map.x4) {//if not on 1st platform falls to floor 
        player.vel.y += grav-0.1;
      }
    }
      if (player.per.y >= map.y5-map.h5 && player.per.x <map.x5+ map.w5) {//if on 2nd platform player can jump and wont fall thru
        player.vel.y = 0;
        if (up !=0) {
          player.vel.y = -player.ysp;
        }
      }
    
    if (player.per.y >= map.y6-map.h6) {//if player is on 3rd platform he can jump and and wont fall thru
      player.vel.y = 0;
      if (up !=0) {
        player.vel.y = -player.ysp;
      }
    }
    if (enemy.draw4 == false) {//if all enemies die
      if (player.per.x+35 >= width && player.per.y > height/2-100) {//if player crosses from 1st platform to the right he enters 2nd level
        nextlevel = 2;//enter 2nd level
        player.per.x = 0;
        player.per.y = 0;
      }
    } else {
      if (player.per.x + 40 > width) {
        player.per.x = width-40;
      }
    }
  }
  if (nextlevel == 2) {//2nd level and its properties
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
      if (player.per.y >= map.y-map.h && player.per.x < map.w) {//if your on the 1st platform on the second level, you can jump up and on other platforms and wont fall thru
        player.vel.y = 0;
        if (up !=0) {
          player.vel.y= -player.ysp;
        }
      } else if (player.per.y>map.h && player.per.x< map.w) {//if not player brought down by gravity
        player.vel.y += grav;
      }
    }
    if (enemy.health2>-2) {
      if (player.per.y > map.y2-map.h2 && player.per.x > map.x2 ) {//if enemy is alive and player is on 2nd platform he can jump around and wont fall thru
        player.vel.y =0;
        if (up !=0) {
          player.vel.y = -player.ysp;
        }
      }
    }

    if (player.per.y >= map.y3-map.h3) {//when player is on 3rd platform he can jump and wont fall thru
      player.vel.y = 0;
      if (up !=0) {
        player.vel.y = -player.ysp;
      }
    }

    if (enemy.health <0 && enemy.health2 <0 && enemy.health3 <0) {//when all enemies die player can go onto level 3, boss level
      if (player.per.x-35>= width && player.per.y > height/2) {
        nextlevel = 3;
        player.per.x = 0;
        player.per.y = 0;
      }
    } else {
      if (player.per.x + 40 > width) {
        player.per.x = width-40;
      }
    }
  }
  if (nextlevel==3) {//level 3:boss level
    map.displayBOSS();//all of the boss level's properties
    enemy.bossdisplay();
    enemy.updateboss();
    enemy.isBOSSinContactWith();
    enemy.isInContactBOSSfromRight();
    enemy.isInContactBOSSfromLeft();
    shoot.updateBOSSright();
    shoot.updateBOSSleft();
    if (player.per.y >= map.yBOSS-54) {//if player is on platform he can jump and wont fall thru
      player.vel.y = 0;
      if (up !=0) {
        player.vel.y = -player.ysp;
      }
    }
  }
  pushMatrix();
  imageMode(CENTER);
  translate(player.per.x, player.per.y);
  PImage frameImage = getSubImage(player.image, player.frameRow, player.frameColumn, 100, 105);
  // Draw this image instead of player.image
  image(frameImage, 0, 0);
  popMatrix();
  // This function returns a new smaller crop from the spritesheet.
  level.display();//displays amount of xp
  player.health();//shows players health health bar
  level.levelup();//shows level up if it happens
  player.loselife();//shows when a player looses life
  shoot.displayright();//shows when a shot is shot to the right
  shoot.displayleft();//shows when a shot is shot to the left
  if (r!=0) {
    if (keyPressed) {
      if (key == ' ') {//sets conditions for when a shot can happen when player is moving left or up(space bar pressed)
        shoot.shoot = true;
        shoot.setLocationright(player.per.x+50, player.per.y-6);//shooter moves
        laserblast.play();//plays blast noise
      }
    }
  }
  if (l!=0) {//sets conditions for shooter when player is moving to the right or up
    if (keyPressed) {
      if (key == ' ') {
        shoot.shootleft = true;
        shoot.setLocationleft(player.per.x-50, player.per.y-6);
        laserblast.play();//blast noise
      }
    }
  }
  if (player.lives == 0) {//if player runs out of lives stage goes to menu
    textAlign(CENTER);
    textSize(32);
    text("YOU FAILED TO CONQUER YOUR DREAMS", width/2, height/2);
    stage = 2;
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
  if (level.l == 1) {//when player starts out his speed is normally 2
    if (player.sp > 3 || player.sp<1) {
      player.sp = 2;
    }
  }
  if (level.l == 2) {//when he reaches level 2 in terms of xp his speed increases, as well as the speed of the bullets and the power of the bullets
    speedStat = 2;
    shoot.speed = 5;
    shoot.speed2 = 5;
    shoot.powerstat = 2;
    if (player.sp > 4 || player.sp<1) {
      player.sp = 2;
    }
  }
  if (level.l == 3) {//when he reaches level 3 in terms of xp his speed increases, as well as the speed of the bullets and the power of the bullets
    speedStat = 3;
    shoot.speed = 6;
    shoot.speed2 = 6;
    shoot.powerstat = 3;
    if (player.sp > 5 || player.sp<0) {
      player.sp = 2;
    }
  }
  if (level.l == 4) {//when he reaches level 4 in terms of xp his speed increases, as well as the speed of the bullets and the power of the bullets
    speedStat = 4;
    shoot.speed = 7;
    shoot.speed2 = 7;
    shoot.powerstat = 4;
    if (player.sp > 6 || player.sp<0) {
      player.sp = 2;
    }
  }
  if (level.l == 5) {//when he reaches level 5 in terms of xp his speed increases, as well as the speed of the bullets and the power of the bullets
    speedStat = 5;
    shoot.speed = 8;
    shoot.speed2 = 8;
    shoot.powerstat = 5;
    if (player.sp > 7 || player.sp<-1) {
      player.sp = 2;
    }
  }
  if (key == 'p' || key == 'P') {//p pressed for pause
    background(100, 100);//sets a background
    back = loadImage("BackButton.png");//back button to send u back into menu
    textSize(72);//settings for "Paused" text
    textAlign(CENTER);
    fill(255);
    text("Paused", width/2, height/2);
    textAlign(CENTER);//text settings for "Press Space to Resume"
    textSize(48);
    text(" Press Space to Resume", width/2, 600);
    noFill();//no fill for rectangle used as hitbox
    rect(rx10, ry10, rw10, rh10);
    imageMode(CENTER);
    image(back, 75, 75, 50, 50);//location of back button
    if (keyPressed) {
      if (key == ' ') {//if space is pressed your brought back to stage 3 or wherever u left off
        stage = 3;
      }
    }
  }
  if (mousePressed) {
    if (mouseX > rx10 && mouseX <rx10+rw10 && mouseY > ry10 && mouseY< ry10+rh10) {//if mouse pressed your brought back to the menu
      dream.rewind();//restart song
      dream.pause();//pause it
      full.play();//play full song
      stage = 2;//menu
    }
  }
  enemy.bossdissapear();//rip boss :((
}

void survival() {  
  night.play();//play night song
  map.survival(); //survival map
  // This function returns a new smaller crop from the spritesheet.
  player.survivalhealth();//shows survival health
  shoot.displayright();//shows when a shot is shot to the right
  shoot.displayleft();//shows when a shot is shot to the left
  pushMatrix();
  imageMode(CENTER);
  PImage frameImagered = getSubImage(player.imagered, player.frameRow, player.frameColumn, 100, 105);
  // Draw this image instead of player.image
  image(frameImagered, width/2, height/2-45);
  popMatrix();
  player.health2-=2;
  if (player.health2 < 0) {
    player.health2 = 0;
  }
}