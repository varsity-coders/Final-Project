class Enemy {
  PImage image, imagered;
  float x, y; 
  float picvel;
  float x2, y2;
  float picvel2;
  float x3, y3; 
  float picvel3;
  float health, health2, health3;
  boolean draw, draw2, draw3;
  Enemy() {
    x = random(400,560);
    x2 = random(440,960);
    x3 = random(400,560);
    picvel = -random(0.5, 2);
    picvel2 = random(1, 2);
    picvel3 = random(1, 2.5);
    y = height/2-255;
    y2 =height/2-55;
    y3 = height/2+145;
    health = 15;
    health2 = 30;
    health3 = 45;
    image  = loadImage("enemy.png");
    draw=true;
    draw2=true;
    draw3=true;
  }

  void displaylvl1() {
          println(enemy.health);
                println(enemy.health2);
      println(enemy.health3);
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
    if (x+40>= 600) {
      picvel*=-1;
    }
    if (x-40<=0) {
      picvel*=-1;
    }
    if (x2+40>= width) {
      picvel2*=-1;
    }
    if (x2-40<=400) {
      picvel2*=-1;
    }
    if (x3+40>= width) {
      picvel3*=-1;
    }
    if (x3-40<=0) {
      picvel3*=-1;
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
    if ( dist(x3, y3, shoot.x2, shoot.y2) < 10) { 
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

  void enemydissapear() {
    if (health == 0) {
      level.xp+=60;
    }
        if (health2 == 0) {
      level.xp+=80;
    }
        if (health3 == 0) {
      level.xp+=100;
    }
  }
  void displaysurvival() {
    imagered = loadImage("enemyred.png");
    //enemydefeat
  }
}