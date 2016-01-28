class Enemy {
  PImage image, imagered, boss;
  float x, y; //x and y coordinates of enemy
  float picvel;//picture of it in motion
  float x2, y2;//second enemy coordinates
  float picvel2;
  float x3, y3; //3rd enemy coordinates
  float picvel3;
  float health, health2, health3;//health of all 3 enemies
  float x4, y4; //4th, 5th and 6th enemies and their picvels and their healths
  float picvel4;
  float x5, y5;
  float picvel5;
  float x6, y6; 
  float picvel6;
  float health4, health5, health6;
  float xboss, yboss, bossvel, bosshealth;//variables for the boss enemy
  boolean draw, draw2, draw3;
  boolean draw4, draw5, draw6;
  boolean drawboss;
  Enemy() {
    x = random(400, 560);//gives x movement to enemies (back and forth)
    x2 = random(440, 960);
    x3 = random(400, 560);
    x4 = random(440, 960);
    x5 =  random(40, 660);
    x6 =  random(40, 960);
    picvel = -random(1, 2);
    picvel2 = random(1, 2);
    picvel3 = random(1, 2.5);
    picvel4 = -random(1, 2);
    picvel5 = random(1.25, 2);
    picvel6 = random(1.5, 2.5);
    y = height/2-255;//heights of various enemies (makes them seem to walk on platforms)
    y2 =height/2-55;
    y3 = height/2+145;
    y4 = height/2-255;
    y5 = height/2-55;
    y6 = height/2+145;
    health = 10;//health of enemies
    health2 = 20;
    health3 = 30;
    health4 = 20;
    health5 = 30;
    health6 = 30;
    image  = loadImage("enemy.png");
    draw=true;
    draw2=true;
    draw3=true;
    draw4=true;
    draw5=true;
    draw6=true;
    xboss = 800;//where boss starts out
    yboss = 353;
    bossvel = 4;//velocity of boss
    bosshealth = 100;//health of boss
    drawboss = true;
  }

  void displaylvl1() {
    if  (draw==true) {
      image(image, x, y);
    }
    if  (draw2==true) {
      image(image, x2, y2);
    }
    if  (draw3==true) {
      image(image, x3, y3);
    }
    x += picvel;
    x2 += picvel2;
    x3 += picvel3;

    if (x+40>= 600 || x-40<=0) {
      picvel*=-1;
    }
    if (x2+40>= width || x2-40<=400) {
      picvel2*=-1;
    }

    if (x3+40>= width || x3-40<=0) {
      picvel3*=-1;
    }
  }
  void displaylvl2() {
    if  (draw4==true) {
      image(image, x4, y4);
    }
    if  (draw5==true) {
      image(image, x5, y5);
    }
    if  (draw6==true) {
      image(image, x6, y6);
    }
    x4 += picvel4;
    x5 += picvel5;
    x6 += picvel6;
    if (x4+40>= width || x4-40<=400) {
      picvel4*=-1;
    }
    if (x5+40>= 700 || x5-40<=0) {
      picvel5*=-1;
    }

    if (x6+40>= width || x6-40<=0) {
      picvel6*=-1;
    }
  }
  void updatelvl1() {
    if (health <=0 ) {
      draw = false;
    }
    if (health2 <=0 ) {
      draw2 = false;
    }
    if (health3 <=0 ) {
      draw3 = false;
    }
  }
  void updatelvl2() {
    if (health4 <=0 ) {
      draw4 = false;
    }
    if (health5 <=0 ) {
      draw5 = false;
    }
    if (health6 <=0 ) {
      draw6 = false;
    }
  }
  void updateboss() {
    if (bosshealth <= 0) {
      drawboss = false;
    }
  }
  boolean isInContactEnemyfromRight() { 
    if ( dist(x, y, shoot.x, shoot.y) < 10) { 
      health -=shoot.powerstat;
      if (health < 1 ) {
        draw = false;
      }
      return true;
    } else {      
      return false;
    }
  }
  boolean isInContactEnemyfromRight2() { 
    if ( dist(x2, y2, shoot.x, shoot.y) < 10) { 
      health2 -=shoot.powerstat;
      if (health2 < 1 ) {
        draw2 = false;
      }
      return true;
    } else {      
      return false;
    }
  }
  boolean isInContactEnemyfromRight3() { 
    if ( dist(x3, y3, shoot.x, shoot.y) < 10) { 
      health3 -=shoot.powerstat;
      if (health3 < 1 ) {
        draw3 = false;
      }
      return true;
    } else {      
      return false;
    }
  }
  boolean isInContactEnemyfromLeft() { 
    if ( dist(x, y, shoot.x2, shoot.y2) < 10) { 
      health -=shoot.powerstat;
      if (health < 1 ) {
        draw = false;
      }
      return true;
    } else {      
      return false;
    }
  }
  boolean isInContactEnemyfromLeft2() { 
    if ( dist(x2, y2, shoot.x2, shoot.y2) < 10) { 
      health2 -=shoot.powerstat;
      if (health2 < 1 ) {
        draw2 = false;
      }
      return true;
    } else {      
      return false;
    }
  }
  boolean isInContactEnemyfromLeft3() { 
    if ( dist(shoot.x2, shoot.y2, x3, y3) < 10) { 
      health3 -=shoot.powerstat;
      if (health3 < 1 ) {
        draw3 = false;
      }
      return true;
    } else {      
      return false;
    }
  }
  boolean isEnemyinContactWith1() {
    if (health >= 0) {
      if ( dist(player.per.x, player.per.y, x, y) < 70) { 
        player.health -=2;
      }
      return true;
    } else {      
      return false;
    }
  }
  boolean isEnemyinContactWith2() {
    if (health2 >= 0) {
      if ( dist(player.per.x, player.per.y, x2, y2) < 70) { 
        player.health -=2;
      }
      return true;
    } else {      
      return false;
    }
  }
  boolean isEnemyinContactWith3() {
    if (health3 >= 0) {
      if ( dist(player.per.x, player.per.y, x3, y3) < 70) { 
        player.health -=2;
      }
      return true;
    } else {      
      return false;
    }
  }
  void bossdisplay() {
    boss = loadImage("BOSS.png");
    if (drawboss == true) {
      image(boss, xboss, yboss);
    }
    xboss += bossvel;
    if (xboss+100>= width || xboss-100<=0) {
      bossvel*=-1;
    }
  }
  boolean isBOSSinContactWith() {
    if (bosshealth >= 0) {
      if ( dist(player.per.x, player.per.y, xboss, yboss+50) < 70) { 
        player.health -=2;
      }
      return true;
    } else {      
      return false;
    }
  }
  boolean isInContactBOSSfromRight() { 
    if ( dist(xboss, yboss+50, shoot.x, shoot.y) < 40) { 
      bosshealth -= shoot.powerstat;
      if (bosshealth < 1 ) {
        drawboss = false;
      }
      return true;
    } else {      
      return false;
    }
  }
  boolean isInContactBOSSfromLeft() { 
    if ( dist(xboss, yboss+50, shoot.x2, shoot.y2) < 40) { 
      bosshealth -=shoot.powerstat;
      if (bosshealth < 1 ) {
        drawboss = false;
      }
      return true;
    } else {      
      return false;
    }
  }
  boolean isInContactEnemyfromRight4() { 
    if ( dist(x4, y4, shoot.x, shoot.y) < 10) { 
      health4 -=shoot.powerstat;
      if (health4 < 1 ) {
        draw4 = false;
      }
      return true;
    } else {      
      return false;
    }
  }
  boolean isInContactEnemyfromRight5() { 
    if ( dist(x5, y5, shoot.x, shoot.y) < 10) { 
      health5 -=shoot.powerstat;
      if (health5 < 1 ) {
        draw5 = false;
      }
      return true;
    } else {      
      return false;
    }
  }
  boolean isInContactEnemyfromRight6() { 
    if ( dist(x6, y6, shoot.x, shoot.y) < 10) { 
      health6 -=shoot.powerstat;
      if (health6 < 1 ) {
        draw6 = false;
      }
      return true;
    } else {      
      return false;
    }
  }
  boolean isInContactEnemyfromLeft4() { 
    if ( dist(x4, y4, shoot.x2, shoot.y2) < 10) { 
      health4 -=shoot.powerstat;
      if (health4 < 1 ) {
        draw4 = false;
      }
      return true;
    } else {      
      return false;
    }
  }
  boolean isInContactEnemyfromLeft5() { 
    if ( dist(x5, y5, shoot.x2, shoot.y2) < 10) { 
      health5 -=shoot.powerstat;
      if (health5 < 1 ) {
        draw5 = false;
      }
      return true;
    } else {      
      return false;
    }
  }
  boolean isInContactEnemyfromLeft6() { 
    if ( dist(shoot.x, shoot.y2, x6, y6) < 10) { 
      health6 -=shoot.powerstat;
      if (health6 < 1 ) {
        draw6 = false;
      }
      return true;
    } else {      
      return false;
    }
  }
  boolean isEnemyinContactWith4() {
    if (health4 >= 0) {
      if ( dist(player.per.x, player.per.y, x4, y4) < 70) { 
        player.health -=2;
      }
      return true;
    } else {      
      return false;
    }
  }
  boolean isEnemyinContactWith5() {
    if (health5 >= 0) {
      if ( dist(player.per.x, player.per.y, x5, y5) < 70) { 
        player.health -=2;
      }
      return true;
    } else {      
      return false;
    }
  }
  boolean isEnemyinContactWith6() {
    if (health6 >= 0) {
      if ( dist(player.per.x, player.per.y, x6, y6) < 70) { 
        player.health -=2;
      }
      return true;
    } else {      
      return false;
    }
  }
  void enemydissapearlvl1() {
    if (health == 0) {
      level.xp+=60;
      picvel = 0;
    }
    if (health2 == 0) {
      level.xp+=80;
      picvel2 = 9;
    }
    if (health3 == 0) {
      level.xp+=100;
      player.lives+=1;
      picvel3 = 0;
    }
  }
  void enemydissapearlvl2() {
    if (health4 == 0) {
      level.xp+=80;
      picvel4 = 0;
    }
    if (health5 == 0) {
      level.xp+=100;
      picvel5 = 0;
    }
    if (health6 == 0) {
      level.xp+=120;
      picvel6 = 0;
    }
  }
  void bossdissapear() {
    if (bosshealth == 0) {
      background(0);
      fill(255);
      textAlign(CENTER);
      textSize(32);
      text("YOU BEAT CAMPAIGN Mode!", width/2, height/2);
      text("Now go enjoy yourself in Survival Mode", width/2, height/2+100);
      if (keyPressed) {
        if (key == ' ') {
          stage = 2;
        }
      }
    }
  }
}