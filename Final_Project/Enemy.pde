class Enemy {
  PImage image, imagered;
  float x, y; 
  float picvel;
  float x2, y2;
  float picvel2;
  float x3, y3; 
  float picvel3;
  float health, health2, health3;
  float x4, y4; 
  float picvel4;
  float x5, y5;
  float picvel5;
  float x6, y6; 
  float picvel6;
  float health4, health5, health6;
  boolean draw, draw2, draw3;
  boolean draw4, draw5, draw6;
  Enemy() {
    x = random(400, 560);
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
    y = height/2-255;
    y2 =height/2-55;
    y3 = height/2+145;
    y4 = height/2-255;
    y5 = height/2-55;
    y6 = height/2+145;
    health = 15;
    health2 = 25;
    health3 = 35;
    health4 = 25;
    health5 = 35;
    health6 = 45;
    image  = loadImage("enemy.png");
    draw=true;
    draw2=true;
    draw3=true;
    draw4=true;
    draw5=true;
    draw6=true;
  }

  void displaylvl1() {
    println(enemy.health3); //fix enemy health 3
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
    if (x4+40>= width || x4-40<=0) {
      picvel4*=-1;
    }
    if (x5+40>= width || x5-40<=0) {
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
  boolean isInContactEnemyfromRight() { 
    if ( dist(x, y, shoot.x, shoot.y) < 10) { 
      health -=1;
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
      health2 -=1;
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
      health3 -=1;
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
      health -=1;
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
      health2 -=1;
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
      health3 -=1;
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
  }

  void enemydissapearlvl1() {
    if (health == 0) {
      level.xp+=60;
    }
    if (health2 == 0) {
      level.xp+=80;
    }
    if (health3 == 0) {
      level.xp+=100;
      player.lives+=1;
    }
  }
  void enemydissapearlvl2() {
    if (health4 == 0) {
      level.xp+=80;
    }
    if (health5 == 0) {
      level.xp+=100;
    }
    if (health6 == 0) {
      level.xp+=120;
    }
  }
  void displaysurvival() {
    imagered = loadImage("enemyred.png");
    //enemydefeat
  }
}